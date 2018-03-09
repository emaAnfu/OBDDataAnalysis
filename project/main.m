% This file executes all the operations needed to perform driver
% recognition, as it was a dummy "main"

clc
clear
close all

% Run OrganizeCollectedData script to create the measure dataset (I haven't
% made it as a function to better manage the adding of each measure 
% session)

% Load the measures dataset
R = load('rpmDataset.mat', 'X');
Yr = load('rpmDataset.mat', 'Y');
V = load('speedDataset.mat', 'X');
Yv = load('speedDataset.mat', 'Y');
R = R.X;
Yr = Yr.Y;
V = V.X;
Yv = Yv.Y;

% Set Ts to a reasonable value (a mean of the values used creating the
% dataset)
Ts = 0.250;
% Create time axe using that Ts (this is a source of noise, because it is
% like interpolating samples (with steps) in order to get a continuous
% signal and sample this signal with the new Ts
L = size(R,2);          % number of samples    
t = (0:L-1)*Ts;         % Time vector

% Compute first derivative of rpm (R) and speed (V)
[Rder, Vder] = ComputeFirstDerivative (R, V, t, Ts, 0);

%% First trial: based on classifier I and IIa, IIb, IIc

% First classification: constant, accelerating or decelerating phase?
[I_meanAcc_labels, R1, V1, Rder1, Vder1, Y1, R2, V2, Rder2, ...
    Vder2, Y2, R3, V3, Rder3, Vder3, Y3] = I_Classifier_MeanAcceleration(R, V, Rder, Vder, Yr, Yv);

% Now I have three dataset, each composed by rpm, speed and their
% derivative. One corresponds to acceleration subsessions, one to constant
% speed and one to deceleration. I try find feature that classify driving
% style in each of these moments.
% Classify constant speed subsessions
IIb_Classifier_ConstantSpeed(R2, V2, Rder2, Vder2, Y2);
% Classify acceleration subsessions
IIa_Classifier_AccelerationPhase(R1, V1, Rder1, Vder1, Y1);
% Classify deceleration subsessions
IIc_Classifier_DecelerationPhase(R3, V3, Rder3, Vder3, Y3);

sel = (I_meanAcc_labels==0);
I = I_meanAcc_labels(sel,1);

%% Second trial: compute deltaT between different gear shifts

[meanDeltaT_gs, meanDeltaRPM] = ComputeGearShifts(R, Rder, t(1:end-1));

%% Plot an example, if you want
if (true)    

figure 
i = 6;

subplot(2,2,1)
plot(t, R(i,:))
title(['rpm example n° ', num2str(i)]);
xlabel('t (s)')
ylabel('rpm')

subplot(2,2,3)
plot(t(1,1:end-1), Rder(i,:))
title(['first derivative of rpm example n° ', num2str(i)]);
xlabel('t (s)')
ylabel('der(rpm)')

subplot(2,2,2)
plot(t, V(i,:))
title(['speed example n° ', num2str(i)]);
xlabel('t (s)')
ylabel('km/h')

subplot(2,2,4)
plot(t(1,1:end-1), Vder(i,:))
title(['first derivative of speed example n° ', num2str(i)]);
xlabel('t (s)')
ylabel('km/h/s')

I_meanAcc_labels(i)

end






















