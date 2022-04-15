% Calibration: direct method
%
% Umberto Castellani
% Images and experiments designed by Fabio Caputo
%

clear all
close all
clc

% Change image here:
img1 = imread('image2.jpg');

% The calibration object is known
Mi =    [0,0,5,1;
        5,0,5,1;
        5,5,5,1;
        0,5,5,1;
        5,0,0,1;
        5,5,0,1];
    
%Show the image
fig1 = figure(1);

imshow(img1);
hold on;

% Collect points:    
xc = [];
yc = [];
calib_i = 0;
while calib_i <6
[clickX,clickY] = ginput(1);
    xc = [xc;clickX];
    yc= [yc;clickY];
    scatter(clickX,clickY,'g','+');
    text(clickX,clickY,strcat('.       ',num2str(calib_i+1)));
    calib_i=calib_i+1;
end

mi = [xc,yc,ones(6,1)];

% Calibration:
A = [];
for i = 1:6
  
    a = mi(i,:).';
    ax = [0,-a(3,1),a(2,1);
          a(3,1),0,-a(1,1);
         -a(2,1),a(1,1),0];      
     % Note that Mi is M'
     KRO = kron(ax,Mi(i,:));
     A = [A;KRO(1,:);KRO(2,:)];
end
 [U,S,V] = svd(A,'econ');
 vecP = V(:,size(A,2));

P = [vecP(1,1),vecP(2,1),vecP(3,1),vecP(4,1);
vecP(5,1),vecP(6,1),vecP(7,1),vecP(8,1);
vecP(9,1),vecP(10,1),vecP(11,1),vecP(12,1)
];


P
m_reproj = [];
for j = 1:6   
    mcurrent = P*(Mi(j,:).');
    m_reproj = [m_reproj;mcurrent.'/mcurrent(3,1)];
end

hold on

for k = 1:6
    scatter(m_reproj(k,1),m_reproj(k,2),'r');
    scatter(xc(k,1),yc(k,1),'g','+');
    text((m_reproj(k,1)),(m_reproj(k,2)),strcat('.       ',num2str(k)));
   
end

% Change the name of PPM here
save('Calib_direct_2.mat', 'P');