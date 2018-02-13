function c = regularizedKernLSTrain(Xtr, Ytr, kernel, sigma, lambda)
    n = size(Xtr,1);
    K = KernelMatrix(Xtr, Xtr, kernel, sigma);
    c = (K + lambda*n*eye(n))\Ytr;
end
