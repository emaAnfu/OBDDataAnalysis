% this measures are taken with Tc not fixed and should be 1000 samples
% ema

clear
clc
close all

% Get data from the txt file created by phone

X = load('24-12-17_17-49-54_rpm_measure_converted.txt');
Y = load('24-12-17_17-49-54_speed_measure_converted.txt');

if (size(X,1)~=size(Y,1))
    display('Different number of samples');
    return
end

% Set this flag to plot each subsession (rpm, speed, rpm spectrum and speed
% spectrum)
plotFlag = 0;

L = size(X,1);          % number of samples
Ts = 0.250;             % sampling period, in s (approx.)
fs = 1/Ts;              % frequency of sampling      
t = (0:L-1)*Ts;         % Time vector

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

% Divide measure into subsessions
splitFactor = 20;
Xsplitted = reshape(X,L/splitFactor,splitFactor)';
Ysplitted = reshape(Y,L/splitFactor,splitFactor)';
tsplitted = reshape(t,L/splitFactor,splitFactor)';

% Compute spectrum of each subsession:
% Xfft_splitted and Yfft_splitted will be matrices whose column are 
% energies for each discrete frequency and row are spectrum for each 
% subsession
Xfft_splitted = zeros(splitFactor,10*L/splitFactor/2+1);
Yfft_splitted = zeros(splitFactor,10*L/splitFactor/2+1);

for i = 1:splitFactor
    
    X = Xsplitted(i,:);
    Y = Ysplitted(i,:);

    % Number of samples
    L = size(X,2);
    % Number of point on which to do ffr
    NFFT = 10*numel(X);    
    % Define frequency domain
    f = fs*(0:(NFFT/2))/NFFT;
    
    if (plotFlag)
        figure (1+i)
        subplot(2,2,1)
        plot(tsplitted(i,:),Xsplitted(i,:))
        title(['Single rpm measure part ', num2str(i)])
        xlabel('t (s)')
        ylabel('rpm')   
    end

    % Compute the Fourier transform of the rpm signal
    Xfft = fft(X,NFFT);
    % Compute the two-sided spectrum P2. Then compute the single-sided 
    % spectrum P1 based on P2 and the even-valued signal length L.
    P2X = abs(Xfft/L);
    P1X = P2X(1:NFFT/2+1);
    P1X(2:end-1) = 2*P1X(2:end-1);
    if (plotFlag)
        % Plot the single-sided amplitude spectrum P1
        figure (1+i)
        subplot(2,2,2)
        plot(f,P1X) 
        title(['Single-Sided Amplitude Spectrum of X(t) part ', num2str(i)])
        xlabel('f (Hz)')
        ylabel('|P1X(f)|')
    end
    
    if (plotFlag)
        figure (1+i)
        subplot(2,2,3)
        plot(tsplitted(i,:),Ysplitted(i,:))
        title(['Single speed measure part ', num2str(i)])
        xlabel('t (s)')
        ylabel('km/h')
    end

    Yfft = fft(Y,NFFT);
    % Compute the two-sided spectrum P2. Then compute the single-sided 
    % spectrum P1 based on P2 and the even-valued signal length L.
    P2Y = abs(Yfft/L);
    P1Y = P2Y(1:NFFT/2+1);
    P1Y(2:end-1) = 2*P1Y(2:end-1);
    if (plotFlag)
        % Plot the single-sided amplitude spectrum P1
        figure (1+i)
        subplot(2,2,4)
        plot(f,P1Y) 
        title(['Single-Sided Amplitude Spectrum of Y(t) part ', num2str(i)])
        xlabel('f (Hz)')
        ylabel('|P1Y(f)|')   
    end
    
    Xfft_splitted(i,:) = P1X;
    Yfft_splitted(i,:) = P1Y;
end







