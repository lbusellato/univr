% assignment3.m
% Author: Lorenzo Busellato, 2022
%
% This script implements the computation of multipoint cubic splines in the
% following cases:
%   a) Given initial|path|final velocities.
%   b) Given initial|final velocities w/ Euler approximation of path
%   velocities.
%   c) Given initial|final velocities and computation of path velocities w/
%   the constraint of continuous accelerations (Thomas' algorithm).
%

%% SETUP
clearvars;
clc;
all_fig = findall(0, 'type', 'figure');
close(all_fig)

%% CUBIC SPLINES W/ INITIAL|PATH|FINAL VELOCITIES
qk = [10 20 0 30 40]; % Path points
tk = [0 2 4 8 10]; % Times
dqk = [0 0 0 5.2 0]; % Path point velocities

[p,v,a,j,t,m] = generateCubicSplines(qk,tk,dqk);

%% DISPLAY TRAJECTORY
fig1 = figure();
subplot(411); plot(t, p,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r'); grid on; xlabel("Time [s]"); ylabel("Position");
subplot(412); plot(t, v,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r'); grid on; xlabel("Time [s]"); ylabel("Velocity");
subplot(413); plot(t, a,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r'); grid on; xlabel("Time [s]"); ylabel("Acceleration");
subplot(414); plot(t, j,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r'); grid on; xlabel("Time [s]"); ylabel("Jerk");
sgtitle("CUBIC SPLINES WITH GIVEN INITIAL|PATH|FINAL VELOCITIES");

%% CUBIC SPLINES W/ INITIAL|FINAL VELOCITIES
qk = [10 20 0 30 40]; % Path points
tk = [0 2 4 8 10]; % Times
dqk = [0 0]; % Path point velocities

[p,v,a,j,t,m] = generateCubicSplines(qk,tk,dqk);

%% DISPLAY TRAJECTORY
fig2 = figure();
subplot(411); plot(t, p,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r'); grid on; xlabel("Time [s]"); ylabel("Position");
subplot(412); plot(t, v,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r'); grid on; xlabel("Time [s]"); ylabel("Velocity");
subplot(413); plot(t, a,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r'); grid on; xlabel("Time [s]"); ylabel("Acceleration");
subplot(414); plot(t, j,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r'); grid on; xlabel("Time [s]"); ylabel("Jerk");
sgtitle("CUBIC SPLINES WITH GIVEN INITIAL|FINAL VELOCITIES");

%% CUBIC SPLINES W/ INITIAL|FINAL VELOCITIES AND CONTINUOUS ACCELERATIONS
qk = [10 20 0 30 40]; % Path points
tk = [0 2 4 8 10]; % Times
dqk = [0 0];

[p,v,a,j,t,m] = generateCubicSplines(qk,tk,dqk, true);

%% DISPLAY TRAJECTORY
fig2 = figure();
subplot(411); plot(t, p,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r'); grid on; xlabel("Time [s]"); ylabel("Position");
subplot(412); plot(t, v,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r'); grid on; xlabel("Time [s]"); ylabel("Velocity");
subplot(413); plot(t, a,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r'); grid on; xlabel("Time [s]"); ylabel("Acceleration");
subplot(414); plot(t, j,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r'); grid on; xlabel("Time [s]"); ylabel("Jerk");
sgtitle("CUBIC SPLINES WITH GIVEN INITIAL|FINAL VELOCITIES & CONTINUOUS ACCELERATION");
