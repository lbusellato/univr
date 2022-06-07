function [time, tau, theta_m, dtheta_m, ddtheta_m] = ... 
loadData(dataPath, fileName, startTime, endTime, plotData)
    %   LOADDATA Extracts data from csv files.
    %
    %   [time, tau, theta_m, dtheta_m, ddtheta_m] = 
    % LOADDATA(dataPath, fileName, startTime, endTime, plotData) loads the
    % columns of a the datapath/fileName csv file structured like:
    %
    %   time, tau, theta_m, dtheta_m, ddtheta_m
    %
    % startTime and endTime specify the limits of extraction of the columns
    % and plotData specifies whether or not to plot the extracted data.
    
    % Input arguments check
    assert(nargin > 1, 'loadData.m: Not enough input arguments.');
    if nargin == 2
        startTime = 0;
        endTime = inf;
        plotData = false;
    elseif nargin == 3
        endTime = inf;
        plotData = false;
    elseif nargin == 4
        plotData = false;        
    end
    % Load csv
    data = csvread([dataPath fileName]);
    time = data(:,1);
    % Extract data from csv
    tau = data(:,2);
    theta_m = data(:,3);
    dtheta_m = data(:,4);
    ddtheta_m = data(:,5);
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
    dtheta_m = dtheta_m(startId:endId);
    ddtheta_m = ddtheta_m(startId:endId);
    % Plot the extracted data if requested
    if plotData
        fig = figure();
        subplot(411); plot(time, tau);
        ylabel("tau"); xlim([startTime endTime]);
        subplot(412); plot(time, theta_m);
        ylabel("theta_m"); xlim([startTime endTime]);
        subplot(413); plot(time, dtheta_m);
        ylabel("dtheta_m"); xlim([startTime endTime]);
        subplot(414); plot(time, ddtheta_m);
        ylabel("ddtheta_m"); xlabel('Time'); xlim([startTime endTime]);
        sgtitle([fileName ' - extracted data']); drawnow;
    end
end