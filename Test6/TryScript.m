% test script
clc
clear
close all

Fs = 500;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal (ms)

L = 1*L;

t = (0:L-1)*T;        % Time vector

%S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t) + sin(2*pi*150*t) + 2*randn(size(t));
%S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t) + sin(2*pi*150*t);
S = 0.7*sin(2*pi*50*t);
%S = t;

X = S;

% Fs = 1000;            % Sampling frequency                    
% T = 1/Fs;             % Sampling period     

subplot(2,1,1)
plot(1000*t(1:50),X(1:50))
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('t (milliseconds)')
ylabel('X(t)')

L = 100*L;

Y = fft(X,L);
% Compute the two-sided spectrum P2. Then compute the single-sided 
% spectrum P1 based on P2 and the even-valued signal length L.
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

subplot(2,1,2)
f = Fs*(0:(L/2))/L;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')










