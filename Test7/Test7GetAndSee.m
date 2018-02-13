% this measures are taken with Tc not fixed and should be 1000 samples
% jenny

clear
clc
close all

% Get data from the txt file created by phone

rpmFile = '27-12-17_12-17-30_rpm_measure_converted.txt';
speedFile = '27-12-17_12-17-30_speed_measure_converted.txt';

plotFlag=1;

[Xsplitted, Ysplitted, Xfft_splitted, Yfft_splitted] = SplitMeasure (rpmFile, speedFile, plotFlag)










