% assignment1.m
% author: Lorenzo Busellato, 2022
%
% This script implements the computation of 3rd, 5th and 7th order
% polynomials for point-to-point trajectory planning.
%

%% SETUP
close all;
clearvars;
clc;

%% TRAJECTORIES COMPUTATION
ti = 0; % Initial time
tf = 1; % Final time
qi = 0; % Initial position
qf = 1; % Final position
vi = 0; % Initial velocity
vf = 0; % Final velocity
ai = 0; % Initial acceleration
af = 0; % Final acceleration
ji = 0; % Initial jerk
jf = 0; % Final jerk
% 3rd order
[q3,v3,a3,j3,s3] = generatePolyTrajectory(ti, tf, qi, qf, vi, vf);
% 5th order
[q5,v5,a5,j5,s5] = generatePolyTrajectory(ti, tf, qi, qf, vi, vf, ai, af);
% 7th order
[q7,v7,a7,j7,s7] = generatePolyTrajectory(ti, tf, qi, qf, vi, vf, ai, af, ji, jf);
t = ti:0.001:tf;

%% POS/VEL/ACC/JERK/SNAP DISPLAY
fig1 = figure();
subplot(5,3,15);
% 3rd order
ax1 = subplot(5,3,1); plot(t, q3); grid on; xlabel("Time [s]"); ylabel("Position"); title("3rd order");
ax4 = subplot(5,3,4); plot(t, v3); grid on; xlabel("Time [s]"); ylabel("Velocity");
ax7 = subplot(5,3,7); plot(t, a3); grid on; xlabel("Time [s]"); ylabel("Acceleration");
ax10 = subplot(5,3,10); plot(t, j3); grid on; xlabel("Time [s]"); ylabel("Jerk");
ax13 = subplot(5,3,13); plot(t, s3); grid on; xlabel("Time [s]"); ylabel("Snap");
% 5th order
ax2 = subplot(5,3,2); plot(t, q5); grid on; xlabel("Time [s]"); ylabel("Position"); title("5th order");
ax5 = subplot(5,3,5); plot(t, v5); grid on; xlabel("Time [s]"); ylabel("Velocity");
ax8 = subplot(5,3,8); plot(t, a5); grid on; xlabel("Time [s]"); ylabel("Acceleration");
ax11 = subplot(5,3,11); plot(t, j5); grid on; xlabel("Time [s]"); ylabel("Jerk");
ax14 = subplot(5,3,14); plot(t, s5); grid on; xlabel("Time [s]"); ylabel("Snap");
% 7th order
ax3 = subplot(5,3,3); plot(t, q7); grid on; xlabel("Time [s]"); ylabel("Position"); title("7th order");
ax6 = subplot(5,3,6); plot(t, v7); grid on; xlabel("Time [s]"); ylabel("Velocity");
ax9 = subplot(5,3,9); plot(t, a7); grid on; xlabel("Time [s]"); ylabel("Acceleration");
ax12 = subplot(5,3,12); plot(t, j7); grid on; xlabel("Time [s]"); ylabel("Jerk");
ax15 = subplot(5,3,15); plot(t, s7); grid on; xlabel("Time [s]"); ylabel("Snap");
sgtitle("Polynomial trajectories");
axes = [ax1 ax2 ax3 ax4 ax5 ax6 ax7 ax8 ax9 ax10 ax11 ax12 ax13 ax14 ax15];
% UI controls
p = uipanel(fig1,'Position',[0.02 0.2 0.07 0.25]);
itime = uicontrol(p, 'Style','edit','Position',[30 10 40 20],'String','0');
itime_title = uicontrol(p, 'Style','text','Position',[10 10 15 20], 'String', 'ti');
ftime = uicontrol(p, 'Style','edit','Position',[30 30 40 20],'String','1');
ftime_title = uicontrol(p, 'Style','text','Position',[10 30 15 20], 'String', 'tf');
ipos = uicontrol(p, 'Style','edit','Position',[30 50 40 20],'String','0');
ipos_title = uicontrol(p, 'Style','text','Position',[10 50 15 20], 'String', 'qi');
fpos = uicontrol(p, 'Style','edit','Position',[30 70 40 20],'String','1');
fpos_title = uicontrol(p, 'Style','text','Position',[10 70 15 20], 'String', 'qf');
ivel = uicontrol(p, 'Style','edit','Position',[30 90 40 20],'String','0');
ivel_title = uicontrol(p, 'Style','text','Position',[10 90 15 20], 'String', 'vi');
fvel = uicontrol(p, 'Style','edit','Position',[30 110 40 20],'String','1');
fvel_title = uicontrol(p, 'Style','text','Position',[10 110 15 20], 'String', 'vf');
iacc = uicontrol(p, 'Style','edit','Position',[30 130 40 20]);
iacc_title = uicontrol(p, 'Style','text','Position',[10 130 15 20], 'String', 'ai');
facc = uicontrol(p, 'Style','edit','Position',[30 150 40 20]);
facc_title = uicontrol(p, 'Style','text','Position',[10 150 15 20], 'String', 'af');
ijerk = uicontrol(p, 'Style','edit','Position',[30 170 40 20]);
ijerk_title = uicontrol(p, 'Style','text','Position',[10 170 15 20], 'String', 'ji');
fjerk = uicontrol(p, 'Style','edit','Position',[30 190 40 20]);
fjerk_title = uicontrol(p, 'Style','text','Position',[10 190 15 20], 'String', 'jf');
recompute = uicontrol(p, 'Style','pushbutton','Position',[10 210 120 20], 'String', 'Recompute','Callback',{@recomputeTraj,axes,itime,ftime,ipos,fpos,ivel,fvel,iacc,facc,ijerk,fjerk});

%% TRAJECTORY RECOMPUTATION
function recomputeTraj(src,event,ax,itime,ftime,ipos,fpos,ivel,fvel,iacc,facc,ijerk,fjerk)
    ti = str2double(itime.String);  % Initial time
    tf = str2double(ftime.String);  % Final time
    qi = str2double(ipos.String);   % Initial position
    qf = str2double(fpos.String);   % Final position
    vi = str2double(ivel.String);   % Initial velocity
    vf = str2double(fvel.String);   % Final velocity
    ai = str2double(iacc.String);   % Initial acceleration
    af = str2double(facc.String);   % Final acceleration
    ji = str2double(ijerk.String);  % Initial jerk
    jf = str2double(fjerk.String);  % Final jerk
    t = ti:0.001:tf;
    if(~isnan(ai) && ~isnan(af))
        if(~isnan(ji) && ~isnan(jf))
            % 7th-order
            [q7,v7,a7,j7,s7] = generatePolyTrajectory(ti, tf, qi, qf, vi, vf, ai, af, ji, jf);
            subplot(ax(3)); plot(t, q7); grid on; xlabel("Time [s]"); ylabel("Position"); title("7th order");
            subplot(ax(6)); plot(t, v7); grid on; xlabel("Time [s]"); ylabel("Velocity");
            subplot(ax(9)); plot(t, a7); grid on; xlabel("Time [s]"); ylabel("Acceleration");
            subplot(ax(12)); plot(t, j7); grid on; xlabel("Time [s]"); ylabel("Jerk");
            subplot(ax(15)); plot(t, s7); grid on; xlabel("Time [s]"); ylabel("Snap");
        end
        % 5th-order
        [q5,v5,a5,j5,s5] = generatePolyTrajectory(ti, tf, qi, qf, vi, vf, ai, af);
        subplot(ax(2)); plot(t, q5); grid on; xlabel("Time [s]"); ylabel("Position"); title("5th order");
        subplot(ax(5)); plot(t, v5); grid on; xlabel("Time [s]"); ylabel("Velocity");
        subplot(ax(8)); plot(t, a5); grid on; xlabel("Time [s]"); ylabel("Acceleration");
        subplot(ax(11)); plot(t, j5); grid on; xlabel("Time [s]"); ylabel("Jerk");
        subplot(ax(14)); plot(t, s5); grid on; xlabel("Time [s]"); ylabel("Snap");
    end
    % 3-rd order polynomial
    [q3,v3,a3,j3,s3] = generatePolyTrajectory(ti, tf, qi, qf, vi, vf);
    subplot(ax(1)); plot(t, q3); grid on; xlabel("Time [s]"); ylabel("Position"); title("3rd order");
    subplot(ax(4)); plot(t, v3); grid on; xlabel("Time [s]"); ylabel("Velocity");
    subplot(ax(7)); plot(t, a3); grid on; xlabel("Time [s]"); ylabel("Acceleration");
    subplot(ax(10)); plot(t, j3); grid on; xlabel("Time [s]"); ylabel("Jerk");
    subplot(ax(13)); plot(t, s3); grid on; xlabel("Time [s]"); ylabel("Snap");
end