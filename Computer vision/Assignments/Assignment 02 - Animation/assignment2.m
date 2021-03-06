% assignment2.m
% Author: Lorenzo Busellato
%
% This script reprojects the known 3D points of any of the images used with
% the Camera Calibration Toolbox, both with and without radial distortion
% correction. Furthermore it demonstrates the possibility of projecting
% arbitrary 3D points first by shifting the known 3D points along the
% x-y plane and then by showing an animation of a ball bouncing on the 
% chessboard.

%% SETUP
close all
clearvars
clc
addpath("./calib")
% Load the calibration data obtained with Camera Calibration Toolbox
calib = load('calib/calib_data.mat');
camera = load('calib/Calib_Results.mat');
% Load the image
img_no = 4; % Change the number here to switch to another image
% Image number 4 works well with the animation
img = imread(strcat('calib/image',num2str(img_no),'.jpg'));
% Create the figures to hold the images
fig1 = figure();
imshow(img);
title('Reprojected 3D points without distortion correction');
drawnow;
fig2 = figure();
imshow(img);
title('Reprojected 3D points with distortion correction');
drawnow;
fig3 = figure();
imshow(img);
title('Arbitrary 3D point projection: point shift');
drawnow;
fig4 = figure();
imshow(img);
title('Arbitrary 3D point projection: animation (press any key to play)');
hold on;
% 3D points to be reprojected (the corners of the chessboard):
X = calib.X_1;
% Intrinsic camera parameters
K = camera.KK;
% Extrinsic camera parameters
R = camera.(strcat('Rc_',num2str(img_no)));
T = camera.(strcat('Tc_',num2str(img_no))); 
% Distortion factors
kc = camera.kc;

%% 3D POINTS REPROJECTION W/O RADIAL DISTORTION CORRECTION
x = proj(X, K, R, T);
% Plot the reprojected 3D points without radial distortion correction:
figure(fig1);
hold on;
plot(x(1, :), x(2, :), 'r+');

%% 3D POINTS REPROJECTION W/ RADIAL DISTORTION CORRECTION
% Apply radial distortion correction to improve the reprojection accuracy:
x = proj(X, K, R, T, kc);
figure(fig2);
hold on
plot(x(1,:), x(2,:), 'g+');

%% ARBITRARY 3D POINTS PROJECTION: COORDINATE SHIFT
% Get the chessboard squares' dimensions
dX = calib.dX_1;
dY = calib.dY_1;
X1 = X;
% Shift the known 3D points of 1 square in each direction
X1(1,:) = (dX * ones(1,length(X))) + X(1,:);
X1(2,:) = (dY * ones(1,length(X))) + X(2,:);
xp_in = proj(X1, K, R, T, kc);
figure(fig3);
hold on;
plot(xp_in(1,:), xp_in(2,:), 'b+');

%% ARBITRARY POINTS PROJECTION: ANIMATION
figure(fig4);
% Setup of a callback function to allow the replay of the animation
fig4.WindowKeyPressFcn = {@animation, K, R, T, kc};
hold on;
% This function, given the intrinsic and extrinsic camera parameters and 
% the distortion factors, generates the trajectory of a ball bouncing on a 
% plane in the 3D space and then projects the set of coordinates onto the
% 2D plane of the image.
%
% Inputs:
%   K: matrix of intrinsic camera parameters (3x3 matrix)
%   R: rotation matrix (3x3 matrix)
%   T: translation vector (3x1 matrix)
%   kc: vector of distorsion coefficients (5x1 matrix)
%
global ball;
ball = plot(-10, -10, 'ro', 'MarkerFaceColor', 'r');
function animation(~, ~, K, R, T, kc)
    % Sphere and floor parameters
    e = 0.75; % Coefficient of restitution (ratio between velocity after impact
              % and velocity before impact with the floor)
    g = 9.81; % Gravitational acceleration in m/s^2 (NB: gravity points
               % towards the negative z direction)
    v = [0.1, 0.1, 0]; % Initial velocity [vx, vy, vz] in m/s
    x0 = 0; % Initial x position in meters
    y0 = 0; % Initial y position in meters
    z0 = 0.2; % Initial z position in meter
    % Simulation parameters
    dt = 0.001;	% Time step
    zmax = z0;	% Initial drop height
    x = x0;		% Instantaneous x coordinate
    y = y0;		% Instantaneous y coordinate
    z = z0;		% Instantaneous height8
    zstop = 0.001;	% Minimal bouncing height after which the simulation stops
    T1 = 0 : dt : 1000; % Time array
    X = zeros(1, length(T1)); % X coordinate array
    Y = zeros(1, length(T1)); % Y coordinate array
    Z = zeros(1, length(T1)); % Z coordinate array
    max_it = 100000; % Failsafe to prevent infinite loops
    it = 1; % Current iteration 
    % Generating the ball trajectory
    while (zmax > zstop) && (it < max_it)
        x = x + v(1, 1) * dt; % x(t+dt) = x(t) + v*dt
        y = y + v(1, 2) * dt; % y(t+dt) = y(t) + v*dt
	    z = z + v(1, 3) * dt - 0.5 * g * dt ^ 2; % z(t+dt) = z(t) + v*t - 0.5*g*t^2
        if z < 0
            % The ball hit the floor
	        z = 0;
            % New velocity after the bounce
	        v(1, 3) = -v(1, 3) * e; 
            % Next bounce height (conservation of energy)
            zmax = 0.5 * v(1, 3)^2 / g; 
        else
            % Update velocity
	        v(1, 3) = v(1, 3) - g*dt;
        end
        % Save the current coordinates
        X(it) = x;
        Y(it) = y;
	    Z(it) = z; 
	    it = it + 1; % Step the simulation
    end
    % Crop the coordinate arrays to their filled part and convert to mm
    X = 1000 * X(1 : it - 1); 
    Y = 1000 * Y(1 : it - 1); 
    Z = 1000 * Z(1 : it - 1); 
    % Plot the ball trajectory
    global ball;
    XYZ_proj = proj([X;Y;Z], K, R, T, kc);
    for i = 1:size(Z, 2)
        pause(dt);
        set(ball, 'XData', XYZ_proj(1, i), 'YData', XYZ_proj(2, i));
    end
end

% This function, given a set X of N 3D points, the intrinsic and extrinsic
% camera parameters and the distortion factors, returns the set x of 2D
% points resulting from the projection of X. If kc is supplied as an 
% argument, the tangential and radial distortion correction equations 
% described in the webpage of the Camera Calibration Toolbox are applied to
% the projected 2D points.
% (http://www.vision.caltech.edu/bouguetj/calib_doc/htmls/parameters.html)
%
% Inputs:
%   X: 3D coordinates of the N points to project (3xN matrix)
%   K: matrix of intrinsic camera parameters (3x3 matrix)
%   R: rotation matrix (3x3 matrix)
%   T: translation vector (3x1 matrix)
%   kc: vector of distorsion coefficients (5x1 matrix)
%
% Outputs:
%   x: 2D coordinates of the N projected points (2xN matrix)
function [x] = proj(X, K, R, T, kc)
    % Check the number of arguments passed
    if nargin < 4
        error('proj.m: camera parameters were not provided');
    end
    % Compute the perspective matrix from the camera parameters:
    G = [R T; 0 0 0 1];
    ppm = K * [eye(3) zeros(3, 1)] * G;
    % Get X in homogeneous coordinates
    X_hom =[X' ones(size(X',1),1)]';  
    % Project X and convert the result in homogeneous coordinates
    x_inhom = ppm * X_hom ;
    x_hom = x_inhom(1:2,:)./ [x_inhom(3,:)' x_inhom(3,:)']'; 
    x = [round(x_hom(1,:)); round(x_hom(2,:))];
    % Apply distortion if the vector of distortion factors xc was provided
    if nargin == 5
        % Get the 3D points homogeneous coordinates in the camera reference
        % frame:
        %       xn = R * X + T
        % where R is the rotation matrix and T is the translation vector that
        % describe the rigid motion from the world reference frame to the
        % camera reference frame and X is the set of 3D points in inhomogeneous
        % coordinates.
        Y = R * X + T;
        xn = [Y(1, :)./Y(3, :);Y(2, :)./Y(3, :)];
        % Applying distortion correction
        r = xn(1, :).^2 + xn(2, :).^2; %NB: r is r^2
        dx = [
            2 * kc(3) * xn(1, :).*xn(2, :) + kc(4).*(r + 2 * xn(1, :).^2);
            kc(3) * (r + 2 * xn(2, :).^2) + 2 * kc(4) * xn(1, :).*xn(2, :)
            ];
        xd = [
            (1 + kc(1) * r + kc(2) * r.^2 + kc(5) * r.^3).*xn(1, :) + dx(1, :);
            (1 + kc(1) * r + kc(2) * r.^2 + kc(5) * r.^3).*xn(2, :) + dx(2, :)
            ];
        x = [
            round(K(1, 1) * xd(1, :) + K(1, 2) * xd(2, :) + K(1, 3));
            round(K(2, 2) * xd(2, :) + K(2, 3))
            ];
    end
    return;
end