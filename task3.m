%% Task 3 Color segmentation to generate a mask

function task3()
%--------------------------------------------------------------------------
%% TESTING METHODS
clear all;    
% Get image from dataset to train system
image = imread('datasets/train_set/train_split/00.001232.jpg');
show_channels_histograms(image, 'rgb');
show_channels_histograms(image, 'hsv');

%--------------------------------------------------------------------------
%% METHOD # 1    

% Apply equation in order to identify color on images. (RGB color space)
image_segmented = segmentation_by_equation(image);

% Shows original and image segmented
figure();
set(gcf,'name', 'Method #1','numbertitle','off', ...
'Position', [150, 150, 1300, 400]);
subplot(1,2,1), imshow(image), title('RGB color space');
subplot(1,2,2), imshow(image_segmented), title('Detections');
pause();

%--------------------------------------------------------------------------
%% METHOD # 2
% Converting an RGB image into normalized RGB removes the effect of any
% intensity variations. Normalizing can provide exactly what you need to 
% compare two images taken under variations of illumination PROVIDING 
% the colour temperature of the light source doesn't change as the 
% illumination output varies

% LINK Reference to convert RGB into normalized RGB: 
% https://es.mathworks.com/matlabcentral/newsreader/view_thread/171190

image_normalized = normalize_RGB_image(image);
image_segmented = segmentation_by_equation(image_normalized);

% Shows original and image segmented
figure();
set(gcf,'name', 'Method #2','numbertitle','off', ...
'Position', [150, 150, 1300, 400]);
subplot(1,2,1), imshow(image_normalized), title('RGB normalize color space');
subplot(1,2,2), imshow(image_segmented), title('Detections');
pause();

%--------------------------------------------------------------------------
%% METHOD # 3

end

% Function: normalize_RGB_image
% Description: convert an RGB image into normalized RGB
% Input: image in RGB color space
% Output: image in normalize RGB color space
function normalize_RGB = normalize_RGB_image(image)
% Split channels RBG
red = double(image(:, :, 1));            
green = double(image(:, :, 2));           
blue = double(image(:, :, 3)); 

% Normalize each channel
normalize_red = red./sqrt(power(red,2) + power(green,2) + power(blue,2));
normalized_green = green./sqrt(power(red,2) + power(green,2) + ...
power(blue,2));
normalize_blue = blue./sqrt(power(red,2)+ power(green,2) + power(blue,2));

% Merge channels again
normalize_RGB = cat(3,normalize_red, normalized_green, ...
normalize_blue);
end

% Function: segmentation_by_equation
% Decription:
% Input: image to process, title of figure to show and title of processed
% image in order to identify segmentation method applied
% Output: image segmented
function segmentation = segmentation_by_equation(image)
% Split channels
red_channel = image(:, :, 1);            
green_channel = image(:, :, 2);           
blue_channel = image(:, :, 3); 

% Apply equation depending on color segmentation
segmentation_red = max(0,double(red_channel) - ...
0.65*(double(green_channel) + double(blue_channel)));
segmentation_blue = max(0, double(blue_channel) - ...
0.65*(double(red_channel) + double(green_channel)));

% Merge channels blue and red
segmentation = min(1, (segmentation_red + segmentation_blue));
segmentation=(segmentation/max(max(segmentation)));
segmentation = segmentation(:,:)>0.15;
end

% Function: show_channels_histograms
% Description: show channels and histograms of each channel component
% Input: image and color space to process
% Output: None
function show_channels_histograms(image, color_space)
switch color_space
    case 'rgb'
        % Shows red, green and blue channels with histograms
        figure();
        set(gcf,'name','RGB channels','numbertitle','off','Position', ...
        [150, 150, 1300, 400]);
        subplot(2,3,1), imshow(image(:,:,1)), title('RED channel ');
        subplot(2,3,2), imshow(image(:,:,2)), title('BLUE channel');
        subplot(2,3,3), imshow(image(:,:,3)), title('GREEN channel');
        subplot(2,3,4), imhist(image(:,:,1)), title('RED histogram');
        subplot(2,3,5), imhist(image(:,:,2)), title('GREEN histogram');
        subplot(2,3,6), imhist(image(:,:,3)), title('BLUE histogram');
    case 'hsv'
        image = rgb2hsv(image);
        figure();
        set(gcf,'name','HSV channels','numbertitle','off','Position', ...
        [150, 150, 1300, 400]);
        subplot(2,3,1), imshow(image(:,:,1)), title('HUE channel ');
        subplot(2,3,2), imshow(image(:,:,2)), title('SATURATION channel');
        subplot(2,3,3), imshow(image(:,:,3)), title('BRIGHTNESS channel');
        subplot(2,3,4), imhist(image(:,:,1)), title('HUE histogram');
        subplot(2,3,5), imhist(image(:,:,2)), title('SATURATION histogram');
        subplot(2,3,6), imhist(image(:,:,3)), title('BRIGHTNESS histogram');
    otherwise
        disp('invalid color space')
end

pause();
close all;
end