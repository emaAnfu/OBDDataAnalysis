
clear 
clc
close all

% dummy speed vector beetween with values in [a,b] km/h

a = -2;
b = 2;
X1 = a + rand(1,50) .* (b-a);
Ts = 0.250;
L = size(X1,2);          % number of samples    
t = (0:L-1)*Ts;         % Time vector
figure(1)
subplot(2,1,1)
plot(t,X1)
title('Dummy speed measure 1')

a = -5;
b = 5;
X2 = a + rand(1,50) .* (b-a);
Ts = 0.250;
L = size(X2,2);          % number of samples    
t = (0:L-1)*Ts;         % Time vector
figure(1)
subplot(2,1,2)
plot(t,X2)
title('Dummy speed measure 2')

m1 = mean(X1)
m2 = mean(X2)
r1 = rms(X1)
r2 = rms(X2)




















