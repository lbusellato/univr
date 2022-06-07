%% SETUP
clc;
clearvars;
close all;
addpath("data/");
startTime = 0;
endTime = 35;
fileName = 'log7';

%% LOAD DATA
data = csvread(['data/' fileName '.csv']);
time = data(:,1);
% Extract data from csv
tau = data(:,2);
%dtheta_m = data(:,3);
%ddtheta_m = data(:,4);
theta_m = data(:,6);
ref = data(:,7);
% Crop the data from startTime to endTime
tmp = find(time > startTime);
startId = tmp(1);
tmp = find(time > endTime);
if numel(tmp) == 0
    endId = length(time);
else
    endId = tmp(1);
end
time = time(startId:endId);
tau = tau(startId:endId);
theta_m = theta_m(startId:endId);
%dtheta_m = dtheta_m(startId:endId);
%ddtheta_m = ddtheta_m(startId:endId);
ref = ref(startId:endId);

%% PLOT DATA
fig = figure();
plot(time, theta_m); hold on; 
plot(time, ref); hold on;
plot(time, tau); grid on;
xlabel('Time'); xlim([startTime endTime]);
legend('theta_m','ref','tau');