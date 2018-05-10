

% DEPRECATED: used when I was looking at the FFT

clc
clear
close all

load('obd_dataset.mat');

% Number of examples
n=size(X,1);
% Number of discrete frequencies (-> features)
m=size(X,2);

% Number of discrete frequencies to take
p = 100;
% Select actual variables to use to classify
X=[X(:,1:p) X(:,201:201+p-1)];

% Divide dataset into training set and test set
n_train = floor(n*2/3);
n_test = n-n_train;
[Xtr, Ytr, Xts, Yts] = randomSplitDataset(X, Y, n_train, n_test);

%% kernel regularized least squares

sigmaArray = linspace(0.1 , 10 , 2);
lambdaArray = [ 0 logspace(-5 , 0 , 2) ];
kernel = 'gaussian';
sigma=sigmaArray(2);
lambda=lambdaArray(2);
c = regularizedKernLSTrain(Xtr, Ytr, kernel, sigma, lambda);
Ypred = sign(regularizedKernLSTest(c, Xtr, kernel, sigma, Xts));
err = calcErr(Ypred, Yts);
if (p == 1)
    scatter(Xts(:,1),Xts(:,2),25,Yts);
    separatingFKernRLS(c, Xtr, kernel, sigma, Xts, Yts)
end 

%% make a "manual" test

% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/27-12-17_14-44-14_rpm_measure_converted.txt';
speedFile = './UsedForDataset/27-12-17_14-44-15_speed_measure_converted.txt';
plotFlag=0;
[Xsplitted, Ysplitted, Xfft_splitted, Yfft_splitted] = SplitMeasure (rpmFile, speedFile, plotFlag);
% Prepare classification labels (ema)
labels = ones(size(Xfft_splitted,1),1) * (+1);
% Prepare this "little" test set
% Normalize RPM and speed
maxRPM=4000;
maxSpeed=130;
Xtestm = [Xfft_splitted./maxRPM Yfft_splitted./maxSpeed];
Ytestm = labels;

% Select actual variables to use to classify
Xtestm=[Xtestm(:,1:p) Xtestm(:,201:201+p-1)];

% Predict on this little test set
Ypred_little = sign(regularizedKernLSTest(c, Xtr, kernel, sigma, Xtestm));
err_little = (sign(Ypred_little)~=sign(Ytestm));
















