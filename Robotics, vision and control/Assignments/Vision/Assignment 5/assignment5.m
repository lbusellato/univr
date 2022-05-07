% assignment5.m
% Author: Lorenzo Busellato, 2022
%
% Use of morphological operators to infer shape characteristics.
%

%% SETUP
clc;
close all;
clearvars;
addpath('data/');

%% LOAD AND DISPLAY IMAGE 
img = imread(strcat('data/1.jpg'));
I = im2gray(img);
fig1 = figure(); imshow(img); title('Original image'); drawnow();

%% IMAGE PREPROCESSING
% Subtract the background by image opening, then increase the contrast
I = imtophat(I,strel('disk',10)); % imadjust(I - imopen(I,strel(...)))
fig2 = figure(); imshow(I); title('Preprocessed image'); drawnow();

%% IMAGE BINARIZATION
% Binarize the image
I = imbinarize(I);
% Reduce noise with image opening
I = bwareaopen(I,100);
% Improve connectivity with image dilation
I = imdilate(I,strel('disk',10));
fig3 = figure(); imshow(1-I); title('Binarized image'); drawnow();

%% OBJECT CLASSIFICATION
% Identify connected components
cc = bwconncomp(I,4);
% Extract region properties
props = regionprops('table',cc,'Centroid', 'Circularity',...
    'MajorAxisLength','MinorAxisLength','EquivDiameter','BoundingBox')
% Initialize class array
objClass = strings(size(props,1),1);
for i = 1:size(props,1)
    objClass(i,:) = 'none';
end
% Detect coins by checking circularity
coinTolerance = 0.075;
coins = props.Circularity > 1 - coinTolerance & props.Circularity < 1 + coinTolerance;
nonCoins = zeros(size(coins,1),1);
centers = zeros(size(coins,1),2);
radii = zeros(size(coins,1),1);
for i = 1:size(props,1)
    if coins(i,1)
        % Compute center and radius of the coin
        centers(i,:) = props.Centroid(i,:);
        radii(i,1) = mean([props.MajorAxisLength(i,1) props.MinorAxisLength(i,1)],2)/2;
        text(centers(i,1),centers(i,2),'COIN','Color','G')
    else
        % Plot the non-coin object's bounding box
        rectangle('Position',props.BoundingBox(i,:),'EdgeColor','r');
        centroid = props.Centroid(i,:);
        text(centroid(1,1),centroid(1,2),'NOT A COIN','Color','r')
    end
end
hold on;
% Plot a circle where we found coins
viscircles(centers,radii,'Color','g');