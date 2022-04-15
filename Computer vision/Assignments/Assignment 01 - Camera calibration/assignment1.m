% assignment1.m
% Author: Lorenzo Busellato
%
% This script implements the direct calibration method by computing
% the A matrix using the Kronecker product and then using singular value
% decomposition to solve the system Avec(p)=0. The perspective matrix is 
% then constructed by rearranging the components of the vector vec(p). 
% Finally the known 3D points are reprojected onto the image using the
% calculated perspective matrix in order to showcase the accuracy of the 
% reprojection itself.

%% SETUP
clearvars
close all
clc
% Load the image of the calibration object:
calib = imread(strcat('image1.jpg'));
% Homogeneous coordinates of the 3d calibration points
Mi =    [
    0, 0, 0, 1;
    61, 0, 0, 1;
    61, 61, 0, 1;
    0, 0, 55, 1;
    61, 0, 55, 1;
    61, 61, 55, 1;
    ]; 
% Show the image
fig = figure(1);
title("Pick the calibration points.")
hold on;
imshow(calib);
hold on;

%% CALIBRATION POINTS INPUT
mi = zeros(6,3);
for i = 1:6
    % Collect the homogeneous coordinates of the 2D calibration points:  
    [x,y] = ginput(1);
    mi(i,:) = [x,y,1];
    scatter(x, y, 'g', '+');
    text(x, y, strcat('.       ',num2str(i)));
end

%% FULL PERSPECTIVE MATRIX COMPUTATION
A = zeros(12);
B = [];
% Compute the A matrix using Kronecker product
for i = 1:6
    a = mi(i,:).';
    ax = [
        0, -a(3,1), a(2,1);
        a(3,1), 0, -a(1,1);
        -a(2,1), a(1,1), 0;
        ];
    kro = kron(ax, Mi(i,:));
    A(2*i-1,:) = kro(1,:);
    A(2*i,:) = kro(2,:);  
end
% Solution of the linear homogeneous system Avec(p)=0 using SVD
[U,S,V] = svd(A,'econ');
vecP = V(:,size(A,2));
% Construction of the perspective matrix
P = [
    vecP(1,1), vecP(2,1), vecP(3,1), vecP(4,1);
    vecP(5,1), vecP(6,1), vecP(7,1), vecP(8,1);
    vecP(9,1), vecP(10,1), vecP(11,1), vecP(12,1)
]
% Save the resulting full perspective matrix
save('perspective_matrix_1', 'P');

%% 3D POINTS REPROJECTION
mi_reproj = zeros(6,3);
% Reproject the known 3D points onto the image
for j = 1:6
    m = (P * (Mi(j,:).')).';
    mi_reproj(j,:) = m(1,:) / m(1,3);
    scatter(mi_reproj(j,1), mi_reproj(j,2), 'r');   
end

title("The red circles are centered on the reprojected points.")