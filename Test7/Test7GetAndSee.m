% this measures are taken with Tc not fixed and should be 1000 samples
% jenny

clear
clc
close all

% Get data from the txt file created by phone

rpmFile = '27-12-17_12-17-30_rpm_measure_converted.txt';
speedFile = '27-12-17_12-17-30_speed_measure_converted.txt';
timeFile = '27-12-17_12-17-30_time_of_response.txt';

splitFactor = 20;
Ts = 0.250;       

[Xsplitted, Ysplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);

[Xfft, Yfft] = ComputeFFT(Xsplitted, Ysplitted, tsplitted, Ts, 0);

[Xder, Yder] = ComputeFirstDerivative (Xsplitted, Ysplitted, tsplitted, 1);










