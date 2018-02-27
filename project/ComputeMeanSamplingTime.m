function meanTs = ComputeMeanSamplingTime (timeFile)
%
%
% -> not working, file is not ready to be load
%
% function ComputeMeanSamplingTime()
% the function reads the file with the deltaT between samples and compute
% the mean value
%
% timeFile - file with the deltaT between samples 
%
% meanTs - mean value of that deltaT
%
% ComputeMeanSamplingTime();

deltaT = load(timeFile);

meanTs = mean(deltaT);

end