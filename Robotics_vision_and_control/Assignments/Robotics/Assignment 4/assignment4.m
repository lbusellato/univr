% assignment4.m
% Author: Lorenzo Busellato, 2022
%
% This script implements the computation of multipoint cubic splines based 
% on the accelerations with given initial|final velocities, as well as the
% computation of smoothed cubic splines.
%

%% SETUP
clearvars;
clc;
close all;
%% CUBIC SPLINES W/ INITIAL|FINAL VELOCITIES, BASED ON ACCELERATIONS
qk = [10 20 0 30 40]; % Path points
tk = [0 2 4 8 10]; % Times
dqk = [5 2]; % Initial|final velocities

[p,v,a,j,t,m] = generateCubicSplines(qk,tk,dqk);

%% DISPLAY TRAJECTORY
fig1 = figure();
subplot(411); plot(t, p,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r','LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Position");
subplot(412); plot(t, v,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r','LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Velocity");
subplot(413); plot(t, a,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r','LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Acceleration");
subplot(414); plot(t, j,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r','LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Jerk");
sgtitle("CUBIC SPLINES BASED ON ACCELERATIONS WITH GIVEN INITIAL|FINAL VELOCITIES");

%% SMOOTH SPLINES
qk = [3 -2 -5 0 6 12 8]; % Path points
tk = [0 5 7 8 10 15 18]; % Times
mu1 = 1; mu2 = 0.3; mu3 = 0.6;
w1 = [inf 1 1 1 1 1 inf]; w2 = [inf 1 5 1 1 1 inf];
[p,v,a,j,t,m] = generateSmoothSplines(qk,tk,w1,mu1);
[p1,v1,a1,j1,t1,m1] = generateSmoothSplines(qk,tk,w1,mu2);
[p2,v2,a2,j2,t2,m2] = generateSmoothSplines(qk,tk,w1,mu3);
[p3,v3,a3,j3,t3,m3] = generateSmoothSplines(qk,tk,w2,mu3);

%% DISPLAY TRAJECTORY
fig2 = figure();
subplot(411); plot(t, p,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r','LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Position"); hold on;
plot(t, p1,'LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Position"); hold on;
plot(t, p2,'LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Position");  hold on;
plot(t, p3,'LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Position"); 
legend(sprintf('mu=%.2f', mu1),sprintf('mu=%.2f', mu2),sprintf('mu=%.2f w/ w1', mu3),sprintf('mu=%.2f w/ w2', mu3),'Location','best');
subplot(412); plot(t, v,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r','LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Velocity"); hold on;
plot(t, v1,'LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Velocity"); hold on;
plot(t, v2,'LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Velocity");  hold on;
plot(t, v3,'LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Velocity"); 
subplot(413); plot(t, a,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r','LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Acceleration"); hold on;
plot(t, a1,'LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Acceleration"); hold on;
plot(t, a2,'LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Acceleration"); hold on;
plot(t, a3,'LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Acceleration"); 
subplot(414); plot(t, j,'Marker','o','MarkerIndices',m,'MarkerEdgeColor','r','LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Jerk"); hold on;
plot(t, j1,'LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Jerk"); hold on;
plot(t, j2,'LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Jerk"); hold on;
plot(t, j3,'LineWidth',1.5); grid on; xlabel("Time [s]"); ylabel("Jerk"); 
sgtitle("SMOOTHED CUBIC SPLINES");