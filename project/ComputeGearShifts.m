% This function computes the mean time interval between one gear shift and
% another and the mean amplitude of deltaRPM

% A gear shift happens when r(k)-r(k-1)<(-delta), where delta is a const
% Example: 1800-2000=-200

% I coumputed the first derivative of rpm as a simple difference between
% samples, so I can consider directly that vector

function [meanDeltaT_gs, meanDeltaRPM, countGS] = ComputeGearShifts(R, Rder, t)
% function ComputeGearShifts()
%
% meanDeltaT_gs - vector 
% meanDeltaRPM - vector
% countGS - vector, number of gear shift for each subsession
%
% ComputeGearShifts();

% Get the number of rows (subssessions)
m = size(Rder,1);
% Get the number of columns
n = size(Rder,2);

% Prepare output vectors
meanDeltaT_gs = zeros(m,1);
meanDeltaRPM = zeros(m,1);
countGS = zeros (m,1);

% Threshold of a gear shift
delta = 175;

% Create a matrix m*n where a 1 means there has been a gear shift, 0 no
R_gearShifts = Rder < (-delta);

% Compute average deltaT between gear shifts
for i = 1:m
    sel = (R_gearShifts(i,:)==1);
    temp = t(sel);
    t1=0;
    for j = 2:size(temp,2)
        t1 = t1 + (temp(j)-temp(j-1));
    end
    meanDeltaT_gs(i) = t1/size(temp,1);
end

% Compute mean amplitude
for i = 1:m
    sel = (R_gearShifts(i,:)==1);
    temp = Rder(i,sel);
    meanDeltaRPM(i) = mean(temp);
end

% Count of gear shifts for each subsession
for i = 1:m
    sel = (R_gearShifts(i,:)==1);
    countGS(i) = sum(sel(:) == 1);
end

end






