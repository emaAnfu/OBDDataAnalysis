% First classifier: on the basis of mean(acc) select which subsession
% measure corresponds to a moment of acceleration/deceleration and which to
% moments of constant speed; these last aren't really significative to
% identify differences in driving style, except for their mean value
% related to the mean value of rpm

function [I_meanAcc_labels, R1, V1, Rder1, Vder1, Y1, R2, V2, Rder2, ...
    Vder2, Y2, R3, V3, Rder3, Vder3, Y3] = I_Classifier_MeanAcceleration(R, V, Rder, Vder, Yr, Yv)
% function I_Classifier_MeanAcceleration()
%
% Vder - matrix of acceleration data, i.e. first derivative of speed
%
% I_meanAcc_labels - one label for each subsession: +1 -> accelerating
%                                                   0  -> constant
%                                                   -1 -> decelerating
%
% I_Classifier_MeanAcceleration();

% Check correctness of labels vector
if (Yr~=Yv)
    display('Error with labels vector');
    return;
end
Y = Yr;

% Get the number of rows (subssessions)
m = size(Vder,1);

% Get the number of columns
n = size(R,2);

% Labels vector
I_meanAcc_labels = zeros(m,1);

% Compute mean value of accelerations
meanAcc = mean(Vder, 2);

% Threshold
eps = 0.5;

for i = 1:m
    if (meanAcc(i)>eps)
        I_meanAcc_labels(i)=+1;
    elseif (meanAcc(i) > (-eps))
        I_meanAcc_labels(i)=0;
    else
        I_meanAcc_labels(i)=-1;
    end
end

% Get numbers of examples of each phase
sel = (I_meanAcc_labels==+1);
m1 = size (I_meanAcc_labels(sel,1),1);
sel = (I_meanAcc_labels==0);
m2 = size (I_meanAcc_labels(sel,1),1);
sel = (I_meanAcc_labels==-1);
m3 = size (I_meanAcc_labels(sel,1),1);

% Create 3*4 matrices, four for each of the three phases
% Acceleretion
R1 = zeros(m1,n);
V1 = zeros(m1,n);
Rder1 = zeros(m1,n-1);
Vder1 = zeros(m1,n-1);
Y1 = zeros(m1,1);
% Constant
R2 = zeros(m2,n);
V2 = zeros(m2,n);
Rder2 = zeros(m2,n-1);
Vder2 = zeros(m2,n-1);
Y2 = zeros(m2,1);
% Deceleration
R3 = zeros(m3,n);
V3 = zeros(m3,n);
Rder3 = zeros(m3,n-1);
Vder3 = zeros(m3,n-1);
Y3 = zeros(m3,1);
% Indeces for matrices filling
i1=1;
i2=1;
i3=1;
for i = 1:m
    if (I_meanAcc_labels(i) == +1)
        R1(i1,:) = R(i,:);
        V1(i1,:) = V(i,:);
        Rder1(i1,:) = Rder(i,:);
        Vder1(i1,:) = Vder(i,:);
        Y1(i1) = Y(i);
        i1=i1+1;
    elseif (I_meanAcc_labels(i) == 0)
        R2(i2,:) = R(i,:);
        V2(i2,:) = V(i,:);
        Rder2(i2,:) = Rder(i,:);
        Vder2(i2,:) = Vder(i,:);
        Y2(i2) = Y(i);
        i2=i2+1;
    else
        R3(i3,:) = R(i,:);
        V3(i3,:) = V(i,:);
        Rder3(i3,:) = Rder(i,:);
        Vder3(i3,:) = Vder(i,:);
        Y3(i3) = Y(i);
        i3=i3+1;
    end
end

end






