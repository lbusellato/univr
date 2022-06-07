% assignment3.m
% Author: Lorenzo Busellato, 2022
%
% Computation of the canonical orientation.

%% SETUP
clc;
close all;
clearvars;
addpath('data/');
% Load point cloud and downsample to 10% of the original points
ptCloud = pcread("data/SamPointCloud.ply");
ptCloud = pcdownsample(ptCloud, "random", 0.1);
P = ptCloud.Location;

%% EXTRINSIC CENTROID
X = ptCloud.Location(:,1);
Y = ptCloud.Location(:,2);
Z = ptCloud.Location(:,3);
P0 = [mean(X) mean(Y) mean(Z)];
figure(1);
scatter3(X, Y, Z, 'r', 'filled'); axis equal; hold on;
scatter3(P0(1), P0(2), P0(3), 'g', 'filled'); hold on;

%% CANONICAL BASIS
% Computation of the covariance matrix
dX = bsxfun(@minus, P, P0);
C = dX' * dX;
% PCA - The columns of U are, in order, d1, d2 and d3
[U,~]=svd(C);

%% CANONICAL ORIENTATION
% Rotation matrix
R = U';
% Translation vector
t = -U'*P0';
Pc = R*P' - t;
Pc0 = R*P0' - t;
scatter3(Pc(1,:), Pc(2,:), Pc(3,:), 'b', 'filled'); hold on;
scatter3(Pc0(1), Pc0(2), Pc0(3), 'g', 'filled'); hold on;
title('Zephyr orientation (red) vs canonical orientation (blue), centroids in green');