function [ypred, ppred] = linearLRTest(c, Xts)
    ypred = Xts*c;
    ppred = exp(ypred)./(1+exp(ypred));
end