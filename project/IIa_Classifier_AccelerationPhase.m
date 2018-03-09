% Classifier IIa: given data related to acceleration moment, build
% classification model

function [] = IIa_Classifier_AccelerationPhase(R, V, Rder, Vder, Y)
% function IIa_Classifier_AccelerationPhase()
%
% IIa_Classifier_AccelerationPhase();

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
title ('Dataset of acceleration subsessions');
xlabel('mean(acc)')
ylabel('mean(deltaRPM)')

end