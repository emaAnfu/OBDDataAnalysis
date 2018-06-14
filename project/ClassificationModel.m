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

% Detect max speed and max #gearShifts for the scatter grid
if (p == 2)
   maximums = max(X);
   maxMeanSpeed = maximums(1);
   maxShifts = maximums(2);
end

% Without the meanSpeed (maybe the most determinant feature)
if(false)
    X = X(:, 4:7);
end

% Divide dataset into training set and test set
n_train = 15;
n_test = n-n_train;
[Xtr, Ytr, Xts, Yts] = randomSplitDataset(X, Y, n_train, n_test);

%% Dealing with offset: remove mean value from each example

Xc_tr = zeros(size(Xtr,1),size(Xtr,2));
Xmean_tr = mean(Xtr);
for i = 1:p
    Xc_tr(:,i) = Xtr(:,i) - Xmean_tr(i);    
end
Ymean_tr = mean(Ytr);
Yc_tr = Ytr - Ymean_tr;

%% Plot dataset if 2D
close all

if (p==2)
    
    figure;
    subplot(1,2,1)   
    scatter(Xtr(:,1),Xtr(:,2),25,Ytr);
    axis([0 maxMeanSpeed 0 maxShifts])
    title('Training set')  
    subplot(1,2,2)  
    scatter(Xts(:,1),Xts(:,2),25,Yts);
    axis([0 maxMeanSpeed 0 maxShifts])
    title('Test set')
    
    figure;
    subplot(1,2,1)    
    scatter(Xtr(:,1),Xtr(:,2),25,Ytr);
    title('Training set')  
    subplot(1,2,2)    
    scatter(Xc_tr(:,1),Xc_tr(:,2),25,Ytr);
    title('Test set centered')
end

%% I attempt - kernel regularized least squares

sigmaArray = [0 1e-1 1 10];
linspace(0.1 , 10 , 2);
lambdaArray = [0 1e-5 1e-2 1e-1 1 1e1];
kernel = 'gaussian';
sigma=sigmaArray(4);%10
lambda=lambdaArray(2);%1e-5
c = regularizedKernLSTrain(Xtr, Ytr, kernel, sigma, lambda);
Ypred = sign(regularizedKernLSTest(c, Xtr, kernel, sigma, Xts));
err = calcErr(Ypred, Yts);

if (p == 2)
    figure
    
    subplot(1,2,1)
    scatter(Xtr(:,1),Xtr(:,2),25,Ytr);
    separatingFKernRLS(c, Xtr, kernel, sigma, Xtr, Yts)
    title('Training set')
    
    subplot(1,2,2)
    scatter(Xts(:,1),Xts(:,2),25,Yts);
    separatingFKernRLS(c, Xtr, kernel, sigma, Xts, Yts)
    hold on
    sel = (sign(Ypred) ~= Yts);
    scatter(Xts(sel,1),Xts(sel,2),200,Yts(sel),'x'); 
    hold off
    title('Test set KRLS')
    
end 

%% IIa attempt - regularized linear least squares with no offset

close all

lambdaArray = [0 1e-5 1e-2 1e-1 1 1e1];
lambdaArray = 100
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
        scatter(Xtr(:,1),Xtr(:,2),25,Ytr);
        separatingFRLS(w, Xtr, Ytr); 
        title(['RLS Training set with prediction error with \lambda: ', num2str(lambda)])

        subplot(1,2,2)
        scatter(Xts(:,1),Xts(:,2),25,Yts);
        separatingFRLS(w, Xts, Yts);    
        hold on
        sel = (sign(Ypred) ~= Yts);
        scatter(Xts(sel,1),Xts(sel,2),200,Yts(sel),'x'); 
        hold off
        title(['RLS Test set with prediction error with \lambda: ', num2str(lambda)])
       
    end
    
     i = i + 1;

end

%% IIb attempt - regularized linear least squares with offset

close all

lambdaArray = [0 1e-5 1e-2 1e-1 1 1e1];
lambdaArray = [100]
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
        scatter(Xtr(:,1),Xtr(:,2),25,Ytr);
        separatingFRLS_withOffset(w, b, Xtr, Ytr); 
        title(['RLS with offset Training set with prediction error with \lambda: ', num2str(lambda)])

        subplot(1,2,2)
        scatter(Xts(:,1),Xts(:,2),25,Yts);
        separatingFRLS_withOffset(w, b, Xts, Yts);    
        hold on
        sel = (sign(Ypred) ~= Yts);
        scatter(Xts(sel,1),Xts(sel,2),200,Yts(sel),'x'); 
        hold off
        title(['RLS with offset Test set with prediction error with \lambda: ', num2str(lambda)])
       
    end
    
     i = i + 1;

end

%% IIIa Attempt - Logistic Regression with no offset

i=1;
lambdaArray = [0 10];
err = ones(1,size(lambdaArray,2))*99;

for lambda = lambdaArray
    
    c = linearLRTrain(Xtr, Ytr, lambda);
    
    [Ypred, ppred] = linearLRTest(c, Xts);
    
    err(i) = calcErr(Ypred, Yts);

    figure(1)
    subplot(1,2,i)
    scatter(Xts(:,1),Xts(:,2),25,Yts);
    hold on
    sel = (sign(Ypred) ~= Yts);
    scatter(Xts(sel,1),Xts(sel,2),200,Yts(sel),'x'); 
    separatingLinearLR(c, Xts, Yts)
    title(['Test set with prediction error with \lambda: ', num2str(lambda)])
    hold off
        
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
    scatter(Xts(:,1),Xts(:,2),25,Yts);
    hold on
    sel = (sign(Ypred) ~= Yts);
    scatter(Xts(sel,1),Xts(sel,2),200,Yts(sel),'x'); 
    separatingLinearLR_withOffset(c, b, Xts, Yts)
    title(['Test set with prediction error with \lambda: ', num2str(lambda)])
    hold off
        
    i=i+1;

end 














