% written by Ema

function [Xtr, Ymmtr, Xts, Ymmts] = randomSplitDataset_forMulticlass(X, Ymm, n_train, n_test)
    n = size(X,1);
    I = randperm(n);
    I1 = I(1:n_train);
    I2 = I((n_train+1):(n_train+n_test));
    
    Xtr = X(I1,:);
    Ymmtr = Ymm(I1,:);
    
    Xts = X(I2,:);
    Ymmts = Ymm(I2,:);
end