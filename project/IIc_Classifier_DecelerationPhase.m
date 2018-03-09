% Classifier IIc: given data related to deceleration moment, build
% classification model 

function [] = IIc_Classifier_DecelerationPhase(R, V, Rder, Vder, Y)
% function IIc_Classifier_DecelerationPhase()
%
% IIc_Classifier_DecelerationPhase();

% Get the number of rows (subssessions)
m = size(R,1);

% Get the number of columns
n = size(R,2);

% Create dataset for classification. Feature are: mean acc, mean deltaRPM
X = zeros(m,2);
for i = 1:m
   X(i,:) = [mean(Vder(i,:)), mean(Rder(i,:))]; 
end

% Plot dataset in 2d space
figure
scatter(X(:,1),X(:,2),25,Y);
title ('Dataset of deceleration subsessions');
xlabel('mean(acc)')
ylabel('mean(deltaRPM)')

end