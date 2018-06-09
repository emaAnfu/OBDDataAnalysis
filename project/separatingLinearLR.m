function separatingLinearLR(c, Xts, Yts)
% function confidenceLRKern(c, Xts, Yts)
% the function plots the separating function
%
% c - coefficents of the function
% Xts - test examples on which to plot the separating function
% Yts - test labels (they must be {-1, +1})
%
% lambda = 0.01;
% [Xtr, Ytr] = MixGauss([[-1;-1],[1;1]],[0.5,0.25],1000);
% [Xts, Yts] = MixGauss([[-1;-1],[1;1]],[0.5,0.25],1000);
% Ytr(Ytr==2) = -1;
% Yts(Yts==2) = -1;
% c = linearLRTrain(Xtr, Ytr, lambda);
% separatingLinearLR(c, Xts, Yts);

    step = 0.05;

    x = min(Xts(:,1)):step:max(Xts(:,1));
    y = min(Xts(:,2)):step:max(Xts(:,2));

    [X, Y] = meshgrid(x, y);
    XGrid = [X(:), Y(:)];
    
    [YGrid, ~] = linearLRTest(c, XGrid);
%     Yprob = Yts;
%     Yprob(Yprob==-1) = 0;
%     scatter(Xts(:,1), Xts(:,2), 25, Yprob,'filled');
%     hold on
    contour(x, y, reshape(YGrid,numel(y),numel(x)),[0,0]);
%     hold off
end