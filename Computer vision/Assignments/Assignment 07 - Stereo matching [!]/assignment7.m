% assignment7.m
% Author: Lorenzo Busellato
%
% This script implements the computation of the disparity map of a pair of
% rectified stereo images and the reconstruction of the cloud of associated
% 3D points.

%% SETUP
clearvars;
close all;
clc;
addpath('./Data');
% Load in the full perspective matrices
P1 = load('./Data/perspective_matrix_1.mat').P;
P2 = load('./Data/perspective_matrix_2.mat').P;
% Load in the images
img1 = imread('./Data/img1.jpg');
img2 = imread('./Data/img2.jpg');
% Show the images
fig1 = figure();
title('Left image');
hold on;
imshow(img1);
fig2 = figure();
title('Right image');
hold on;
imshow(img2);

%% IMAGE RECTIFICATION
[H1,H2,Pn1,Pn2] = rectifyP(P1,P2);
[I1r,I2r, bb1, bb2] = imrectify(img1,img1,H1,H2,'valid');
fig3 = figure();
title('Rectified left image');
hold on;
imshow(uint8(I1r));
fig4 = figure();
title('Rectified right image');
hold on;
imshow(uint8(I2r));


disp('Computing stereo...')
[imo,val]=imstereo_ncc(I2r,I1r,[-250,500],15);

%to get a cleaner map
mask= imread('./Data/mask.png');
maskr = imwarp(single(rgb2gray(mask)),@(x)htx(inv(H2),x), bb2);
imo(~logical(maskr) | val>.995 ) = nan;

figure(5);
imshow(imo,[],'InitialMagnification','fit');
title('Disparita NCC');
colorbar
disp('Done')

%% Reconstruct from disparity
[v,u] = meshgrid(1:size(imo,2), 1:size(imo,1));
M = triang_disp(u,v,imo,Pn2,Pn1);

%Change the sample rate to have a denser or sparser cloud of points
sr=100;
Clv=([I2r(:),I2r(:),I2r(:) ]./255);

figure(6);
scatter3(M(1,1:sr:end),M(2,1:sr:end),M(3,1:sr:end),2, Clv(1:sr:end,:));
axis equal
