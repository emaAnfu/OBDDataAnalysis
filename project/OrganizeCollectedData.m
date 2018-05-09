clc
clear
close all

% Labels:
% -1: out-of-town
% +1: highway

% A value for all the measures (not the Ts, that could be chosen as
% the meanDeltaT of each measure)
splitFactor=1;

% Here each txt file refers to 1000 recorded samples, i.e. about 4 minutes,
% with splitFactor=20 each subsession is 50 samples, i.e. about 12 seconds
% with splitFactor=40 each subsession is 25 samples, i.e. about 6 seconds

%% 1- Test7
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/27-12-17_12-17-30_rpm_measure_converted.txt';
speedFile = './UsedForDataset/27-12-17_12-17-30_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', -1,-1, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', -1,-1, Vsplitted, labels);

%% 2 - Test6
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/24-12-17_17-49-54_rpm_measure_converted.txt';
speedFile = './UsedForDataset/24-12-17_17-49-54_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 3 - Test8
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/27-12-17_12-25-10_rpm_measure_converted.txt';
speedFile = './UsedForDataset/27-12-17_12-25-10_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 4 - Test9
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/27-12-17_12-28-55_rpm_measure_converted.txt';
speedFile = './UsedForDataset/27-12-17_12-28-55_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
% %% 5 - Test10
% clc
% % Get data from the txt file created by phone and split into subsessions
% rpmFile = './UsedForDataset/27-12-17_12-34-22_rpm_measure_converted.txt';
% speedFile = './UsedForDataset/27-12-17_12-34-22_speed_measure_converted.txt';
% Ts = 0.250;
% [Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% % Prepare classification labels (jenny)
% labels = ones(size(Rsplitted,1),1) * (-1);
% % Update the two dataset, one for rpm and one for speed
% [R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
% [V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
% %% 6 - Test11
% clc
% % Get data from the txt file created by phone and split into subsessions
% rpmFile = './UsedForDataset/27-12-17_15-30-26_rpm_measure_converted.txt';
% speedFile = './UsedForDataset/27-12-17_15-30-26_speed_measure_converted.txt';
% Ts = 0.250;
% [Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% % Prepare classification labels (jenny)
% labels = ones(size(Rsplitted,1),1) * (-1);
% % Update the two dataset, one for rpm and one for speed
% [R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
% [V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
% %% 7 - Test12
% clc
% % Get data from the txt file created by phone and split into subsessions
% rpmFile = './UsedForDataset/27-12-17_12-02-44_rpm_measure_converted.txt';
% speedFile = './UsedForDataset/27-12-17_12-02-44_speed_measure_converted.txt';
% Ts = 0.250;
% [Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% % Prepare classification labels (ema)
% labels = ones(size(Rsplitted,1),1) * (+1);
% % Update the two dataset, one for rpm and one for speed
% [R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
% [V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
% %% 8 - Test13
% clc
% % Get data from the txt file created by phone and split into subsessions
% rpmFile = './UsedForDataset/27-12-17_11-43-55_rpm_measure_converted.txt';
% speedFile = './UsedForDataset/27-12-17_11-43-55_speed_measure_converted.txt';
% Ts = 0.250;
% [Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% % Prepare classification labels (ema)
% labels = ones(size(Rsplitted,1),1) * (+1);
% % Update the two dataset, one for rpm and one for speed
% [R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
% [V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
% %% 9 - Test14
% clc
% % Get data from the txt file created by phone and split into subsessions
% rpmFile = './UsedForDataset/27-12-17_11-53-21_rpm_measure_converted.txt';
% speedFile = './UsedForDataset/27-12-17_11-53-21_speed_measure_converted.txt';
% Ts = 0.250;
% [Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% % Prepare classification labels (ema)
% labels = ones(size(Rsplitted,1),1) * (+1);
% % Update the two dataset, one for rpm and one for speed
% [R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
% [V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
% %% 10 - Test15
% clc
% % Get data from the txt file created by phone and split into subsessions
% rpmFile = './UsedForDataset/27-12-17_14-44-14_rpm_measure_converted.txt';
% speedFile = './UsedForDataset/27-12-17_14-44-15_speed_measure_converted.txt';
% Ts = 0.250;
% [Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% % Prepare classification labels (ema)
% labels = ones(size(Rsplitted,1),1) * (+1);
% % Update the two dataset, one for rpm and one for speed
% [R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
% [V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 10 - DTest1
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/rpm_dtest1.txt';
speedFile = './UsedForDataset/speed_dtest1.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (highway)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 11 - DTest2
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/rpm_dtest2.txt';
speedFile = './UsedForDataset/speed_dtest2.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (highway)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 12 - DTest3
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/rpm_dtest3.txt';
speedFile = './UsedForDataset/speed_dtest3.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (highway)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);











