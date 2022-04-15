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
c = [1 1 0;
     2 1 1;
    ]; % Centers for the circular primitives

%% MOTION PRIMITIVES
fig1 = figure();
fig2 = figure();
txt = []; tyt = []; tzt = []; % Positions sequence
tvxt = []; tvyt = []; tvzt = []; % Velocities sequence
taxt = []; tayt = []; tazt = []; % Accelerations sequence
syms u;
% Rectilinear primitive
xt = p(1,1)+(p(2,1)-p(1,1))*u;
yt = p(1,2)+(p(2,2)-p(1,2))*u;
zt = p(1,3)+(p(2,3)-p(1,3))*u;
% 2D plots
txt = [txt subs(xt,u,linspace(0,1))]; 
tyt = [tyt subs(yt,u,linspace(0,1))]; 
tzt = [tzt subs(zt,u,linspace(0,1))];
tvxt = [tvxt subs((p(2,1)-p(1,1))+0*u,u,linspace(0,1))]; 
tvyt = [tvyt subs((p(2,2)-p(1,2))+0*u,u,linspace(0,1))]; 
tvzt = [tvzt subs((p(2,3)-p(1,3))+0*u,u,linspace(0,1))];
taxt = [taxt subs(0*u,u,linspace(0,1))]; 
tayt = [tayt subs(0*u,u,linspace(0,1))]; 
tazt = [tazt subs(0*u,u,linspace(0,1))];
% 3D plot
figure(fig1);
fplot3(xt,yt,zt,[0,1],'LineWidth',1.5,'Color','b'); hold on;
% Circular primitive    
R = norm(p(2,:)-c(1,:));
xt = c(1,1)+R*cos(u);
yt = c(1,2)+R*sin(u);
zt = c(1,3)+0*u;
% 2D plots
txt = [txt subs(xt,u,linspace(-3.14/2,0))]; 
tyt = [tyt subs(yt,u,linspace(-3.14/2,0))]; 
tzt = [tzt subs(zt,u,linspace(-3.14/2,0))];
tvxt = [tvxt subs(-R*sin(u),u,linspace(-3.14/2,0))]; 
tvyt = [tvyt subs(R*cos(u),u,linspace(-3.14/2,0))]; 
tvzt = [tvzt subs(0*u,u,linspace(-3.14/2,0))];
taxt = [taxt subs(-R*cos(u),u,linspace(-3.14/2,0))]; 
tayt = [tayt subs(-R*sin(u),u,linspace(-3.14/2,0))]; 
tazt = [tazt subs(0*u,u,linspace(-3.14/2,0))];
figure(fig1);
fplot3(xt,yt,zt,[-3.14/2,0],'LineWidth',1.5,'Color','b');
% Circular primitive    
R = norm(p(3,:)-c(2,:));
xt = c(2,1)+0*u;
yt = c(2,2)+R*sin(u);
zt = c(2,3)-R*cos(u);
% 2D plots
txt = [txt subs(xt,u,linspace(0, 3.14))]; 
tyt = [tyt subs(yt,u,linspace(0, 3.14))]; 
tzt = [tzt subs(zt,u,linspace(0, 3.14))];
tvxt = [tvxt subs(0*u,u,linspace(0, 3.14))]; 
tvyt = [tvyt subs(R*cos(u),u,linspace(0, 3.14))]; 
tvzt = [tvzt subs(R*sin(u),u,linspace(0, 3.14))];
taxt = [taxt subs(0*u,u,linspace(0, 3.14))]; 
tayt = [tayt subs(-R*sin(u),u,linspace(0, 3.14))]; 
tazt = [tazt subs(R*cos(u),u,linspace(0, 3.14))];
figure(fig1); 
fplot3(xt,yt,zt,[0, 3.14],'LineWidth',1.5,'Color','b');
% Rectilinear primitive
xt = p(4,1)+(p(5,1)-p(4,1))*u;
yt = p(4,2)+(p(5,2)-p(4,2))*u;
zt = p(4,3)+(p(5,3)-p(4,3))*u;
% 2D plots
txt = [txt subs(xt,u,linspace(0,1))]; 
tyt = [tyt subs(yt,u,linspace(0,1))]; 
tzt = [tzt subs(zt,u,linspace(0,1))];
tvxt = [tvxt subs((p(5,1)-p(4,1))+0*u,u,linspace(0,1))]; 
tvyt = [tvyt subs((p(5,2)-p(4,2))+0*u,u,linspace(0,1))]; 
tvzt = [tvzt subs((p(5,3)-p(4,3))+0*u,u,linspace(0,1))];
taxt = [taxt subs(0*u,u,linspace(0,1))]; 
tayt = [tayt subs(0*u,u,linspace(0,1))]; 
tazt = [tazt subs(0*u,u,linspace(0,1))];
% Display trajectory
figure(fig1); 
fplot3(xt,yt,zt,[0,1],'LineWidth',1.5,'Color','b'); hold on;
scatter3(p(:,1), p(:,2), p(:,3),'filled','MarkerEdgeColor','r','MarkerFaceColor','r'); 
hold on;
scatter3(c(:,1), c(:,2), c(:,3),'MarkerEdgeColor','g','MarkerFaceColor','g');
hold on; title('3D TRAJECTORY FROM MOTION PRIMITIVES');

figure(fig2);
subplot(331); plot(linspace(0,1,400),txt); grid on; xlabel('Time [s]'); ylabel('X Position');
subplot(332); plot(linspace(0,1,400),tyt); grid on; xlabel('Time [s]'); ylabel('Y Position');
subplot(333); plot(linspace(0,1,400),tzt); grid on; xlabel('Time [s]'); ylabel('Z Position');
subplot(334); plot(linspace(0,1,400),tvxt); grid on; xlabel('Time [s]'); ylabel('X Velocity');
subplot(335); plot(linspace(0,1,400),tvyt); grid on; xlabel('Time [s]'); ylabel('Y Velocity');
subplot(336); plot(linspace(0,1,400),tvzt); grid on; xlabel('Time [s]'); ylabel('Z Velocity');
subplot(337); plot(linspace(0,1,400),taxt); grid on; xlabel('Time [s]'); ylabel('X Acceleration');
subplot(338); plot(linspace(0,1,400),tayt); grid on; xlabel('Time [s]'); ylabel('Y Acceleration');
subplot(339); plot(linspace(0,1,400),tazt); grid on; xlabel('Time [s]'); ylabel('Z Acceleration');
sgtitle('TRAJECTORY COMPONENTS');







