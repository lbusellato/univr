%% Omografia 
clear all;
close all;
clc;

img1=imread('./river1.jpg');
img2=imread('./river2.jpg');

% Scommenta qui per usare altre coppie:
%img1=imread('./roofs2.jpg');
%img2=imread('./roofs1.jpg');
%
%img1=imread('./panorama_image1_big.jpg');
%img2=imread('./panorama_image2_big.jpg');


img1=rgb2gray(img1);
img2=rgb2gray(img2);


point1=[];
point2=[];

% Decido quanti punti acquisire
np=8;
point1=[];
point2=[];

figure(1)
imshow(img1);
figure(2)
imshow(img2);

% Acquisizione dei punti
for i=1:np
    figure(1); 
    hold on,
    [xl1, yl1]=ginput(1);
    plot(xl1,yl1,'g*');
    point1=[point1; xl1, yl1];
    %
    %
    figure(2); 
    hold on
    [xl2, yl2]=ginput(1);
    plot(xl2,yl2,'b*'); 
    point2=[point2; xl2, yl2];
end

point1=point1';
point2=point2';

% Rappresentazione punti scelti sulle immagini
figure;
subplot(121); imshow(img1);
subplot(122); imshow(img2);
subplot(121); hold on; scatter(point1(1,:),point1(2,:),'*r');
subplot(122); hold on; scatter(point2(1,:),point2(2,:),'*g');

% Calcolo matrice di omografia
A=[];
for i=1:size(point1,2)
    % mi_2: coordinate omogenee del punto nella seconda immagine
    mi_2=[point2(:,i);1];
    % calcolo del prodotto esterno
    prod_esterno=[0 -mi_2(3) mi_2(2); mi_2(3) 0 -mi_2(1); ...
        -mi_2(2) mi_2(1) 0];
    % mi_1: coordinate omogenee del punto nella prima immagine
    mi_1=[point1(:,i);1];
    mi_1t=mi_1';
    % prodotto di kronecker
    kro=kron(mi_1t, prod_esterno);
    % Prendo le prime due righe linearmente indipendenti
    A=[A; kro(1,:);kro(2,:)];
end

% Calcolo di H
h = ns(A);

H = reshape(h,3,3);
H=H./H(3,3);

%load('H.mat');

% Wrapping dell'immagine 2 tramite H



%% work in proggress:
[img_wrap_mos, bb, alpha]=imwarp(img2,inv(H), 'linear', 'valid');
ind=find(isnan(img_wrap_mos));
img_wrap_mos(ind)=0;

% Aggiusto le dimensioni:
bb_ij(1)=bb(2); bb_ij(2)=bb(1); bb_ij(3)=bb(4); bb_ij(4)=bb(3);
bb_ij=bb_ij';


bb_1=[0; 0; size(img1)'];
corners=[bb_ij bb_1];

% Umbe:prova
minj = min(corners(2,:));
mini = min(corners(1,:));
maxj = max(corners(4,:));
maxi = max(corners(3,:));

bb_mos=[mini; minj; maxi; maxj];

offs=[abs(mini); abs(minj)];

sz_mos=bb_mos+[offs; offs];

if(sz_mos(1)==0 && sz_mos(2)==0) 
    mosaic_ref=zeros(sz_mos(3), sz_mos(4));
    mosaic_mov=mosaic_ref;
    mosaic_out=mosaic_ref;
else
    disp('somethig wrong...'); 
end


if((offs(1)>0) && (offs(2)>0))
    mosaic_ref(offs(1):(size(img1,1)+offs(1)-1),offs(2):(size(img1,2)+offs(2)-1))=img1(:,:);
    mosaic_mov(1:(size(img_wrap_mos,1)),1:size(img_wrap_mos,2))=img_wrap_mos(:,:);
end

if ((offs(1)>0) && (offs(2)==0))
    mosaic_ref(offs(1):(size(img1,1)+offs(1)-1),1:size(img1,2))=img1(:,:);
    mosaic_mov(1:size(img_wrap_mos,1),abs(bb_ij(2)):(size(img_wrap_mos,2)+abs(bb_ij(2))-1))=img_wrap_mos(:,:);
end
    
if ((offs(1)==0) && (offs(2)>0))
    mosaic_ref(1:size(img1,1),offs(2):(size(img1,2)+offs(2)-1))=img1(:,:);
    mosaic_mov(bb_ij(1):(size(img_wrap_mos,1)+bb_ij(1)-1),1:size(img_wrap_mos,2))=img_wrap_mos(:,:);
end

if ((offs(1)==0) && (offs(2)==0))
    mosaic_ref(1:size(img1,1),1:size(img1,2))=img1(:,:);
    mosaic_mov(bb_ij(1):(size(img_wrap_mos,1)+bb_ij(1)-1),bb_ij(2):(size(img_wrap_mos,2)+bb_ij(2)-1))=img_wrap_mos(:,:);
end
    


% Ouput:
mosaic_out=mosaic_ref.*0.5+mosaic_mov.*0.5;

figure(100)
imshow(uint8(mosaic_out))

