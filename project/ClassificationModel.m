% This file is used to load the dataset, split it into training and test
% set, re-center data if needed and perform binary classification with 
% several algorithms

%% Run this section to load dataset 

if(true)
    
clc
clear
close all

load('obd_dataset.mat');

% Number of examples
n=size(X,1);
% Number of features
m=size(X,2);

% Number of features to take
p = 2;
% Select actual variables to use to classify
if (p == 2)
    X = [X(:,1) X(:,7)];
end

% Detect maximums of the features for the scatter grid
if (p == 2)
   maximums = max(X);
   maxFirstFeature = maximums(1);
   maxSecondFeature = maximums(2);
end

% Without the meanSpeed (maybe the most determinant feature)
if(false)
    X = X(:, 4:7);
end

% Divide dataset into training set and test set
n_train = 30;
n_test = n-n_train;
[Xtr, Ytr, Xts, Yts] = randomSplitDataset(X, Y, n_train, n_test);

% Dealing with offset: remove mean value from each example

Xc_tr = zeros(size(Xtr,1),size(Xtr,2));
Xmean_tr = mean(Xtr);
for i = 1:p
    Xc_tr(:,i) = Xtr(:,i) - Xmean_tr(i);    
end
Ymean_tr = mean(Ytr);
Yc_tr = Ytr - Ymean_tr;

end

%% Plot dataset if 2D
close all

if (p==2)
    
    figure;
    subplot(1,2,1)   
    scatter(Xtr(:,1),Xtr(:,2),25,Ytr,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
    axis([0 maxFirstFeature 0 maxSecondFeature])
    title('Training set')  
    xlabel('mean speed')
    ylabel('# of gear shifts')
    subplot(1,2,2)  
    scatter(Xts(:,1),Xts(:,2),25,Yts,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
    axis([0 maxFirstFeature 0 maxSecondFeature])
    title('Test set')
    xlabel('mean speed')
    ylabel('# of gear shifts')
    
    figure;
    subplot(1,2,1)    
    scatter(Xtr(:,1),Xtr(:,2),25,Ytr,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
    axis([0 maxFirstFeature 0 maxSecondFeature])
    title('Training set') 
    xlabel('mean speed')
    ylabel('# of gear shifts')
    subplot(1,2,2)    
    scatter(Xc_tr(:,1),Xc_tr(:,2),25,Ytr,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
    title('Training set centered')
    xlabel('mean speed')
    ylabel('# of gear shifts')
end

%% I attempt - kernel regularized least squares

if (true)
    
close all
clc

sigmaArray = [0 1e-1 1 10];
linspace(0.1 , 10 , 2);
lambdaArray = [0 1e-5 1e-2 1e-1 1 1e1];
kernel = 'gaussian';
sigma=sigmaArray(4);%10
lambda=lambdaArray(5);%1e-5

nLambda = size(lambdaArray,2);
err=ones(1,nLambda)*99;
i=1;

for lambda = lambdaArray

    c = regularizedKernLSTrain(Xtr, Ytr, kernel, sigma, lambda);
    Ypred = sign(regularizedKernLSTest(c, Xtr, kernel, sigma, Xts));
    err(i) = calcErr(Ypred, Yts);

    if (p == 2)
        figure(i);

        subplot(1,2,1)
        scatter(Xtr(:,1),Xtr(:,2),25,Ytr,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
        separatingFKernRLS(c, Xtr, kernel, sigma, Xtr)
        axis([0 maxFirstFeature 0 maxSecondFeature])
        title(['Training set KRLS with \lambda: ', num2str(lambda)])
        xlabel('mean speed')
        ylabel('# of gear shifts')

        subplot(1,2,2)
        scatter(Xts(:,1),Xts(:,2),25,Yts,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
        separatingFKernRLS(c, Xtr, kernel, sigma, Xts)
        axis([0 maxFirstFeature 0 maxSecondFeature])
        hold on
        sel = (sign(Ypred) ~= Yts);
        scatter(Xts(sel,1),Xts(sel,2),200,Yts(sel),'x','MarkerEdgeColor',[0.5 .5 .5]); 
        hold off
        title(['Test set KRLS with \lambda: ', num2str(lambda)])
        xlabel('mean speed')
        ylabel('# of gear shifts')

    end 
    
    i = i + 1;

end

end

%% IIa attempt - regularized linear least squares with no offset

if(false)

close all
clc

lambdaArray = [0 1e-5 1e-2 1e-1 1 1e1];
%lambdaArray = 100
nLambda = size(lambdaArray,2);
err=ones(1,nLambda)*99;
i=1;

for lambda = lambdaArray
    
    w = regularizedLSTrain(Xtr, Ytr, lambda);
    Ypred = sign(regularizedLSTest(w, Xts));
    err(i) = calcErr(Ypred, Yts);

    if (p == 2)
        figure(i);

        subplot(1,2,1)
        scatter(Xtr(:,1),Xtr(:,2),25,Ytr,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
        separatingFRLS(w, Xtr, Ytr); 
        title(['RLS Training set with \lambda: ', num2str(lambda)])
        xlabel('mean speed')
        ylabel('# of gear shifts')

        subplot(1,2,2)
        scatter(Xts(:,1),Xts(:,2),25,Yts,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
        separatingFRLS(w, Xts, Yts);    
        hold on
        sel = (sign(Ypred) ~= Yts);
        scatter(Xts(sel,1),Xts(sel,2),200,Yts(sel),'x','MarkerEdgeColor',[0.5 .5 .5]); 
        hold off
        title(['RLS Test set with prediction error with \lambda: ', num2str(lambda)])
        xlabel('mean speed')
        ylabel('# of gear shifts')
       
    end
    
     i = i + 1;

end

end

%% IIb attempt - regularized linear least squares with offset

if(true)

close all
clc

lambdaArray = [0 1e-5 1e-2 1e-1 1 1e1];
%lambdaArray = [100]
nLambda = size(lambdaArray,2);
err=ones(1,nLambda)*99;
i=1;

for lambda = lambdaArray
    
    [w] = regularizedLSTrain(Xc_tr, Yc_tr, lambda);
    b = Ymean_tr - Xmean_tr*w;
    Ypred = sign(regularizedLSTest_withOffset(w, b, Xts));
    err(i) = calcErr(Ypred, Yts);
    
    if (p == 2)
        figure(i);

        subplot(1,2,1)
        scatter(Xtr(:,1),Xtr(:,2),25,Ytr,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
        separatingFRLS_withOffset(w, b, Xtr, Ytr); 
        title(['RLS with offset Training set with \lambda: ', num2str(lambda)])
        xlabel('mean speed')
        ylabel('# of gear shifts')

        subplot(1,2,2)
        scatter(Xts(:,1),Xts(:,2),25,Yts,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
        separatingFRLS_withOffset(w, b, Xts, Yts);
        hold on
        sel = (sign(Ypred) ~= Yts);
        scatter(Xts(sel,1),Xts(sel,2),200,Yts(sel),'x','MarkerEdgeColor',[0.5 .5 .5]); 
        hold off
        title(['RLS with offset Test set with \lambda: ', num2str(lambda)])
        xlabel('mean speed')
        ylabel('# of gear shifts')
       
    end
    
     i = i + 1;

end

end

%% IIIa Attempt - Logistic Regression with no offset

if (true)

i=1;
lambdaArray = [0 1e-5 1e-2 1e-1 1 1e1];
err = ones(1,size(lambdaArray,2))*99;

for lambda = lambdaArray
    
    c = linearLRTrain(Xtr, Ytr, lambda);   
    [Ypred, ppred] = linearLRTest(c, Xts);    
    err(i) = calcErr(Ypred, Yts);

    if (p==2)
        figure(1)
        subplot(1,2,i)
        scatter(Xts(:,1),Xts(:,2),25,Yts,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
        hold on
        sel = (sign(Ypred) ~= Yts);
        scatter(Xts(sel,1),Xts(sel,2),200,Yts(sel),'x','MarkerEdgeColor',[0.5 .5 .5]); 
        separatingLinearLR(c, Xts, Yts)
        title(['Test set with prediction error with \lambda: ', num2str(lambda)])
        xlabel('mean speed')
        ylabel('# of gear shifts')
        hold off
    end
        
    i=i+1;

end 

%% IIIb Attempt - Logistic Regression with offset 

% -> it doesn't work, probably because the solution of the minimization
% problem over w and b is not so simple when considering other loss
% function than square loss

close all

i=1;
lambdaArray = [0 10];
err = ones(1,size(lambdaArray,2))*99;

for lambda = lambdaArray
    
    c = linearLRTrain(Xc_tr, Yc_tr, lambda);
    b = Ymean_tr - Xmean_tr*w;
    
    [Ypred, ppred] = linearLRTest_withOffset(c, b, Xts);
    
    err(i) = calcErr(Ypred, Yts);

    figure(1)
    subplot(1,2,i)
    scatter(Xts(:,1),Xts(:,2),25,Yts,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
    hold on
    sel = (sign(Ypred) ~= Yts);
    scatter(Xts(sel,1),Xts(sel,2),200,Yts(sel),'x','MarkerEdgeColor',[0.5 .5 .5]); 
    separatingLinearLR_withOffset(c, b, Xts, Yts)
    title(['Test set with prediction error with \lambda: ', num2str(lambda)])
    xlabel('mean speed')
    ylabel('# of gear shifts')
    hold off
        
    i=i+1;

end 

end

%% IV Attempt - Orthogonal Matching Pursuit

close all

% perform cross-validation to find the best number of iterations 

intIter = 2:p;
perc=0.3;
nrip=10;
[it, Vm, Vs, Tm, Ts] = holdoutCVOMP(Xtr, Ytr, perc, nrip, intIter);

figure
plot(intIter, Tm, 'r');
hold on;
plot(intIter, Vm, 'b');
hold off;
title('Training (red) and validation (blue) error');

% use it to run OMP

T = it;
[ w, r, I ] = OMatchingPursuit( Xtr, Ytr, T);

Ypred = sign(Xts * w);
err = calcErr(Yts, Ypred);

if (p == 2)
    figure

    subplot(1,2,1)
    scatter(Xtr(:,1),Xtr(:,2),25,Ytr,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
    separatingFRLS(w, Xtr, Ytr); 
    title(['OMP without offset Training set'])

    subplot(1,2,2)
    scatter(Xts(:,1),Xts(:,2),25,Yts,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
    separatingFRLS(w, Xts, Yts);
    hold on
    sel = (sign(Ypred) ~= Yts);
    scatter(Xts(sel,1),Xts(sel,2),200,Yts(sel),'x','MarkerEdgeColor',[0.5 .5 .5]); 
    hold off
    title(['OMP with offset Test set '])

end

figure
scatter(1:p, abs(w), 'filled')
title('Coefficients  w');














