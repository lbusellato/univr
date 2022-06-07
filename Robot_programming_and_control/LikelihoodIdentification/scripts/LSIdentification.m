function [lambda, sigma, phi, y, var_lambda] = ...
    LSIdentification(phi, y, confidence, maxIter, plotData, fileName)
    % LSIDENTIFICATION A least square procedure that iterates several times
    % and eliminates outliers.
    %
    % [lambda, sigma, phi, y, var_lambda] = LSIDENTIFICATION(phi, y, 
    % confidence, maxIter, plotData, fileName) does maxIter cycles and 
    % eliminates ouliers out of confidence times sigma. Plots the data
    % if plotData is set to true and uses fileName as the title of the
    % plot.
    
    % Input arguments check
    assert(nargin >= 4, 'LSIdentification.m: Not enough input arguments.');
    if nargin == 4
        plotData = false;
    end
    % Identification cycle
    retainIndexes = 1:length(phi);
    for i = 1:maxIter 
        y = y(retainIndexes');
        phi = phi(retainIndexes,:);
        % Least squares
        lambda = (phi' * phi) \ phi' * y;
        var_lambda = inv(phi' * phi);
        % Model that approximates experimental data
        y_model = phi * lambda;
        % Model-experiment error
        error = y - y_model;
        % Standard deviation of the error
        sigma = sqrt(var(error));
        % Cull results under Gaussian noise hypotesis
        retainIndexes = find(abs(error) < sigma*confidence);
        if(length(retainIndexes) == length(y)) 
            break;
        end
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
        title(['Least squares identification - ' fileName]); hold off;
        drawnow;
    end
end