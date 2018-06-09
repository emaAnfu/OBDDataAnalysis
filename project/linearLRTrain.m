function w = linearLRTrain(Xtr, Ytr, lambda)
    epsilon = 1e-6;
    iter = 10000;
    
    [n, d] = size(Xtr);
    w = zeros(d,1);
    L = eigs(Xtr*Xtr', 1)/n + lambda;
    gamma = 1/L;
    
    j=0;
    fold = 0;
    f = inf;
    while j < iter && abs(f - fold) >= epsilon
        fold = f;
        j = j + 1;
        p = exp(-Ytr.* (Xtr*w));
        w = w - gamma*(-(1/n)*Xtr'*(Ytr.*p./(1+p)) + 2*lambda*w);
        f = sum(log(1 + exp(-Ytr.*(Xtr*w))))/n + lambda*w'*w;
        %disp(['iter:', num2str(j),'  err:', num2str(abs(f - fold))]);
    end
end