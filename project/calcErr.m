function err = calcErr(Ypred, Yts)
    err = mean(sign(Ypred)~=sign(Yts));
end