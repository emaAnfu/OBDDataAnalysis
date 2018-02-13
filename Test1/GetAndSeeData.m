clear
clc
close all

% Get data from the txt file created by phone

X = load('OBD_rpm_storage_converted.txt');
%X = X - mean(X);
X_rest = X(1:100);
X_active = X(101:end);

figure(1)
plot(X)
title('Entire rpm measure')

figure(2)
subplot(2,1,1)
plot (X_rest)
title('Rest rpm measure')

figure(2)
subplot(2,1,2)
plot (X_active)
title('Active rpm measure')

%%%% Calcolo spettri
NFFT = 10*numel(X);
Ts = 0.2;
fs = 1/Ts;
f = linspace(-fs/2,fs/2,NFFT);

Xfft = fft(X-mean(X),NFFT);
figure (3)
subplot(2,2,1)
plot(f,fftshift(((abs(Xfft)))))
title ('FFT module X');

NFFT = 10*numel(X_rest);
f = linspace(-fs/2,fs/2,NFFT);
X_restfft = fft(X_rest-mean(X_rest),NFFT);
figure (3)
subplot(2,2,2)
plot(f,fftshift(((abs(X_restfft)))))
title ('FFT module X_{rest}');

NFFT = 10*numel(X_active);
f = linspace(-fs/2,fs/2,NFFT);
X_activefft = fft(X_active-mean(X_active),NFFT);
figure (3)
subplot(2,2,3)
plot(f,fftshift(((abs(X_activefft)))))
title ('FFT module X_{active}');

% NFFT = 10*numel(X);
% f = linspace(-fs/2,fs/2,NFFT);
% X_sumfft = X_restfft+X_activefft;
% figure (3)
% subplot(2,2,4)
% plot(f,fftshift(((abs(X_sumfft)))))
% title ('FFT module X_{rest}+X_{active}');



