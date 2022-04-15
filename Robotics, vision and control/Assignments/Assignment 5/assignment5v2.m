% assignment5.m
% Author: Lorenzo Busellato, 2022
%
% This script implements the computation of a 3D trajectory from [0,0,0] to
% [2,0,2] by composing rectilinear and circular motion primitives.
%

%% SETUP
clearvars;
clc;
all_fig = findall(0, 'type', 'figure');
close(all_fig)

%% TRAJECTORY PARAMETERS
p = [ 0 0 0;
      1 0 0;
      2 1 0;
      2 1 2;
      2 0 2
    ]; % Path points
c = [-1 -1 -1;
     1 1 0;
     2 1 1;
     -1 -1 -1;
    ]; % Centers for the circular primitives
u = [ 0 1;
      -3.14/2 0;
      0 3.24;
      0 1]; % Ranges for parametric equations
syms ui;
x = []; y = []; z = [];
sz = size(p,1);
for i = 1:sz-1
    if c(i,:)==[-1 -1 -1] % Linear path
        x = [x; p(i,1)+(p(i+1,1)-p(i,1))*ui];
        y = [y; p(i,2)+(p(i+1,2)-p(i,2))*ui];
        z = [z; p(i,3)+(p(i+1,3)-p(i,3))*ui];
    else % Circular path
        x = [x; p(i,1)+(p(i+1,1)-p(i,1))*ui];
        y = [y; p(i,2)+(p(i+1,2)-p(i,2))*ui];
        z = [z; p(i,3)+(p(i+1,3)-p(i,3))*ui];
    end
end

fig1 = figure();
for i = 1:size(x,2)
    fplot3(x,y,z,u(i,:),'LineWidth',1.5,'Color','b');
end





















