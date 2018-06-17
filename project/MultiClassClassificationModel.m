clc
clear 
close all

load('obd_dataset.mat');
load('YmmDataset');

% Number of examples
n=size(X,1);
% Number of features
m=size(X,2);
% Number of classes
T=size(Ymm,2);

% Number of features to take
p = 2;
% Select actual variables to use to classify
if (p == 2)
    X = [X(:,1) X(:,7)];
end

% Detect maximums of the features for the scatter grid
if (p == 2)
   maximums = max(X);
   maxFirstFeature = maximums(1);
   maxSecondFeature = maximums(2);
end

% Divide dataset into training set and test set
n_train = 30;
n_test = n-n_train;
[Xtr, Ymmtr, Xts, Ymmts] = randomSplitDataset_forMulticlass(X, Ymm, n_train, n_test);

% Dealing with offset: remove mean value from each example
Xc_tr = zeros(size(Xtr,1),size(Xtr,2));
Xmean_tr = mean(Xtr);
for i = 1:p
    Xc_tr(:,i) = Xtr(:,i) - Xmean_tr(i);    
end
Yc_tr = zeros(size(Ymmtr,1),size(Ymmtr,2));
Ymean_tr = mean(Ymmtr);
for i = 1:T
    Yc_tr(:,i) = Ymmtr(:,i) - Ymean_tr(i);    
end

% Prepare class labels for test
labels_test = zeros(n_test,1);
for i = 1:n_test
    if(Ymmts(i,1)==+1)
        labels_test(i)=1;
    elseif(Ymmts(i,2)==+1)
        labels_test(i)=2;
    elseif(Ymmts(i,3)==+1)
        labels_test(i)=3;
    end
end


%% Plot dataset if 2D
close all

if (p==2)
    
    figure;
    subplot(1,2,1)   
    scatter(Xtr(:,1),Xtr(:,2),25,Ymmtr,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
    axis([0 maxFirstFeature 0 maxSecondFeature])
    title('Training set')  
    subplot(1,2,2)  
    scatter(Xts(:,1),Xts(:,2),25,Ymmts,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
    axis([0 maxFirstFeature 0 maxSecondFeature])
    title('Test set')
    
    figure;
    subplot(1,2,1)    
    scatter(Xtr(:,1),Xtr(:,2),25,Ymmtr,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
    axis([0 maxFirstFeature 0 maxSecondFeature])
    title('Training set')  
    subplot(1,2,2)    
    scatter(Xc_tr(:,1),Xc_tr(:,2),25,Ymmtr,'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
    title('Training set centered')
end

%% RLS Multi-class, one vs. all

if(false)

lambdaArray = [0 1e-5 1e-2 1e-1 1 1e1];
lambda = lambdaArray(6);

W = zeros(p,T);
B = zeros(1,T);

% Training
for i = 1:T    
    w_temp = regularizedLSTrain(Xc_tr, Yc_tr(:,i), lambda);
    b_temp = Ymean_tr(i) - Xmean_tr*w_temp;    
    W(:,i) = w_temp; 
    B(i) = b_temp;
    if(p==2)
        figure
        scatter(Xtr(:,1),Xtr(:,2),25,Ymmtr(:,i),'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
        separatingFRLS_withOffset(w_temp, b_temp, Xtr, Ymmtr(:,i)); 
        title(['RLS with offset Training set with \lambda: ', num2str(lambda)])
    end
end

% Test
labels_predicted = zeros(n_test,1);
err=0;
for i = 1:n_test
    y_pred = 0;
    for j = 1:T
        y_pred_temp = Xts(i,:)*W(:,j) + B(j);
        if(y_pred_temp>y_pred)
            y_pred = y_pred_temp;
            labels_predicted(i) = j;
        end
    end    
    if(labels_predicted(i)~=labels_test(i))
        err=err+1;
    end
end
err = err/n_test;

end

%% KRLS Multi-class, one vs. all

lambdaArray = [0 1e-5 1e-2 1e-1 1 1e1];
sigmaArray = [0 1e-1 1 10];
kernel = 'gaussian';
sigma=sigmaArray(4);%10
lambda = lambdaArray(6);

C = zeros(n_train,T);

% Training
for i = 1:T    
    c_temp = regularizedKernLSTrain(Xtr, Ymmtr(:,i), kernel, sigma, lambda);
    if(p==2)
        figure
        scatter(Xtr(:,1),Xtr(:,2),25,Ymmtr(:,i),'filled','MarkerEdgeColor',[0.5 .5 .5],'LineWidth',1);
        separatingFKernRLS(c_temp, Xtr, kernel, sigma, Xtr)
        title(['KRLS Training set with \lambda: ', num2str(lambda)])
    end
    C(:,i) = c_temp;
end

% Test
labels_predicted = zeros(n_test,1);
err=0;
for i = 1:n_test
    y_pred = 0;
    for j = 1:T
        y_pred_temp = regularizedKernLSTest(C(:,j), Xtr, kernel, sigma, Xts(i,:));        
        if(y_pred_temp>y_pred)
            y_pred = y_pred_temp;
            labels_predicted(i) = j;
        end
    end    
    if(labels_predicted(i)~=labels_test(i))
        err=err+1;
    end
end
err = err/n_test;












