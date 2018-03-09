function [Xder, Yder] = ComputeFirstDerivative (X, Y, t, Ts, plotFlag)
% function ComputeFirstDerivative()
% the function takes matrix X and Y and computes first discrete derivative 
% on each of their rows, where each row consists in a subsession
%
% X - matrix of rpm 
% Y - matrix of speed
% t - matrix of time: each row is the time axe of the corresponding
% X and Y rows
% Ts - sampling period (s)
% plotFlag - set this flag to plot each subsession first derivative
%
% Xder - rows: subsession example; columns: first derivative
% (rpm)
% Yfft_splitted - rows: subsession example; columns: first derivative
% (speed)
%
% ComputeFirstDerivative();

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

% Compute derivative of each subsession:
% Xder and Yder will be matrices whose rows are 
% values of the first derivative. Each row is a subssesion
Xder = zeros(m,n-1);
Yder = zeros(m,n-1);

for i = 1:m

    Xrow = X(i,:);
    Yrow = Y(i,:);

    if (plotFlag)
        figure (1+i)
        subplot(2,2,1)
        plot(t(i,:),Xrow)
        title(['Single rpm measure part ', num2str(i)])
        xlabel('t (s)')
        ylabel('rpm')   
    end

    % Compute the first derivative of the rpm signal
    Xder(i,:) = diff(Xrow);

    if (plotFlag)
        % Plot the first derivative
        figure (1+i)
        subplot(2,2,2)
        plot(t(i,1:end-1), Xder(i,:)) 
        title(['First derivative of X(t) part ', num2str(i)])
        xlabel('t (s)')
        ylabel('Xder')
    end

    if (plotFlag)
        figure (1+i)
        subplot(2,2,3)
        plot(t(i,:),Yrow)
        title(['Single speed measure part ', num2str(i)])
        xlabel('t (s)')
        ylabel('km/h')
    end

    % Compute the first derivative of the speed signal (divide for Ts to
    % have acceleration)
    Yder(i,:) = diff(Yrow)/Ts;

    if (plotFlag)
        % Plot the first derivative
        figure (1+i)
        subplot(2,2,4)
        plot(t(i,1:end-1), Yder(i,:)) 
        title(['First derivative of Y(t) part ', num2str(i)])
        xlabel('t (s)')
        ylabel('Yder')  
    end

end

end