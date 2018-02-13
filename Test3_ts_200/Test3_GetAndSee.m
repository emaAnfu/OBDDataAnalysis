clear
clc
close all

% Get data from the txt file created by phone

X = load('OBD_rpm_storage_raw__converted.txt');
%X = X - mean(X);
X=X(1:end)

Y = load('OBD_speed_storage_raw__converted.txt');

figure(1)
subplot(2,1,1)
plot(X)
title('Entire rpm measure')

figure(1)
subplot(2,1,2)
plot(Y)
title('Entire speed measure')

% Compute spectrum

NFFT = 10*numel(X);
Ts = 0.4;
fs = 1/Ts;
f = linspace(-fs/2,fs/2,NFFT);

Xfft = fft(X-mean(X),NFFT);
figure (2)
subplot(2,1,1)
plot(f,fftshift(((abs(Xfft)))))
title ('FFT module X');

NFFT = 10*numel(Y);
Ts = 0.4;
fs = 1/Ts;
f = linspace(-fs/2,fs/2,NFFT);

Yfft = fft(Y-mean(Y),NFFT);
figure (2)
subplot(2,1,2)
plot(f,fftshift(((abs(Yfft)))))
title ('FFT module Y');