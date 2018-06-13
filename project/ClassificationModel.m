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

% Dealing with offset: remove mean value from each example
if(false)
    M = mean(X);
    for i = 1:p
        X(:,i) = X(:,i) - M(i);
    end
end

% Without the meanSpeed (maybe the most determinant feature)
if(false)
    X = X(:, 4:7);
end

% Divide dataset into training set and test set
n_train = 20;
n_test = n-n_train;
[Xtr, Ytr, Xts, Yts] = randomSplitDataset(X, Y, n_train, n_test);

%% Plot dataset if 2D

if (p==2)
    figure;
    scatter(Xtr(:,1),Xtr(:,2),25,Ytr);
    title('Training set')
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

%% II attempt - regularized linear least squares

lambdaArray = [0 1e-5 1e-2 1e-1 1 1e1];
nLambda = size(lambdaArray,2);
err=ones(1,nLambda)*99;
i=1;

%lambda = lambda(6);

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
    
    i = i + 1;
end

end

%% III Attempt - Logistic Regression

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















