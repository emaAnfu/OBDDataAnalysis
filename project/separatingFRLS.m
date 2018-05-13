function separatingFRLS(w, Xts, Yts)
% function separatingF(w, Xts, Yts)
% the function classifies points evenly sampled in a visualization area,
% according to the classifier Regularized Least Squares. Then, it plots
% the separating function associated to the weights vector w.
%
% w - coefficents of the RLS classifier
% Xts - test examples on which to plot the separating function
% Yts - test labels (they must be {-1, +1})
%
% lambda = 0.01;
% [Xtr, Ytr] = MixGauss([[0;0],[1;1]],[0.5,0.25],1000);
% [Xts, Yts] = MixGauss([[0;0],[1;1]],[0.5,0.25],1000);
% w = regularizedLSTrain(Xtr, Ytr, lambda);
% separatingFRLS(w, Xts , Yts);

    step = 0.05;

    x0 = [min(Xts(:,1)); min(Xts(:,2))];
    x1 = [max(Xts(:,1)); max(Xts(:,2))];

    XGrid = createGridPoints(x0, x1, step);
    
    YGrid = regularizedLSTest(w, XGrid);
 
    x = x0(1):step:x1(1);
    y = x0(2):step:x1(2);

    hold on
    contour(x, y, reshape(YGrid,numel(y),numel(x)), [0;0]);
    hold off
end


function Grid = createGridPoints(x0, x1, step)
    [X, Y] = meshgrid(x0(1):step:x1(1), x0(2):step:x1(2));
    Grid = [X(:), Y(:)];
end
