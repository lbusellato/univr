% assignment6.m
% Author: Lorenzo Busellato, 2022
%
% This script implements the computation of the shortest trajectory on a 
% spherical surface between three random points, while mantaining the
% normal component of the Frenet frame orthogonal to the sphere's surface.
%

%% SETUP
clearvars;
clc;
close all;
% Sphere center - random
P0 = randi(10, 1, 3); 
% Sphere radius - random
R = randi(10, 1, 1) + 1;

%% PLOT SPHERE AND RANDOM POINTS
% Generate the sphere's coordinates
S = generateSphere(P0, R);
fig1 = figure();
surf(S.X, S.Y, S.Z); 
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Geodesic curves - Frenet frames'); 
colormap bone; axis equal; hold on;
% Pick n random points
i = randi([1 size(S.X, 1)], 1, 3);
j = randi([1 size(S.X, 1)], 1, 3);
P = [S.X(i(1), j(1)) S.X(i(2), j(2)) S.X(i(3), j(3));
     S.Y(i(1), j(1)) S.Y(i(2), j(2)) S.Y(i(3), j(3));
     S.Z(i(1), j(1)) S.Z(i(2), j(2)) S.Z(i(3), j(3))];
% Plot the points
scatter3(P(1, :), P(2, :), P(3, :),'r','filled'); hold on;

%% GEODESICS & FRENET FRAMES
[G1, F1] = geodesic(P(:, 1), P(:, 2), P0', pi / 24);
[G2, F2] = geodesic(P(:, 1), P(:, 3), P0', pi / 24);
[G3, F3] = geodesic(P(:, 3), P(:, 2), P0', pi / 24);
G = [G1; G2; G3];
scatter3(G(:,1),G(:,2),G(:,3),'.b'); hold on;
F = cat(3, F1, F2, F3);
for i=1:size(F,3)
    quiver3(G(i,1),G(i,2),G(i,3),F(1,1,i),F(2,1,i),F(3,1,i),'Color','red')
    quiver3(G(i,1),G(i,2),G(i,3),F(1,2,i),F(2,2,i),F(3,2,i),'Color','green')
    quiver3(G(i,1),G(i,2),G(i,3),F(1,3,i),F(2,3,i),F(3,3,i),'Color','blue')
end


