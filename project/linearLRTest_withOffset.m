function [ypred, ppred] = linearLRTest_withOffset(c, b, Xts)
    ypred = Xts*c + b;
    ppred = exp(ypred)./(1+exp(ypred));
end