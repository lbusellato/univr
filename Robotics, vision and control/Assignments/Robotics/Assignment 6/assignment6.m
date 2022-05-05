% assignment6.m
% Author: Lorenzo Busellato, 2022
%
% This script implements the computation of a 3D trajectory 
%

%% SETUP
clearvars;
clc;
all_fig = findall(0, 'type', 'figure');
close(all_fig)

%% PLOT SPHERE AND RANDOM POINTS
P0 = [1 0 3]; % Sphere center
R = 3; % Sphere radius
fig1 = figure();
[X1 Y1 Z1] = sphere(50);
X = (R*X1)+P0(1,1);
Y = (R*Y1)+P0(1,2);
Z = (R*Z1)+P0(1,3);
surf(X,Y,Z); axis equal;
hold on;
xlabel('X'); ylabel('Y'); zlabel('Z');
% Pick three random points
i = randi([1 51], 1, 3);
j = randi([1 51], 1, 3);
P = [X1(i(1), j(1)) Y1(i(1), j(1)) Z1(i(1), j(1));
     X1(i(2), j(2)) Y1(i(2), j(2)) Z1(i(2), j(2));
     X1(i(3), j(3)) Y1(i(3), j(3)) Z1(i(3), j(3))];
scatter3(R*P(1,1)+P0(1,1),R*P(1,2)+P0(1,2),R*P(1,3)+P0(1,3),'LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r');
scatter3(R*P(2,1)+P0(1,1),R*P(2,2)+P0(1,2),R*P(2,3)+P0(1,3),'LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g');
scatter3(R*P(3,1)+P0(1,1),R*P(3,2)+P0(1,2),R*P(3,3)+P0(1,3),'LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b');

for i = 1:3
    if i == 3
        P1 = P(i,:); P2 = P(1,:);
    else
        P1 = P(i,:); P2 = P(i+1,:);
    end
    w = P2-(dot(P2,P1))*P1;
    u = w./norm(w);
    c = acos(dot(P2,P1));
    t = 0:0.01:c;
    alpha = @(t)cos(t)'*P1+sin(t)'*u;
    geodesic = alpha(t);
    plot3(R*geodesic(:,1)+P0(1,1),R*geodesic(:,2)+P0(1,2),R*geodesic(:,3)+P0(1,3),'LineWidth',2)
end




