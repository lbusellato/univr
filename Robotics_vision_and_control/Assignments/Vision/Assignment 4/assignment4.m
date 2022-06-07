% assignment4.m
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
img = imread('data/2.jpg');
I = im2gray(img);
fig1 = figure(); imshow(img); title('Original image'); drawnow();

%% BACKGROUND SUBTRACTION
% Subtract the background by image opening
se = strel('disk',200); % 120 for image 1, 200 for image 2
bg = imopen(I,se);
fig2 = figure(); imshow(bg); title('Extracted background'); drawnow();
% Stretch histogram -> improve black<->white distribution
I_nobg = imadjust(I - bg);
fig3 = figure(); imshow(I_nobg); title('Removed background'); drawnow();

%% IMAGE BINARIZATION
I_bin = imbinarize(I_nobg);
% Remove noise by removing small artefacts
I_bin = bwareaopen(I_bin,100); % 50 for image 1, 100 for image 2
% Dilate the image to improve object connectivity
se = strel('disk',37); % 10 for image 1, 37 for image 2
I_bin = imdilate(I_bin,se);
I_bin = imerode(I_bin,se);
fig4 = figure(); imshow(I_bin); title('Binarized image'); drawnow();

%% CONNECTED COMPONENTS LABELING
cc = bwconncomp(I_bin,4);
% Color code the objects
labeled = labelmatrix(cc);
I_label = label2rgb(labeled,'spring','c','shuffle');
fig5 = figure(); imshow(I_label); title('Labeled image'); drawnow();

%% OBJECT CHARACTERIZATION
I_props = regionprops(cc, ...
    'Centroid','MajorAxisLength','MinorAxisLength','Circularity','BoundingBox');
fig6 = figure(); imshow(img); title('Object characterization'); drawnow();
% Sort the properties wrt (rounded) circularity
T = struct2table(I_props);
T.Circularity = round(T.Circularity,1);
radii = [];
centers = [];
biggestCoinIndex = 0;
smallestCoinIndex = 0;
maxRadius = 0;
minRadius = inf;
for i = 1:size(T,1)
    if T.Circularity(i) == 1
        % It's a coin
        centers = [centers; T.Centroid(i,:)];
        radius = mean([T.MajorAxisLength(i) T.MinorAxisLength(i)])/2;
        radii = [radii; radius];
        % Keep track of which coin is the biggest
        if radius > maxRadius
            maxRadius = radius;
            biggestCoinIndex = i;
        elseif radius < minRadius
            minRadius = radius;
            smallestCoinIndex = i;
        end
    else
        % It isn't a coin
        rectangle('Position',T.BoundingBox(i,:),'EdgeColor','r','LineWidth',2);
    end
end
% Plot circles around the coins
viscircles(centers,radii);
% Plot all objects' centroids
hold on; scatter(T.Centroid(:,1),T.Centroid(:,2),300,'r.');
% Label the objects
for i = 1:size(T,1)
    if T.Circularity(i) == 1
        % It's a coin
        if i == biggestCoinIndex
            % Is it the biggest?
            text(T.Centroid(i,1),T.Centroid(i,2),'\rightarrow BIGGEST COIN','Color','r');
        elseif i == smallestCoinIndex
            % Is it the smallest?
            text(T.Centroid(i,1),T.Centroid(i,2),'\rightarrow SMALLEST COIN','Color','r');
        else
            text(T.Centroid(i,1),T.Centroid(i,2),'\rightarrow COIN','Color','r');
        end
    else
        % It isn't a coin
        text(T.Centroid(i,1),T.Centroid(i,2),'\rightarrow USB DRIVE','Color','r');
    end
end