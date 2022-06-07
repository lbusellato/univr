function [lambda, var_lambda] = ...
    MLIdentification(data, confidence, maxIter, plotData, fileName)
    % MLIDENTIFICATION A least square procedure that iterates several times
    % and eliminates outliers.
    %
    % [lambda, var_lambda] = MLIDENTIFICATION(phi, y, confidence, maxIter, 
    % plotData, fileName) does maxIter cycles and eliminates ouliers out of 
    % confidence times sigma. Plots the data if plotData is set to true and 
    % uses fileName as the title of the plot.

    % Input arguments check
    assert(nargin >= 3, 'MLIdentification.m: Not enough input arguments.');
    if nargin == 3
        plotData = false;
    elseif nargin == 4
        fileName = '';
    end
    % Elaborate data
    y = [];
    phi = [];
    phi_s = [];
    for i=1:length(data)
        y = [y; data(i).y];
        phi = [phi; data(i).phi];
        phi_s = [phi_s, (data(i).phi'/data(i).sigma)]; % phiT * Sigma_V^-
    end
    % Identification cycle
    retain_indexes = 1:length(phi);
    for i=1:maxIter 
        y = y(retain_indexes');
        phi = phi(retain_indexes,:);
        phi_s = phi_s(:,retain_indexes);
        % Least squares
        lambda = (phi_s * phi) \ phi_s * y;
        var_lambda = inv(phi_s * phi);
        % Model approximating experimental data
        y_model = phi * lambda;
        % Model-experiment error
        error = y - y_model;
        % Standard deviation of the error
        sigma = sqrt(var(error));
        % Cull results under Gaussian noise hypotesis
        retain_indexes = find(abs(error) < sigma*confidence);
    end
    % Plot the data if requested
    if plotData
        fig = figure();
        % Experiment
        plot(y); drawnow;hold on;
        % Model
        plot(y_model,'g'); hold on;
        % Error
        plot(error,'r'); hold on;
        legend('y','model','error');
        title('Least squares identification'); hold off;
        drawnow;
    end
end