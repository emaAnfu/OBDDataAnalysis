% This function computes the mean time interval between one gear shift and
% another and the mean amplitude of deltaRPM

function [meanDeltaT_gs, meanDeltaRPM] = ComputeGearShifts(R, Rder, t)
% function ComputeGearShifts()
%
% meanDeltaT_gs - vector 
% meanDeltaRPM - vector
%
% ComputeGearShifts();

% Get the number of rows (subssessions)
m = size(Rder,1);
% Get the number of columns
n = size(Rder,2);

% Prepare output vectors
meanDeltaT_gs = zeros(m,1);
meanDeltaRPM = zeros(m,1);

% Create a matrix m*n where a 1 means there has been a gear shift, 0 no
R_gearShifts = zeros(m,n);

% Threshold of a gear shift
delta = 300;

% Identification of gear shifts
R_gearShifts = Rder > delta;

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

end






