function y = regularizedKernLSTest(c, Xtr, kernel, sigma, Xts)
    Ktest = KernelMatrix(Xts, Xtr, kernel, sigma);
    y = Ktest*c;
end
