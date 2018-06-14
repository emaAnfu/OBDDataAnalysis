% written by Ema

function w = regularizedLSTrain_withOffset(Xtr, Ytr, lambda)
	n = size(Xtr,1);
    d = size(Xtr,2);
	w = (Xtr'*Xtr + n*lambda*eye(d))\(Xtr'*Ytr);
end