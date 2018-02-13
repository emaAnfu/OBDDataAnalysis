% this measures are taken with Tc not fixed and should be 1000 samples
% jenny

clear
clc
close all

% Get data from the txt file created by phone

X = load('27-12-17_12-25-10_rpm_measure_converted.txt');

Y = load('27-12-17_12-25-10_speed_measure_converted.txt');

if (size(X,1)~=size(Y,1))
    display('Different number of samples');
    return
end

L = size(X,1);          % number of samples
Ts = 0.248;             % sampling period, in s (approx.)
fs = 1/Ts;          
t = (0:L-1)*Ts;         % Time vector

figure(1)
subplot(2,1,1)
plot(t,X)
title('Entire rpm measure')

figure(1)
subplot(2,1,2)
plot(t,Y)
title('Entire speed measure')

% Compute spectrum

NFFT = 10*numel(X);

f = linspace(-fs/2,fs/2,NFFT);

Xfft = fft(X,NFFT)/L;
figure (2)
subplot(2,1,1)
plot(f,fftshift(((abs(Xfft)))))
title ('FFT module X');

Yfft = fft(Y,NFFT)/L;
figure (2)
subplot(2,1,2)
plot(f,fftshift(((abs(Yfft)))))
title ('FFT module Y');