function separatingFKernRLS(c, Xtr, kernel, sigma, Xts, Yts)
% function separatingFKernRLS(w, Xtr, kernel, sigma, Xts, Yts)
% the function classifies points evenly sampled in a visualization area,
% according to the classifier Regularized Least Squares
%
% c - coefficents of the function
% Xtr - training examples
% kernel, sigma - parameters used in learning the function
% Xts - test examples on which to plot the separating function
% Yts - test labels (they must be {-1, +1})
%
% lambda = 0.01;
% kernel = 'gaussian';
% sigma = 1;
% [Xtr, Ytr] = MixGauss([[0;0],[1;1]],[0.5,0.25],100);
% [Xts, Yts] = MixGauss([[0;0],[1;1]],[0.5,0.25],100);
% Ytr(Ytr==2) = -1;
% Yts(Yts==2) = -1;
% c = regularizedKernLSTrain(Xtr, Ytr, kernel, sigma, lambda);
% separatingFKernRLS(c, Xtr, kernel, sigma, Xts, Yts);

    step = 0.05;

    x = min(Xts(:,1)):step:max(Xts(:,1));
    y = min(Xts(:,2)):step:max(Xts(:,2));
    
%     x = 0:step:130;
%     y = 0:step:50;

    [X, Y] = meshgrid(x, y);
    XGrid = [X(:), Y(:)];
    
    YGrid = regularizedKernLSTest(c, Xtr, kernel, sigma, XGrid);

    hold on
    contour(x, y, reshape(YGrid,numel(y),numel(x)),[0;0]);
    hold off
end
