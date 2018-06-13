clc
clear
close all

% Labels:
% -1: out-of-town
% +1: highway

% Dataset summary:
% Total examples = 15;
% Highway = 4 (+3dummy)
% Out-of-town = 8;

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
%% 5 - DTest1
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/rpm_dtest1.txt';
speedFile = './UsedForDataset/speed_dtest1.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (highway)
labels = ones(size(Rsplitted,1),1) * (+1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 6 - DTest2
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/rpm_dtest2.txt';
speedFile = './UsedForDataset/speed_dtest2.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (highway)
labels = ones(size(Rsplitted,1),1) * (+1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 7 - DTest3
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/rpm_dtest3.txt';
speedFile = './UsedForDataset/speed_dtest3.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (highway)
labels = ones(size(Rsplitted,1),1) * (+1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 8 - Test_DuePartenzeOgni30sec
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/10-05-18_14-16-59_rpm_measure_converted.txt';
speedFile = './UsedForDataset/10-05-18_14-17-00_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 9 - Test_UnaDecina
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/10-05-18_14-10-39_rpm_measure_converted.txt';
speedFile = './UsedForDataset/10-05-18_14-10-39_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 10 - Test_ConAnduePaeseVersoRossi
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-05-18_23-47-09_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-05-18_23-47-09_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 11 - Test_GenovaConEster_1 (check label)
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/10-05-18_21-41-05_rpm_measure_converted.txt';
speedFile = './UsedForDataset/10-05-18_21-41-05_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (highway)
labels = ones(size(Rsplitted,1),1) * (+1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 12 - Test_GenovaConEster_2
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/10-05-18_21-44-17_rpm_measure_converted.txt';
speedFile = './UsedForDataset/10-05-18_21-44-18_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (highway)
labels = ones(size(Rsplitted,1),1) * (+1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 13 - Test_GenovaConEster_3
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/10-05-18_21-50-24_rpm_measure_converted.txt';
speedFile = './UsedForDataset/10-05-18_21-50-24_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (highway)
labels = ones(size(Rsplitted,1),1) * (+1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 14 - Test_GenovaConEster_4 -> sopraelevata
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/10-05-18_23-42-28_rpm_measure_converted.txt';
speedFile = './UsedForDataset/10-05-18_23-42-28_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 15 - Test_GenovaConEster_5
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/11-05-18_00-14-44_rpm_measure_converted.txt';
speedFile = './UsedForDataset/11-05-18_00-14-44_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (highway)
labels = ones(size(Rsplitted,1),1) * (+1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 16 - Test_EnnioCorsoItalia 1
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/13-05-18_20-15-57_rpm_measure_converted.txt';
speedFile = './UsedForDataset/13-05-18_20-15-57_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 17 - Test_EnnioCorsoItalia 2
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/13-05-18_20-19-37_rpm_measure_converted.txt';
speedFile = './UsedForDataset/13-05-18_20-15-57_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 18 - Test_EnnioAutostradaESopraelevata -> Autostrada
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/13-05-18_19-54-16_rpm_measure_converted.txt';
speedFile = './UsedForDataset/13-05-18_19-54-16_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (highway)
labels = ones(size(Rsplitted,1),1) * (+1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 19 - Test_EnnioAutostradaESopraelevata -> Sopraelevata
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/13-05-18_20-10-04_rpm_measure_converted.txt';
speedFile = './UsedForDataset/13-05-18_20-10-04_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);

% These following are several more examples to ECO/sporting driving style,
% it's better not to add them all to the highway/out-of-town classifier

if(true)
    
%% 20 - Test_CampoOvadaEco_1 
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_21-13-01_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_21-13-02_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 21 - Test_CampoOvadaEco_2
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_21-09-26_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_21-09-26_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 22 - Test_CampoOvadaEco_3 
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_21-16-00_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_21-16-00_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 23 - Test_CampoOvadaEco_4 
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_21-21-14_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_21-21-14_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 24 - Test_CampoOvadaEco_5 
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_21-24-05_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_21-24-05_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 25 - Test_CampoOvadaEco_6 
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_21-26-57_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_21-26-58_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 26 - Test_OvadaCampoAllegro_1 
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_22-12-51_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_22-12-51_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 27 - Test_OvadaCampoAllegro_2
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_22-15-46_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_22-15-46_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 28 - Test_OvadaCampoAllegro_3 
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_22-18-50_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_22-18-50_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 29 - Test_OvadaCampoAllegro_4
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_22-21-40_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_22-21-40_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 30 - Test_OvadaCampoAllegro_5
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_22-24-42_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_22-24-42_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 31 - Test_OvadaCampoAllegro_6
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_22-27-28_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_22-27-28_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 32 - Test_OvadaCentro_1
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_21-36-45_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_21-36-45_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (city)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 33 - Test_OvadaCentro_2
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_21-40-25_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_21-40-25_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (city)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 34 - Test_OvadaCentro_3
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_21-43-20_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_21-43-20_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (city)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 35 - Test_OvadaCentro_4
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_21-46-11_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_21-46-11_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (city)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 36 - Test_OvadaCentro_5
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_21-49-09_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_21-49-10_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (city)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 37 - Test_OvadaCentro_6
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_21-52-06_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_21-52-06_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (city)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 38 - Test_OvadaCentro_7
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_22-04-52_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_22-04-52_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (city)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 39 - Test_OvadaBrico_70kmh_1
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_21-58-14_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_21-58-14_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);
%% 40 - Test_OvadaBrico_70kmh_2
clc
% Get data from the txt file created by phone and split into subsessions
rpmFile = './UsedForDataset/12-06-18_22-01-03_rpm_measure_converted.txt';
speedFile = './UsedForDataset/12-06-18_22-01-04_speed_measure_converted.txt';
Ts = 0.250;
[Rsplitted, Vsplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, 0);
% Prepare classification labels (out-of-town)
labels = ones(size(Rsplitted,1),1) * (-1);
% Update the two dataset, one for rpm and one for speed
[R,Yr]=CreateDataset('rpmDataset', R, Yr, Rsplitted, labels);
[V,Yv]=CreateDataset('speedDataset', V, Yv, Vsplitted, labels);

end







