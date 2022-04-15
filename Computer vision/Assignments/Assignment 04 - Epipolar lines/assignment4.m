% assignment4.m
% Author: Lorenzo Busellato
%
% This script implements the computation of epipolar lines. Given two
% images ("left" and "right") and their perspective matrices Pl and Pr, the 
% script plots in real time on the right image the epipolar line associated 
% to the point in the left image currently under the mouse cursor. If the 
% point is clicked, the epipolar line is permanently drawn onto the right 
% image. The epipoles are calculated as:
%
%   el = -Ql inv(Qr)qr + ql     er = -Qr inv(Ql)ql + qr
%
% where Pl = [Ql | ql] and Pr = [Qr | qr].
% The coefficients of the epipolar line are computed using the fundamental
% matrix F:
%
%   a
%  (b) = Fm = [el]Ql inv(Qr)m
%   c
%
% where m = (u, v , 1) is the clicked point and [el] is the cross product 
% matrix of the left epipole:
%
%            0  -e3  e2
%   [el] = [ e3  0  -e1 ] where el = 
%           -e2  e1  0
%

%% SETUP
clearvars;
close all;
clc;
% Load in the perspective matrices of the two images
P1 = load('perspective_matrix_1.mat').P;
P2 = load('perspective_matrix_2.mat').P;
% Load the images
img1 = imread('image1.jpg');
img2 = imread('image2.jpg');
[v, u, ~] = size(img1);
% Set up the figures to show the images
fig1 = figure();
imshow(img1);
title({'Left image - move the cursor to show epipolar lines in real time on the right image','click to draw them permanently'});
drawnow;
fig2 = figure();
imshow(img2);
title('Epipolar lines of the selected points');
drawnow;
fig = [fig1, fig2];


%% COMPUTATION OF THE EPIPOLES
% Q-q factors of the perspective matrices
Q1 = P1(:, 1:3);
q1 = P1(:, 4);
Q2 = P2(:, 1:3);
q2 = P2(:, 4);
% Computation of the epipoles
el = -(Q2 / Q1) * q1 + q2;
el = el./norm(el);
er = -(Q1 / Q2) * q2 + q1;
er = er./norm(er);
epipoles = [el, er]

%% COMPUTATION OF THE FUNDAMENTAL MATRIX
% Cross product matrix of the left epipole
ex = [0, -el(3), el(2);
    el(3), 0, -el(1);
    -el(2), el(1), 0
    ];
% Computation of the fundamental matrix
F = (ex * (Q2 / Q1));
F = F./norm(F);

%% EPIPOLAR LINES DRAWING
% Show the left image
figure(fig(1));
hold on;
% Set up function callbacks to handle mouse movement and clicks
fig(1).WindowButtonMotionFcn = {@mouse_move, gca, F, fig(2), u};
fig(1).WindowButtonDownFcn = {@mouse_down, F, fig(2), u, v};
figure(fig(2)); hold on;
% These global variables are used for the real time drawing of the epipolar
% line as well as for keeping track of the numbering of the picked points
global current_epipolar;
current_epipolar = plot(0:1, 0:1);
global epi_index;
epi_index = 0;

% Mouse hover event callback function
function mouse_move(~, ~, ax, F, f2, n)
    % Acquire the current point
    m = [ax.CurrentPoint(1,1), ax.CurrentPoint(1,2), 1];
    
    % Compute the epipolar line associated to the selected point
    l = F * m.';
    
    % Plot the computed epipolar line
    figure(f2);
    hold on;
    x = 1:n;
    y = (-l(3, 1) - l(1, 1) * x) / l(2, 1);
    global current_epipolar;
    set(current_epipolar, 'XData', x, 'YData', y);
end

% Mouse button down event callback function
function mouse_down(f, ~, F, f2, u, v)
    figure(f);
    hold on;
    ax = gca;
    % Acquire the clicked point
    m = [ax.CurrentPoint(1,1), ax.CurrentPoint(1,2), 1];
    % Check if the point is within the image bounds
    if (0 <= m(1, 1)) && (m(1, 1) <= u) && (0 <= m(1, 2)) && (m(1, 2) <= v)
        global epi_index;
        epi_index = epi_index + 1;
        s = scatter(m(1, 1), m(1, 2), '+');
        text(m(1, 1), m(1, 2), strcat('.       ',num2str(epi_index)));
        
        % Compute the epipolar line associated to the selected point
        l = F * m.';
        
        % Plot the computed epipolar line
        figure(f2);
        hold on;
        x = 1:u;
        y = (-l(3, 1) - l(1, 1) * x) / l(2, 1);
        plot(x, y, 'color', get(s, 'CData'));
    end
end