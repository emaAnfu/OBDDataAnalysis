function [Xfft, Yfft] = ComputeFFT (X, Y, t, Ts, plotFlag)
% function ComputeFFT()
% the function takes matrix X and Y and computes FFT on each of their rows,
% where each row consists in a subsession
%
% X - matrix of rpm 
% Y - matrix of speed
% t - matrix of time: each row is the time axe of the corresponding
% X and Y rows
% Ts - sampling period (s)
% plotFlag - set this flag to plot each subsession spectra
%
% Xfft_splitted - rows: subsession example; columns: single-side spectrum 
% (rpm)
% Yfft_splitted - rows: subsession example; columns: single-side spectrum
% (speed)
%
% ComputeFFT();

% Get the number of rows (subssessions)
mX = size(X,1);
mY = size(Y,1);
if (mX~=mY)
    display('Different number of X and Y rows');
    return
end
m = mX;

% Get the number of columns (samples)
nX = size(X,2);
nY = size(Y,2);
if (nX~=nY)
    display('Different number of X and Y columns');
    return
end
n = nX;

% Compute spectrum of each subsession:
% Xfft_splitted and Yfft_splitted will be matrices whose column are 
% energies for each discrete frequency and row are spectrum for each 
% subsession

% Number of samples
L = n;
% Number of point on which to do fft
NFFT = 10*L;    
% Frequency sampling
fs = 1/Ts;
% Define frequency domain
f = fs*(0:(NFFT/2))/NFFT;
    
Xfft_splitted = zeros(m,NFFT/2+1);
Yfft_splitted = zeros(m,NFFT/2+1);

for i = 1:m

    Xrow = X(i,:);
    Yrow = Y(i,:);

    if (plotFlag)
        figure (1+i)
        subplot(2,2,1)
        plot(t(i,:),X(i,:))
        title(['Single rpm measure part ', num2str(i)])
        xlabel('t (s)')
        ylabel('rpm')   
    end

    % Compute the Fourier transform of the rpm signal
    Xfft = fft(Xrow,NFFT);
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
        plot(t(i,:),Y(i,:))
        title(['Single speed measure part ', num2str(i)])
        xlabel('t (s)')
        ylabel('km/h')
    end

    Yfft = fft(Yrow,NFFT);
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

end