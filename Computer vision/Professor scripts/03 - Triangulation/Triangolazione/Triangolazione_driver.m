clear all
close all
%
load  Calib_direct_1.mat
P1=P;
%
load  Calib_direct_2.mat
P2=P;
%
Ptot(:,:,1)=P1;
Ptot(:,:,2)=P2;
I1=imread('Image1.jpg');
I2=imread('Image2.jpg');




%% acquisizione punti e calcolo triangolazione
figure,imshow(I1);
[xl1 yl1]=ginput(1);
hold on, plot(xl1,yl1,'g*');
[xl2 yl2]=ginput(1);
hold on, plot(xl2,yl2,'g*');
mleft=[xl1 xl2; yl1 yl2];
%
hold on, plot(mleft(1,:),mleft(2,:),'g');
% i punti vengono acquisiti uno alla volta
figure,imshow(I2);
% acquisizione punti nell'immagine di destra
[xr1 yr1]=ginput(1);
hold on, plot(xr1,yr1,'g*');
[xr2 yr2]=ginput(1);
hold on, plot(xr2,yr2,'g*');
mright=[xr1 xr2; yr1 yr2];
%sistemo i punti 2D come richiesto dal file intersect_base, è importante che
%i punti della vista e le ppm corrispondano: Ptot2(:,:,1)->m(:,:,1) (per la
%camera sinistra, Ptot2(:,:,2)->m(:,:,2)
m(:,:,1)=mleft;
m(:,:,2)=mright;

M=intersect_base(Ptot,m);

% Calcolo la distanza 3D tra i due punti stimati
d=sqrt(sum( (M(:,1) - M(:,2)) .^2))
close all
imshow(I1);
hold on, plot(mleft(1,:),mleft(2,:),'g*')
hold on, plot(mleft(1,:),mleft(2,:),'g')
hold on, text(mleft(1,1),mleft(2,1),num2str(d),'FontSize',16,'Color','g')


