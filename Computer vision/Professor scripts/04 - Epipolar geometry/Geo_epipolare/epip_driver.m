% Visione Computazionale 
% Stima della matrice fondamentale
%
% Umberto Castellani
%
clc
clear all
close all

Ptot(:,:,1)=load('IMG_0011.JPG.ppm');
Ptot(:,:,2)=load('IMG_0012.JPG.ppm');
%
[F,el,er] = fund(Ptot(1:3,:,1),Ptot(1:3,:,2));

%
% Show epipolar line:
% Carico le immagini 2D 
I_left=imread('IMG_0011.JPG');
I_right=imread('IMG_0012.JPG');

[m n c] = size(I_left);

figure,imagesc(I_left); colormap(gray); title('Click a point on this Left Image');axis image;
figure,imagesc(I_right); colormap(gray); title('Corresponding Epipolar Line in this Right Image');axis image;

list =['r' 'b' 'g'];

for i=1:3
    % Clicking a point on the left image:
    figure(1);    
    [left_x left_y] = ginput(1);
    hold on;
    plot(left_x,left_y,'r*');

    % Finding the epipolar line on the right image:
    left_P = [left_x; left_y; 1];

    right_P = F*left_P;

    right_epipolar_x=1:n;
    % Using the eqn of line: ax+by+c=0; y = (-c-ax)/b
    right_epipolar_y=(-right_P(3)-right_P(1)*right_epipolar_x)/right_P(2);
    figure(2);
    hold on;
    plot(right_epipolar_x,right_epipolar_y,list(mod(i,8)));
end
