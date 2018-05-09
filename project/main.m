% This file executes all the operations needed to perform driving condition
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

% Compute number of gear shifts
[meanDeltaT_gs, meanDeltaRPM, countGS] = ComputeGearShifts(R, Rder, t);

%% First trial


%% Plot an example, if you want
if (true)    

figure 
i = 3;

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

end






















