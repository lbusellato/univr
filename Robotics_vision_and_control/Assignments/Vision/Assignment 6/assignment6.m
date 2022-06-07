% assignment6.m
% Author: Lorenzo Busellato, 2022
%
% Hand-eye calibration

%% SETUP
clearvars;
close all;
addpath 'functions' 'classes';
run('functions/sift/toolbox/vl_setup');
% Parameters
method = MethodName.Fiore;
modelFile = 'models/refDescriptorsCherub0001';
load(modelFile); %variable referenceModel

testImages = ["cherub/test/IMG_0005.JPG" "cherub/test/IMG_0021.JPG" "cherub/test/IMG_0044.JPG" ]
testInternals = ["cherub/test/IMG_0005.xmp" "cherub/test/IMG_0021.xmp" "cherub/test/IMG_0044.xmp" ]

for i = 1:3
    checkImageFile = testImages(1,i);
    testK = read_xmp(testInternals(1,i))% getInternals(checkImageFile); % estimated internal params of test image
    [R, T] = pose_estimator(referenceModel, checkImageFile, method, testK);
    figure(200);
    ptCloud = pcread('cherub/mesh.ply');
    pcshow(ptCloud)
    set(gcf,'color','w');
    set(gca,'color','w');
    set(gca, 'XColor', [0.15 0.15 0.15], 'YColor', [0.15 0.15 0.15], 'ZColor', [0.15 0.15 0.15]);
    hold on
    plotCameraPose(referenceModel.R, referenceModel.T, '  ref');
    plotCameraPose(R, T, "  " + num2str(i));
    
    axis equal
end