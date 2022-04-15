clear all
close all
clc

% Caricamento informazioni camera
load('imgInfo.mat')

% Immagine
img = imread('cav.jpg');

% Informazioni immagine
p2D = imgInfo.punti2DImg;
p3D = imgInfo.punti3DImg;
K = imgInfo.K;

% Punti 3D:
figure(1)
scatter3(p3D(:,1),p3D(:,2),p3D(:,3),5,'c');
axis equal

%
% Riproietto i punti 3D usando i dati di calibrazione:
figure(2)
imshow(img);
hold on;
plot(p2D(:,1), p2D(:,2),'r.');
P=K*[imgInfo.R imgInfo.T];
[u,v] = proj(P,p3D);
plot(u,v,'go');

% Punti 3D:
figure(2)
scatter3(p3D(:,1),p3D(:,2),p3D(:,3),5,'c');
axis equal

% Exterior orientation
% Estraggo un sottoinsieme tra tutte le corrispondenze
[G,s] = exterior_fiore(K,p3D(1:100,:)',p2D(1:100,:)');
%
% Riproietto i punti 3D usando la nuova matrice degli esterni:
figure(3);
imshow(img);
hold on;
plot(p2D(:,1), p2D(:,2),'r.');
P1=K*G;
[u1,v1] = proj(P1,p3D);
plot(u1,v1,'bo');
%

% Confronto tra la posa stimata con dalla calibrazione e quella
% stimata con il metodo di Fiore:
[i
    mgInfo.R imgInfo.T G]

