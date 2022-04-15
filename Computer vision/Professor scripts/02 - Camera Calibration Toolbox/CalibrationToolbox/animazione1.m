% Eugenio Berardi
% Esercizio sull'animazione su immagine 2D
% Compito svolto insieme a Fabio Cogliati e Andrea Savio

close all
clear all
cali = load(['calib_data.mat']);
camera = load(['Calib_Results.mat']);

% Carichiamo l'immagine
%ImageIN=imread('Image10.tif'); 
ImageIN=imread('Image5.tif'); 
% Punti 3D
X=cali.X_5;
om=camera.omc_5;
T=camera.Tc_5;
f=camera.fc; 
c=camera.cc; 
k=camera.kc; 

%Animazione!
figure(1)
imshow(ImageIN);
hold on
hLine = line('XData',0, 'YData',0, 'Color','r', 'Marker','*', 'MarkerSize',6, 'LineWidth',5);
i=1;
punto=zeros(3,2);
punto(:,1)=X(:,1);
punto(:,2)=punto(:,1);
punto(2,2)=punto(2,2)+50;
verso=10;
nriga=1;
rigaoffset=0;
while true
    [xp_anim,dxpdom,dxpdT,dxpdf,dxpdc,dxpdk]=project_points(punto,om,T,f,c,k);
    set(hLine, 'XData',xp_anim(1,:), 'YData',xp_anim(2,:))
    drawnow
    %pause(0.005);
    if (i>=(cali.n_sq_x_8+1)*cali.dX_8)
        %Se il punto è arrivato al limite della scacchiera cambio riga
        if (rigaoffset<10)
            if (rigaoffset==0)
                punto(2,2)=punto(2,1);
            end
            punto(1,1)=punto(1,1)+10;
            punto(1,2)=punto(1,1);
            rigaoffset=rigaoffset+1;
        else
            rigaoffset=0;
            nriga=nriga+1;
            if (nriga>cali.n_sq_x_8+1)
                punto(:,1)=X(:,1);
                punto(:,2)=punto(:,1);
                punto(2,2)=punto(2,2)+30;
                nriga=1;
            end
            i=1;
            verso=-verso;
        end
    else   
        %Muovo il punto orizzontalmente
        punto(2,1)=punto(2,1)-verso;
        punto(2,2)=punto(2,1)-50;
        i=i+abs(verso);
    end
    
    if ~ishandle(hLine), break; end
end





