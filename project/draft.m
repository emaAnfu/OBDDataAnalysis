
X = [ 2 0; 4 0; 2 2; 4 2]
Y = [ 1; 1; -1; -1]

figure;
scatter(X(:,1),X(:,2),125,Y);

p = size(X,2);
M = mean(X);

for i = 1:p
    X(:,i) = X(:,i) - M(i);
end

hold on
scatter(X(:,1),X(:,2),250,Y);