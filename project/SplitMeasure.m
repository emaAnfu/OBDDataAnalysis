function [Xsplitted, Ysplitted, tsplitted] = SplitMeasure (rpmFile, speedFile, Ts, splitFactor, plotFlag)
% function SplitMeasure()
% the function reads the converted data from txt file and splits them into
% subsessions 
%
% rpmFile - file which contains rpm converted data
% speedFile - file which contains speed converted data
% Ts - sampling period (s)
% splitFactor - lenght of each subession will be totalLength/splitFactor
% plotFlag - set this flag to plot each subsession (rpm, speed)
%
% Xsplitted - rows: subsession example; columns: rpm samples
% Ysplitted - rows: subsession example; columns: speed samples
% tsplitted - rows: time axis of the corresponding X and Y rows
%
% SplitMeasure();

% Get data from the txt file created by phone
X = load(rpmFile);
Y = load(speedFile);
if (size(X,1)~=size(Y,1))
    display('Different number of samples');
    return
end

L = size(X,1);          % number of samples    
t = (0:L-1)*Ts;         % Time vector

if(plotFlag)
    % Plot entire measure: here it is composed of 1000 samples and corresponds
    % approximately to 250 seconds (i.e. 4 minutes)
    figure(1)
    subplot(2,1,1)
    plot(t,X)
    title('Entire rpm measure')
    figure(1)
    subplot(2,1,2)
    plot(t,Y)
    title('Entire speed measure')
end

% Divide measure into subsessions
Xsplitted = reshape(X,L/splitFactor,splitFactor)';
Ysplitted = reshape(Y,L/splitFactor,splitFactor)';
tsplitted = reshape(t,L/splitFactor,splitFactor)';

if(true)



else
    
    
end

end