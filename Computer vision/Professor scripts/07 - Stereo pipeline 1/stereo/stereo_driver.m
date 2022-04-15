 % Load the images.
      I1 = imread('scene_left.png');
      I2 = imread('scene_right.png');
 
      I1 = imread('stereo1.jpg');
      I2 = imread('stereo2.jpg');
      %
      % Show the stereo anaglyph. You can view the image in 3-D using
      % red-cyan stereo glasses.
      figure(1)
      imshow(I1);
      figure(2)
      imshow(I2);
      figure(3);
      imshow(stereoAnaglyph(I1,I2));
      title('Red-cyan composite view of the stereo images');
 
      % Compute the disparity map.
      disparityRange = [-6 10];
      disparityMap = disparity(rgb2gray(I1), rgb2gray(I2), 'BlockSize', 15, ...
        'DisparityRange', disparityRange);
 
      % Show the disparity map. For better visualization use the disparity
      % range as the display range for imshow.
      figure 
      imshow(disparityMap, disparityRange);
      title('Disparity Map');
      colormap jet 
      colorbar
      
      %%%%%% Reconstruction
      
      load('webcamsSceneReconstruction.mat');
 
    % Read in the stereo pair of images.
    I1 = imread('sceneReconstructionLeft.jpg');
    I2 = imread('sceneReconstructionRight.jpg');
 
    % Rectify the images.
    [J1, J2] = rectifyStereoImages(I1, I2, stereoParams);
 
    % Display the images after rectification.
    figure; imshow(stereoAnaglyph(J1, J2), 'InitialMagnification', 50);
 
    % Compute disparity
    disparityMap = disparity(rgb2gray(J1), rgb2gray(J2));
    figure; imshow(disparityMap, [0, 64], 'InitialMagnification', 50);
  
    % Reconstruct the 3-D world coordinates of points corresponding to each
    % pixel from the disparity map.
    pointCloud = reconstructScene(disparityMap, stereoParams);
 
    % Segment out a person located between 3.2 and 3.7 meters away from the
    % camera.
    Z = pointCloud(:, :, 3);
    mask = repmat(Z > 3200 & Z < 3700, [1, 1, 3]);
    J1(~mask) = 0;
    imshow(J1, 'InitialMagnification', 50);
    
    figure; pcshow(pointCloud);
    
    %qui va generaata la nuvola di punti ed esclusi i punti nan e inf
    X=pointCloud(:, :, 1);
    Y=pointCloud(:, :, 2);
    %X=X(:);
   %i = find((~isnan(X))&(isfinite(X)) & (~isnan(Y))&(isfinite(Y))&(~isnan(Z))&(isfinite(Z)));
   i = find((~isnan(X))&(isfinite(X)) & (~isnan(Y))&(isfinite(Y))&(~isnan(Z))&(Z<5000));
   %  i = find(~isnan(X));
    X1 = reshape(X(i),length(X(i)),1);
    Y1 = reshape(Y(i),length(Y(i)),1);
    Z1 = reshape(Z(i),length(Z(i)),1);
    figure(100);
    plot3(X1(1:100:end),Y1(1:100:end),Z1(1:100:end),'r.');
   axis equal
grid on
    
    