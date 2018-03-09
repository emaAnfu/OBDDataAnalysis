% Classifier IIb: given data related to constant speed moment, build
% classification model on the basis of mean speed and mean rpm

function [] = IIb_Classifier_ConstantSpeed(R, V, Rder, Vder, Y)
% function IIb_Classifier_ConstantSpeed()
%
% drivers_labels - one label for each subsession:  -1 -> jenny
%                                                  +1 -> ema 
%
% IIb_Classifier_ConstantSpeed();

% Get the number of rows (subssessions)
m = size(R,1);

% Get the number of columns
n = size(R,2);

% Create dataset for classification. Feature are: mean rpm, mean speed
X = zeros(m,2);
for i = 1:m
   X(i,:) = [mean(R(i,:)), mean(V(i,:))]; 
end

% Plot dataset in 2d space
figure
scatter(X(:,1),X(:,2),25,Y);
title ('Dataset of constant speed subsessions');
xlabel('mean(rpm)')
ylabel('mean(speed)')

end