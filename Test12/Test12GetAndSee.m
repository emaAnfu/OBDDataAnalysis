% this measures are taken with Tc not fixed and should be 1000 samples
% ema

clear
clc
close all

% Get data from the txt file created by phone

rpmFile = '27-12-17_12-02-44_rpm_measure_converted.txt';
speedFile = '27-12-17_12-02-44_speed_measure_converted.txt';

splitFactor = 40;
Ts = 0.250;       

[Xsplitted, Ysplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 1);

[Xfft, Yfft] = ComputeFFT(Xsplitted, Ysplitted, tsplitted, Ts, 0);

[Xder, Yder] = ComputeFirstDerivative (Xsplitted, Ysplitted, tsplitted, Ts, 1);