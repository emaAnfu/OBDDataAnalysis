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

% Divide dataset into training set and test set
n_train = 7;
n_test = n-n_train;
[Xtr, Ytr, Xts, Yts] = randomSplitDataset(X, Y, n_train, n_test);

%% I attempt - kernel regularized least squares

sigmaArray = linspace(0.1 , 10 , 2);
lambdaArray = [ 0 logspace(-5 , 0 , 2) ];
kernel = 'gaussian';
sigma=sigmaArray(2);
lambda=lambdaArray(2);
c = regularizedKernLSTrain(Xtr, Ytr, kernel, sigma, lambda);
Ypred = sign(regularizedKernLSTest(c, Xtr, kernel, sigma, Xts));
err = calcErr(Ypred, Yts);
if (p == 2)
    scatter(Xts(:,1),Xts(:,2),25,Yts);
    separatingFKernRLS(c, Xtr, kernel, sigma, Xts, Yts)
end 

%% II attempt - regularized linear least squares

lambda = 10e-5;
w = regularizedLSTrain(Xtr, Ytr, lambda);
Ypred = sign(regularizedLSTest(w, Xts));
err = calcErr(Ypred, Yts);
if (p == 2)
    scatter(Xts(:,1),Xts(:,2),25,Yts);
    separatingFRLS(w, Xts, Yts);    
end 















