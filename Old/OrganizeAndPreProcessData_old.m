


%% DEPRECATED: I used this to create a dataset in which the features were the discrete frequency

clc
clear
close all

% Normalize RPM and speed
maxRPM=4000;
maxSpeed=130;

%% 1- Test7
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/27-12-17_12-17-30_rpm_measure_converted.txt';
speedFile = './UsedForDataset/27-12-17_12-17-30_speed_measure_converted.txt';
plotFlag=0;
[Xsplitted, Ysplitted, Xfft_splitted, Yfft_splitted] = SplitMeasure (rpmFile, speedFile, plotFlag);
% Prepare classification labels (jenny)
labels = ones(size(Xfft_splitted,1),1) * (-1);
% Add them to dataset 
[X,Y]=CreateDataset(-1,-1,[Xfft_splitted./maxRPM Yfft_splitted./maxSpeed], labels);

%% 2 - Test6
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/24-12-17_17-49-54_rpm_measure_converted.txt';
speedFile = './UsedForDataset/24-12-17_17-49-54_speed_measure_converted.txt';
plotFlag=0;
[Xsplitted, Ysplitted, Xfft_splitted, Yfft_splitted] = SplitMeasure (rpmFile, speedFile, plotFlag);
% Prepare classification labels (ema)
labels = ones(size(Xfft_splitted,1),1) * (+1);
% Add them to dataset 
[X,Y]=CreateDataset(X,Y,[Xfft_splitted./maxRPM Yfft_splitted./maxSpeed], labels);
%% 3 - Test8
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/27-12-17_12-25-10_rpm_measure_converted.txt';
speedFile = './UsedForDataset/27-12-17_12-25-10_speed_measure_converted.txt';
plotFlag=0;
[Xsplitted, Ysplitted, Xfft_splitted, Yfft_splitted] = SplitMeasure (rpmFile, speedFile, plotFlag);
% Prepare classification labels (jenny)
labels = ones(size(Xfft_splitted,1),1) * (-1);
% Add them to dataset 
[X,Y]=CreateDataset(X,Y,[Xfft_splitted./maxRPM Yfft_splitted./maxSpeed], labels);
%% 4 - Test9
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/27-12-17_12-28-55_rpm_measure_converted.txt';
speedFile = './UsedForDataset/27-12-17_12-28-55_speed_measure_converted.txt';
plotFlag=0;
[Xsplitted, Ysplitted, Xfft_splitted, Yfft_splitted] = SplitMeasure (rpmFile, speedFile, plotFlag);
% Prepare classification labels (jenny)
labels = ones(size(Xfft_splitted,1),1) * (-1);
% Add them to dataset 
[X,Y]=CreateDataset(X,Y,[Xfft_splitted./maxRPM Yfft_splitted./maxSpeed], labels);
%% 5 - Test10
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/27-12-17_12-34-22_rpm_measure_converted.txt';
speedFile = './UsedForDataset/27-12-17_12-34-22_speed_measure_converted.txt';
plotFlag=0;
[Xsplitted, Ysplitted, Xfft_splitted, Yfft_splitted] = SplitMeasure (rpmFile, speedFile, plotFlag);
% Prepare classification labels (jenny)
labels = ones(size(Xfft_splitted,1),1) * (-1);
% Add them to dataset 
[X,Y]=CreateDataset(X,Y,[Xfft_splitted./maxRPM Yfft_splitted./maxSpeed], labels);
%% 6 - Test11
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/27-12-17_15-30-26_rpm_measure_converted.txt';
speedFile = './UsedForDataset/27-12-17_15-30-26_speed_measure_converted.txt';
plotFlag=0;
[Xsplitted, Ysplitted, Xfft_splitted, Yfft_splitted] = SplitMeasure (rpmFile, speedFile, plotFlag);
% Prepare classification labels (jenny)
labels = ones(size(Xfft_splitted,1),1) * (-1);
% Add them to dataset 
[X,Y]=CreateDataset(X,Y,[Xfft_splitted./maxRPM Yfft_splitted./maxSpeed], labels);
%% 7 - Test12
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/27-12-17_12-02-44_rpm_measure_converted.txt';
speedFile = './UsedForDataset/27-12-17_12-02-44_speed_measure_converted.txt';
plotFlag=0;
[Xsplitted, Ysplitted, Xfft_splitted, Yfft_splitted] = SplitMeasure (rpmFile, speedFile, plotFlag);
% Prepare classification labels (ema)
labels = ones(size(Xfft_splitted,1),1) * (+1);
% Add them to dataset 
[X,Y]=CreateDataset(X,Y,[Xfft_splitted./maxRPM Yfft_splitted./maxSpeed], labels);
%% 8 - Test13
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/27-12-17_11-43-55_rpm_measure_converted.txt';
speedFile = './UsedForDataset/27-12-17_11-43-55_speed_measure_converted.txt';
plotFlag=0;
[Xsplitted, Ysplitted, Xfft_splitted, Yfft_splitted] = SplitMeasure (rpmFile, speedFile, plotFlag);
% Prepare classification labels (ema)
labels = ones(size(Xfft_splitted,1),1) * (+1);
% Add them to dataset 
[X,Y]=CreateDataset(X,Y,[Xfft_splitted./maxRPM Yfft_splitted./maxSpeed], labels);
%% 9 - Test14
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/27-12-17_11-53-21_rpm_measure_converted.txt';
speedFile = './UsedForDataset/27-12-17_11-53-21_speed_measure_converted.txt';
plotFlag=0;
[Xsplitted, Ysplitted, Xfft_splitted, Yfft_splitted] = SplitMeasure (rpmFile, speedFile, plotFlag);
% Prepare classification labels (ema)
labels = ones(size(Xfft_splitted,1),1) * (+1);
% Add them to dataset 
[X,Y]=CreateDataset(X,Y,[Xfft_splitted./maxRPM Yfft_splitted./maxSpeed], labels);
%% 10 - Test15
% clc
% % Get data from the txt file created by phone and split into subsessions
% rpmFile = './UsedForDataset/27-12-17_14-44-14_rpm_measure_converted.txt';
% speedFile = './UsedForDataset/27-12-17_14-44-15_speed_measure_converted.txt';
% plotFlag=0;
% [Xsplitted, Ysplitted, Xfft_splitted, Yfft_splitted] = SplitMeasure (rpmFile, speedFile, plotFlag);
% % Prepare classification labels (ema)
% labels = ones(size(Xfft_splitted,1),1) * (+1);
% % Add them to dataset 
% [X,Y]=CreateDataset(X,Y,[Xfft_splitted./maxRPM Yfft_splitted./maxSpeed], labels);










