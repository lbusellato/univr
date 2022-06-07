function [m,q,inliers] = ransacFitLine(data, sampleNumber, maxIterations, threshold)
    % RANSACFITLINE
    %
    %   [m,q] = RANSACFITLINE(data, model, n, k, t, d) 
    %
    %   Author: Lorenzo Busellato, 2022

    inlier_score = zeros([maxIterations,1]);
    inlier_m = zeros([3,maxIterations]);
    inlier_q = zeros([3,maxIterations]);
    for it = 1:maxIterations 
        % Select n random elements from data
        ids = randsample(size(data,1),sampleNumber);
        [m,q] = fitLine(data(ids,:));
        d = point2lineDistance(data,q,m);
        inlier_score(it) = sum(d<threshold);
        inlier_m(:,it) = m;
        inlier_q(:,it) = q;
    end    
    [~,i] = max(inlier_score);
    m = inlier_m(:,i);
    q = inlier_q(:,i);
    inliers = point2lineDistance(data,q,m) < threshold;
end