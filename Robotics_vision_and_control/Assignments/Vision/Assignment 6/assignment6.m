% assignment6.m
% Author: Lorenzo Busellato, 2022
%
% 3D analysis pipeline
%

%% SETUP
clc;
close all;
clearvars;
addpath('data/');
addpath('scripts/');
addpath('cloud/');
% Needed to keep the results of K-means consistent
rng(0); 
% Choose which image (edit depth thresholds as well!!!)
imNo = 3;
% Choose whether or not to apply K-means clustering
useKMeans = true;

%% LOAD AND DISPLAY IMAGE 
rgb = imread(['data/' num2str(imNo) '_rgb.jpg']);
depth = imread(['data/' num2str(imNo) '_depth.png']);
fig1 = figure(); imshowpair(rgb,depth,'montage');
title('Original vs depth image'); drawnow;

%% DEPTH THRESHOLDING
if imNo == 1
    mask = depth >= 600 & depth <= 645;
elseif imNo == 2
    mask = depth >= 690 & depth <= 770;
else 
    mask = depth >= 600 & depth <= 800;
end
% NB no image binarization needed since I work on the mask
mask = imopen(mask,strel('disk',10));
fig2 = figure(); imshow(mask);
title('Extracted shape'); drawnow;

%% SHAPE REFINEMENT - K-MEANS CLUSTERING
% Perform k-means clustering if needed, e.g. when the object is on a
% surface that doesn't get masked away, i.e. in all cases where depth
% thresholding isn't enough
if useKMeans
    mask = kMeansMask(rgb,mask,3);
    fig3 = figure(); imshow(mask);
    title('K-means mask'); drawnow;
end

%% SHAPE REFINEMENT - BOUNDARY & CONNECTED COMPONENTS EXTRACTION
% IMprove connectivity with image opening and fill the holes
mask = bwareaopen(mask,1000);
mask = imfill(mask,'holes');
% Extract the connected components
cc = bwconncomp(mask,4);
props = regionprops('table',cc,'Area');
% The component most likely to be the object is the one with the biggest
% area
[~, i] = max(props.Area);
mask(:,:) = false;
mask(cc.PixelIdxList{i}) = true;
% Extract the boundary
boundary = bwboundaries(mask);
boundary = boundary{1};  
mask_boundary = false(size(mask));
for i=1:length(boundary)
    mask_boundary(boundary(i,1),boundary(i,2)) = true;
end
% Show the boundary
show_mask = uint8(cat(3,mask,mask,mask))*255;
tmp = show_mask(:,:,1);
tmp(mask_boundary) = 255;
show_mask(:,:,1) = tmp;
tmp = show_mask(:,:,1);
tmp(mask_boundary) = 0;
show_mask(:,:,2) = tmp;
tmp = show_mask(:,:,1);
tmp(mask_boundary) = 0;
show_mask(:,:,3) = tmp;
% Show the boundary
fig4 = figure(); imshow(show_mask);
title('Boundary'); drawnow;
% Show the result of the masking in color
fig5 = figure(); imshow(rgb .* uint8(repmat(mask,[1 1 3])));
title('Masked image'); drawnow;

%% 3D POINT CLOUD
% Internal camera parameters
fu = 525; % u focal lenght in pixels
fv = 525; % v focal lenght in pixels
u0 = 319.5; % u coordinate of the principal point
v0 = 239.5; % v coordinate of the principal point
cameraParams = [fu fv u0 v0];
% Generate and plot the 3D point cloud
[cloud,cloud_rgb] = generatePointCloud(rgb,uint16(mask).*depth,cameraParams);
scatter3(cloud(:,1),cloud(:,2),cloud(:,3), 6, cloud_rgb, '.');
xlabel('X'); ylabel('Y'); zlabel('Z'); title('3D point cloud'); axis equal;
% Save the result
exportMeshToPly(cloud,[],cloud_rgb,['cloud/' num2str(imNo) '_cloud']);

%% CENTROID AND ORIENTATION
cc = bwconncomp(mask, 4);
props = regionprops('table',cc,'Centroid','Orientation');
c = props.Centroid;
d = props.Orientation;
% Compute some points along the main orientation
m = -tand(d);
D = [-10:2:-1 2:2:10];
x = c(1) + D/sqrt(1+abs(m));
y = m*(x - c(1)) + c(2);
p = [x; y]';
% Plot the points on the 2D image
fig6 = figure(); imshow(mask); hold on;
scatter(c(1),c(2),'r','filled');
scatter(p(:,1),p(:,2),'b','filled');
title('Main orientation'); drawnow;
% Plot the points in the 3D cloud of points
M = uint16([c; p]);
p_mask = false(size(mask));
p_mask(sub2ind(size(mask),M(:,2),M(:,1))) = true;
[orientation_cloud,~] = generatePointCloud(rgb,uint16(p_mask).*depth,cameraParams);
fig7 = figure();
scatter3(cloud(:,1),cloud(:,2),cloud(:,3), 6, cloud_rgb, '.');
xlabel('X'); ylabel('Y'); zlabel('Z'); title('Main orientation'); 
hold on;
scatter3(orientation_cloud(:,1),orientation_cloud(:,2),orientation_cloud(:,3), 18, 'r', 'filled');
% Fit a line to the points, which is the main direction
[m,q] = fitLine(orientation_cloud);
% Plot the line
x = -1.25*max(cloud(:,1)):1.25*max(cloud(:,1));
L = (m.*x + q)';
hold on
scatter3(L(:,1),L(:,2),L(:,3),5,'filled'); axis equal;

%% PLANE FITTING
% Compute the plane centroid and normal
[c,n] = fitPlane(cloud);
% Plot the plane
fig8 = figure(); 
scatter3(cloud(:,1),cloud(:,2),cloud(:,3), 6, cloud_rgb, '.');
xlabel('X'); ylabel('Y'); zlabel('Z'); title('Plane fit'); axis equal;
hold on;
% Create plane mesh
[X, Y] = meshgrid(1.25*min(cloud(:,1)):8:1.25*max(cloud(:,1)), ...
    1.25*min(cloud(:,2)):8:1.25*max(cloud(:,2)));
Z = -(n(1)*X + n(2)*Y - n'*c) / n(3);
mesh(X, Y, Z, 'FaceAlpha', 0); axis equal;

%% OBJECT ORIENTATION
% The third direction is given by n x m
l = cross(n,m);
% Compute the frame by normalizing all three directions, scaled for
% visibility
O = 50.*[n/norm(n),m/norm(m),l/norm(l)];
% Plot the frame
fig9 = figure(); 
scatter3(cloud(:,1),cloud(:,2),cloud(:,3), 6, cloud_rgb, '.');
xlabel('X'); ylabel('Y'); zlabel('Z'); title('Object orientation'); 
axis equal; hold on;
quiver3(c(1),c(2),c(3),O(1,1),O(2,1),O(3,1),'LineWidth',3,'Color','red');
quiver3(c(1),c(2),c(3),O(1,2),O(2,2),O(3,2),'LineWidth',3,'Color','green');
quiver3(c(1),c(2),c(3),O(1,3),O(2,3),O(3,3),'LineWidth',3,'Color','blue');

%% FIT BOUNDARIES
% Recover the 3D coordinates of the boundary
boundary3D = generatePointCloud(rgb,uint16(mask_boundary).*depth,cameraParams);
fig10 = figure();
scatter3(cloud(:,1),cloud(:,2),cloud(:,3), 6, cloud_rgb, '.');
xlabel('X'); ylabel('Y'); zlabel('Z'); title('Boundary line fitting'); 
hold on;
scatter3(boundary3D(:,1),boundary3D(:,2),boundary3D(:,3),5,'filled');
% Apply ransac four times, removing each time the inliers of the previous
inlier = false([size(boundary3D,1) 1]);
sampleNumber = 5;
maxIterations = 1000; 
threshold = 4;
linesM = zeros(3,4);
linesQ = zeros(3,4);
for i = 1:4
    [m,q,inliers] = ransacFitLine(boundary3D(~inlier,:), ...
                                  sampleNumber, ...
                                  maxIterations, ...
                                  threshold);
    linesM(:,i) = m; linesQ(:,i) = q;
    inlier(~inlier) = inliers;
    % Plot the line
    x = -2*max(cloud(:,1)):2*max(cloud(:,1));
    L = (m.*x + q)';
    hold on;
    scatter3(L(:,1),L(:,2),L(:,3),5,'filled'); 
end
axis equal;

%% CORNER DETECTION
intersectingLines = [];
for i = 1:4
    for j = 1:4
        if j ~= i
            a = angleBetweenLines(linesM(:,i),linesM(:,j));
            if a >= 85 && a <= 95
                intersectingLines = [intersectingLines; i j];
            end
        end
    end
end   
intersectingLines = unique(sort(intersectingLines,2),'rows');
corners = [];
for i = 1:4
    q1 = linesQ(:,intersectingLines(i,1));
    m1 = linesM(:,intersectingLines(i,1));
    q2 = linesQ(:,intersectingLines(i,2));
    m2 = linesM(:,intersectingLines(i,2));
    corners = [corners; lineIntersection(q1,m1,q2,m2)'];
end
hold on;
scatter3(corners(:,1),corners(:,2),corners(:,3),35,'filled','MarkerEdgeColor','b','MarkerFaceColor','b'); 





