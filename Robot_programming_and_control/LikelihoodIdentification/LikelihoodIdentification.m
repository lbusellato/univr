%
%   LikelihoodIdentification.m
%  
%   Implementation of the motor parameter estimation pipeline.
%   Adapted from the scripts provided for the RPC course @UniVR.
%

%% SETUP
clc;
clearvars;
close all;
% Path of the csv files
dataPath = 'data_gravity/';
addpath(dataPath);
addpath('scripts');
% Load in all logs in data directory
files = dir([dataPath '*.csv']);
startTime = 0.5;
endTime = 30;
plotData = false;
params = 5;

%% IDENTIFICATION
data = struct([]);
lambdas = nan(params,size(files,1));
sigmas_lambda = nan(params,size(files,1));
sigmas_exp = nan(1,size(files,1));
cutoffFrequency = 10; % [Hz]
for i = 1:size(files,1)
    % Load data from csv
    fileName = files(i).name;
    [time, tau, theta_m, dtheta_m, ddtheta_m] = loadData(dataPath, ...
                                                         fileName, ...
                                                         startTime, ...
                                                         endTime, ...
                                                         plotData);
    % Filter data 
    filteredData = filterData([time tau theta_m dtheta_m ddtheta_m], ...
                               cutoffFrequency);
    tau = filteredData(:,1);
    theta_m = filteredData(:,2);
    dtheta_m = filteredData(:,3);
    ddtheta_m = filteredData(:,4);
    % No gravity compensation
    %phi = [ddtheta_m dtheta_m sign(dtheta_m)];
    % Gravity compensation
    offset = ones(size(theta_m, 1),1);
    phi = [ddtheta_m dtheta_m sign(dtheta_m) 9.81*sin(theta_m) offset];
    [lambda, sigma_exp, Phi, Y, var_lambda] = LSIdentification(phi, ...
                                                               tau, ...
                                                               3, ...
                                                               1, ...
                                                               plotData, ...
                                                               fileName);
    data(i).y = Y;
    data(i).phi = Phi;
    data(i).sigma = sigma_exp;
    lambdas(:,i) = lambda;
    sigmas_exp(:,i) = sigma_exp;
    sigmas_lambda(:,i) = diag(sqrt(abs(var_lambda)));
end
% Display least square identification results
lambdas

%% IDENTIFICATION
[lambdaML var_lambdaML] = MLIdentification(data, 3, 1, plotData);
% Display least square identification result
lambdaML
% Save the result
save([dataPath '/result.mat'], "lambdaML");