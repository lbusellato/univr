% assignment6.m
% Author: Lorenzo Busellato
%
% This script implements the computation of the homography that aligns two 
% stereo images. The homography is computed by firstly constructing the
% following linear system:
% 
%   kron(mi1, mi2x)vec(H) = 0
%
% where kron is the Kronecker product, mi1 is a set of points on the left
% image, mi2x is the cross product matrix of the points in the right image
% corresponding to mi1 and vec(H) is the vectorization of the homography H.
% The system is then solved using SVD.
% Finally the resulting homography is used to warp the second
% image into the reference frame of the first, in order to produce a
% mosaicing of the two images.

%% SETUP
clearvars;
close all;
clc;
% Load in the images
img1 = rgb2gray(imread('./img1.jpg'));
img2 = rgb2gray(imread('./img2.jpg'));
% Set up the figures
fig1 = figure();
title('Pick a point');
hold on;
imshow(img1);
fig2 = figure();
title('Pick the corresponding point');
hold on;
imshow(img2);
n = 10; % Number of points to acquire

%% POINT ACQUISITION
p1 = zeros(2, n);
p2 = zeros(2, n);
for i = 1:n
    figure(fig1);
    hold on;
    [x, y] = ginput(1);
    p1(:, i) = [x; y];
    plot(x, y, 'g*');
    figure(fig2);
    hold on;
    [x, y] = ginput(1);
    p2(:, i) = [x; y];
    plot(x, y, 'r*');
end

%% COMPUTATION OF THE HOMOGRAPHY
A = zeros(2 * n, 9);
for i = 1:n
    % Homogeneous coordinates of the acquired points
    mi1 = [p1(:, i); 1]';
    mi2 = [p2(:, i); 1];
    % Cross product matrix of mi2
    mi2x = [   0     -mi2(3) mi2(2);
             mi2(3)     0   -mi2(1);
            -mi2(2)   mi2(1)   0];
    % Kronecker product
    kro = kron(mi1, mi2x);
    % The first two linearly independent lines of kro go into A
    A((2*i-1):(2*i), :) = kro(1:2, :);
end
% Solving the linear problem Avec(h) = 0 with SVD
[~, ~, V] = svd(A);
% Constructing the homography
H = reshape(V(:,end), 3, 3);
H = H./H(3, 3);

%% IMAGE WARPING AND MOSAICING
% Warping the second image to the plane of the first one
[img2_warp, bb, ~] = imwarp(img2, inv(H), 'linear', 'valid');
% Eliminate from the warped image NaN values resulted from the warping
ind = find(isnan(img2_warp)); 
img2_warp(ind) = 0;
% Reorder the coordinates of the warped image's bounding box
bb_ij = [bb(2); bb(1); bb(4); bb(3)];
% Group the coordinates of the warped and original images' bbs
corners = [bb_ij [0; 0; size(img1)']];
% Compute the minimum and maximum coordinates of the two bbs to get the
% coordinates of the total bb
bb_mos = [min(corners(1, :)); min(corners(2, :));
    max(corners(3, :)); max(corners(4, :))];
% Apply positive offset to remove negative coordinates
offs = [abs(min(corners(1, :))); abs(min(corners(2, :)))];
sz_mos = bb_mos + [offs; offs];
% Create the two parts of the mosaicing
mosaic_ref = zeros(sz_mos(3), sz_mos(4));
mosaic_mov = mosaic_ref;
% Place the original image and the warped image into the two parts
% according to the offsets
if offs(1) > 0
    if offs(2) > 0
        mosaic_ref(offs(1):(size(img1,1)+offs(1)-1),offs(2):(size(img1,2)+offs(2)-1))=img1(:,:);
        mosaic_mov(1:(size(img2_warp,1)),1:size(img2_warp,2))=img2_warp(:,:);
    else
        mosaic_ref(offs(1):(size(img1,1)+offs(1)-1),1:size(img1,2))=img1(:,:);
        mosaic_mov(1:size(img2_warp,1),abs(bb_ij(2)):(size(img2_warp,2)+abs(bb_ij(2))-1))=img2_warp(:,:);
    end
else
    if offs(2) > 0
        mosaic_ref(1:size(img1,1),offs(2):(size(img1,2)+offs(2)-1))=img1(:,:);
        mosaic_mov(bb_ij(1):(size(img2_warp,1)+bb_ij(1)-1),1:size(img2_warp,2))=img2_warp(:,:);
    else
        mosaic_ref(1:size(img1,1),1:size(img1,2))=img1(:,:);
        mosaic_mov(bb_ij(1):(size(img2_warp,1)+bb_ij(1)-1),bb_ij(2):(size(img2_warp,2)+bb_ij(2)-1))=img2_warp(:,:);
    end
end
% Halve the intensity values of both parts (so that the intersection
% displays the correct values) and merge them into one
mosaic_out = mosaic_ref.*0.5 + mosaic_mov.*0.5;
% Show the mosaicing
fig3 = figure();
title("Mosaicing of the images");
hold on;
imshow(uint8(mosaic_out));