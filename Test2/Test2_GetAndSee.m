clear
clc
close all

% Get data from the txt file created by phone

X = load('OBD_rpm_storage_converted.txt');
%X = X - mean(X);
X=X(1:end)

figure(1)
plot(X)
title('Entire rpm measure')

% Compute spectrum

NFFT = 10*numel(X);
Ts = 0.2;
fs = 1/Ts;
f = linspace(-fs/2,fs/2,NFFT);

Xfft = fft(X-mean(X),NFFT);
figure (2)
plot(f,fftshift(((abs(Xfft)))))
title ('FFT module X');











