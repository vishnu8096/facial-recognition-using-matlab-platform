clc
close all
g=alexnet;
layers=g.Layers;
layers(23)=fullyConnectedLayer(2);
layers(25)=classificationLayer;
allImages=imageDatastore('Database','IncludeSubfolders',true, 'LabelSource','foldernames');
opts=trainingOptions('adam','InitialLearnRate',0.001,'MaxEpochs',20,'MiniBatchSize',64);
myNet=trainNetwork(allImages,layers,opts);
save myNet;


