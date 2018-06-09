
X = [ 10 4; 5 20; 8 10]
Y = [ 1; 1; -1]

figure;
scatter(X(:,1),X(:,2),125,Y);

X = X - mean(X)