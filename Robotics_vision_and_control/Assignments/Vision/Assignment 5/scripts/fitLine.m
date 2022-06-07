function [m,q] = fitLine(data)
    % FITLINE  Compute the best fitting line to the given data.
    %
    %   [m,q] = FITLINE(data) computes the direction m and intercept q of 
    % the 3D line that best fits the given data.
    %
    %   Author: Lorenzo Busellato, 2022

    assert(size(data,2)>=3, ...
        'Not enough data points to fit line, check again.');
    % The intercept is the centroid of data
    q = mean(data,1)';
    % Use PCA to compute the biggest eigenvector
    [U, E] = eig(cov(data));
    [~, i] = max(diag(E));
    % The biggest eigenvector is the direction of the line
    m = U(:,i); 
end