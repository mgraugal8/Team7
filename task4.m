% Task 4: Evaluate the segmentation using ground truth

function task4()
% List directory
samples = dir('datasets/train_set/train_split');        
samples = samples(arrayfun(@(x) x.name(1) == '0', samples));

% Get all images from matlab file
images_segmented_1 = load('images_segmented_1.mat');
images_segmented_1 = images_segmented_1.images_segmented_1;
images_segmented_2 = load('images_segmented_2.mat');
images_segmented_2 = images_segmented_2.images_segmented_2;

% List directory
samples = dir('datasets/train_set/train_split');        
samples = samples(arrayfun(@(x) x.name(1) == '0', samples));
total_images = uint8((length(samples))/4);

for ii=1:total_images 
% Get image from struct
simages_segmented_1 = images_segmented_1(ii,:,:);
image_1 = logical(squeeze(simages_segmented_1(1,:,:)));
simages_segmented_2 = images_segmented_2(ii,:,:);
image_2 = logical(squeeze(simages_segmented_2(1,:,:)));

% Load original image
[~, name_sample, ~] = fileparts(samples(ii).name);
dir_image = sprintf('datasets/train_set/train_split/%s.jpg',...
name_sample);
original_image = imread(dir_image);

% Load mask of groundtruth
dir_mask = sprintf('datasets/train_set/train_split/mask/mask.%s.png',...
name_sample);
mask = logical(imread(dir_mask));

% Get parameters of image using mask
[TP_1, TN_1, FP_1, FN_1] = get_parameters(image_1, mask);
[TP_2, TN_2, FP_2, FN_2] = get_parameters(image_2, mask);

% Get metrics of image using mask
[R_1, P_1, AO_1, FD_1] = get_metrics(TP_1, TN_1, FP_1, FN_1);
[R_2, P_2, AO_2, FD_2] = get_metrics(TP_2, TN_2, FP_2, FN_2);

figure();
set(gcf,'name','Segmentations','numbertitle','off','Position', ...
[150, 150, 1300, 600]);
subplot(2,3,1), imshow(original_image), title('Original image');
subplot(2,3,2), imshow(image_1), title('METHOD #1');
subplot(2,3,3), imshow(image_2 & mask), title('TRUE POSITIVES');
subplot(2,3,4), imshow((((~ image_1) & (~ mask)))),...
title('TRUE NEGATIVES');
subplot(2,3,5), imshow((~ image_1) & mask), title('FALSE POSITIVES');
subplot(2,3,6), imshow(image_1 & (~ mask)), title('FALSE NEGATIVES');
pause();
close all;

figure();
set(gcf,'name','Segmentations','numbertitle','off','Position', ...
[150, 150, 1300, 600]);
subplot(2,3,1), imshow(original_image), title('Original image');
subplot(2,3,2), imshow(image_2), title('METHOD #2');
subplot(2,3,3), imshow(image_2 & mask), title('TRUE POSITIVES');
subplot(2,3,4), imshow((((~ image_2) & (~ mask)))),...
title('TRUE NEGATIVES');
subplot(2,3,5), imshow((~ image_2) & mask), title('FALSE POSITIVES');
subplot(2,3,6), imshow(image_2 & (~ mask)), title('FALSE NEGATIVES');
pause();
close all;
end

end

function [TP, TN, FP, FN] = get_parameters(image, mask)
% Calculate True Positives (TP): correctly detected
TP = sum(sum(image & mask));
% Galculate True Negatives (TN): non-detected false samples
TN = sum(sum((((~ image) & (~ mask)))));
% Calculate False Positives (FP): non-detected true samples
FP = sum(sum((~ image) & mask));
% Calculate False Negatives (FN): false detected samples
FN = sum(sum(image & (~ mask)));
end

function [R, P, AO, FD] = get_metrics(TP, TN, FP, FN)
% Calculate precision: P = TP / P = TP / (TP + FP)
P = uint8((TP/(TP+FP))*100);
% Calculate recall: R = TP / T
R = uint8((TP/(TP+FN))*100);
% Calculate accepted outliers AO = FP / F = FP / (FP + TN)
AO = uint8((FP/(FP+TN))*100);
% Calculate % false detections = FD = FP / P = 1 - precision
FD = uint8((1 - (double(P)/100))*100);
end
