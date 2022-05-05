% assignment2.m
% Author: Lorenzo Busellato, 2022
%
% Reconstruction of a 3D cloud of points from range images. Range images
% acquired from http://redwood-data.org/3dscan/dataset.html
%

%% SETUP
clc;
close all;
clearvars;
addpath('data/');

%% INTERNAL CAMERA PARAMETERS
fu = 525; % u focal lenght in pixels
fv = 525; % v focal lenght in pixels
u0 = 319.5; % u coordinate of the principal point
v0 = 239.5; % v coordinate of the principal point
cameraParams = [fu fv u0 v0];

%% LOAD AND DISPLAY RANGE/RGB IMAGE
imageNo = 1; % Change here to switch image (NB: edit also depth threshold!)
fig1 = figure();
depthImg = imread(strcat('data/',num2str(imageNo),'_depth.png'));
subplot(121); imshow(depthImg);
title('Range image');
rgbImg = imread(strcat('data/',num2str(imageNo),'_rgb.jpg'));
subplot(122); imshow(rgbImg);
title('RGB image');

%% 3D POINT CLOUD RECONSTRUCTION
% Indicatively 1000 for img 1, 2000 for img 2 and 2000 for img 3
depthThreshold = 2000;
[vertices, color] = generatePointCloud(rgbImg, depthImg, cameraParams, depthThreshold);
fig2 = figure();
scatter3(vertices(:,1),vertices(:,2),vertices(:,3),6,color,'.');
xlabel('X'); ylabel('Y'); zlabel('Z'); title('3D point cloud');

%% SAVE POINT CLOUD
exportMeshToPly(vertices,[],color,strcat(num2str(imageNo),'_point_cloud'))