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
P = [ 0 1 2 2 2;
      0 0 1 1 0;
      0 0 0 2 2]; % Path points
ti = 1; % Initial time
ts = 0.01; % Time step
dt = 1; % Duration of trajectory components

%% MOTION PRIMITIVES
% For each primitive generate the parameter u and its derivatives by linear
% interpolation, then generate the motion primitive itself.
[t1,u1,uD1,uDD1,dddu1] = linearPoly(ts,ti,dt+ti,0,1);
[p1, v1, a1, j1] = rectilinear(u1, uD1, uDD1, dddu1, P(:,1), P(:,2));

[t2,u2,uD2,uDD2,dddu2] = linearPoly(ts,t1(end),t1(end)+dt,0,pi/2);
[p2, v2, a2, j2] = circular(u2, uD2, uDD2, dddu2, P(:,2), [1 1 0]', [0 0 1]');

[t3,u3,uD3,uDD3,dddu3] = linearPoly(ts,t2(end),t2(end)+dt,0,pi);
[p3, v3, a3, j3] = circular(u3, uD3, uDD3, dddu3, P(:,3), [2 1 1]', [1 0 0]');

[t4,u4,uD4,uDD4,dddu4] = linearPoly(ts,t3(end),t3(end)+dt,0,1);
[p4, v4, a4, j4] = rectilinear(u4, uD4, uDD4, dddu4, P(:,4), P(:,5));

%% PLOT THE TRAJECTORY
p = [p1, p2, p3, p4];
subplot(1,4,1);
plot3(p(1,:),p(2,:),p(3,:),'Color','#0072BD','LineWidth',3);
title('Position');
xlabel('x');
ylabel('y');
zlabel('z');
view(-60, 30);
axis equal;
grid on;

v = [v1, v2, v3, v4];
subplot(1,4,2);
plot3(v(1,:),v(2,:),v(3,:),'Color','#D95319','LineWidth',3);
title('Velocity');
xlabel("x'");
ylabel("y'");
zlabel("z'");
view(-60, 30);
axis equal;
grid on;

a = [a1, a2, a3, a4];
subplot(1,4,3);
plot3(a(1,:),a(2,:),a(3,:),'Color','#7E2F8E','LineWidth',3);
title('Acceleration');
xlabel("x''");
ylabel("y''");
zlabel("z''");
view(-60, 30);
axis equal;
grid on;

j = [j1, j2, j3, j4];
subplot(1,4,4);
plot3(j(1,:),j(2,:),j(3,:),'Color','#FE238E','LineWidth',3);
title('Jerk');
xlabel("x''");
ylabel("y''");
zlabel("z''");
view(-60, 30);
axis equal;
grid on;