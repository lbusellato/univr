% assignment2.m
% author: Lorenzo Busellato, 2022
%
% This script implements a dynamically modifiable trapezoidal velocity
% profile generator.
%

%% SETUP
clearvars;
clc;
all_fig = findall(0, 'type', 'figure');
close(all_fig)

%% UI
run("ui.m")
delPointDD.Items = "0";
delPointDD.ItemsData = 0;

%% TRAJECTORY COMPUTATION
[q,v,a,t] = generateTrapezoidal(0, 10, 0, 5, 2, nan, nan, nan, nan, nan, nan);
plot(posAxes,t,q,'LineWidth',2);
plot(velAxes,t,v,'LineWidth',2);
plot(accAxes,t,a,'LineWidth',2);