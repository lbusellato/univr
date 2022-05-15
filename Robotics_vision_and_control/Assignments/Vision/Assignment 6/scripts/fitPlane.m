function [c,n] = fitPlane(data)
    % FITPLANE  Compute the best fitting plane to the given data.
    %
    %   [c,n] = FITPLANE(data) computes the centroid c and surface normal n
    % of the plane that best fits the given data.
    %
    %   Author: Lorenzo Busellato, 2022

    % Plane centroid
    c = mean(data,1)'; 
    % Use PCA to compute the smallest eigenvector
    [U, E] = eig(cov(data));  
    [~, i] = min(diag(E)); 
    % The smallest eigenvector is the surface normal
    n = U(:,i); 
end