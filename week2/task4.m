%% Task 4 Compute the histograms
% Histogram for A, B and C  -> Group 1: g1
% Histogram for D and F     -> Group 2: g2
% Histogram for E           -> Group 3: g3

% Initialize environment variables
clear all; close all; clc;
load('matlab_files/images_data.mat');
% Path to the train split
path = '../week1/train'; 
nbins = 8;

% Histograms
hist_g1 = zeros(nbins, nbins, nbins);
hist_g2 = zeros(nbins, nbins, nbins);
hist_g3 = zeros(nbins, nbins, nbins);
% Accumulate number of pixels
pixels_g1 = 0;
pixels_g2 = 0;
pixels_g3 = 0;
% Types of singla groups
types_abc = ['A', 'B', 'C'];
types_df = ['D', 'F'];

%% Compute A, B and C
disp('Compute A, B, C...');
total_images = length(images_data.(types_abc(1))) + ...
               length(images_data.(types_abc(2))) + ...
               length(images_data.(types_abc(3)));
num_image = 1;
for i=1:length(types_abc)
   for ll=1:length(images_data.(types_abc(i)))
        image_name=num2str(images_data.(types_abc(i))(ll,1)); %Uncomplete name
        full_name=make_file_name(image_name);
            if exist([path '/' full_name '.jpg'], 'file') == 2
                img=imread([path '/' full_name '.jpg']);
                mask=imread([path '/mask/mask.' full_name '.png']);
                sing_hist = single_histogram(img,mask,nbins);
                npixels = sum(sum(sum(sing_hist)));
                pixels_g1 = pixels_g1+npixels;
                hist_g1=hist_g1+sing_hist;
                fprintf('Image: %s.jpg FOUND, ', full_name);
                message = sprintf('processing: %d/%d', num_image, total_images);
            else
                fprintf('Image: %s.jpg NOT FOUND', full_name);
                message = sprintf('cant process: %d/%d', num_image, total_images);
            end
            disp(message);
            num_image = num_image + 1;
   end    
end

%% Compute D and F
disp('Compute D, F...');
total_images = length(images_data.(types_df(1))) + ...
               length(images_data.(types_df(2)));
num_image = 1;
for i=1:length(types_df)
   for ll=1:length(images_data.(types_df(i)))
        image_name=num2str(images_data.(types_df(i))(ll,1)); %Uncomplete name
        full_name=make_file_name(image_name);
            if exist([path '/' full_name '.jpg'], 'file') == 2
                img=imread([path '/' full_name '.jpg']);
                mask=imread([path '/mask/mask.' full_name '.png']);
                sing_hist=single_histogram(img,mask,nbins);
                npixels=sum(sum(sum(sing_hist)));
                pixels_g2=pixels_g2+npixels;
                hist_g2=hist_g2+sing_hist;
                fprintf('Image: %s.jpg FOUND, ', full_name);
                message = sprintf('processing: %d/%d', num_image, total_images);
            else
                fprintf('Image: %s.jpg NOT FOUND', full_name);
                message = sprintf('cant process: %d/%d', num_image, total_images);
            end
            disp(message);
            num_image = num_image + 1;
   end    
end

%% Compute E
disp('Compute E...');
total_images = length(images_data.E);
num_image = 1;
for ll=1:length(images_data.E)
    image_name=num2str(images_data.E(ll,1)); %Uncomplete name
    full_name=make_file_name(image_name);
    if exist([path '/' full_name '.jpg'], 'file') == 2
        img=imread([path '/' full_name '.jpg']);
        mask=imread([path '/mask/mask.' full_name '.png']);
        sing_hist=single_histogram(img,mask,nbins);
        npixels=sum(sum(sum(sing_hist)));
        pixels_g3=pixels_g3+npixels;
        hist_g3=hist_g3+sing_hist;
        fprintf('Image: %s.jpg FOUND, ', full_name);
        message = sprintf('processing: %d/%d', num_image, total_images);
    else
        fprintf('Image: %s.jpg NOT FOUND', full_name);
        message = sprintf('cant process: %d/%d', num_image, total_images);
    end
    disp(message);
    num_image = num_image + 1;
end

%% Normalize the histograms
hist_g1=hist_g1/pixels_g1;
hist_g2=hist_g2/pixels_g2;
hist_g3=hist_g3/pixels_g3;

%% Compute image probability
image = imread('../week1/train/00.003859.jpg'); 

mask_g3 = compute_probability(image,hist_g3, nbins); 
mask_g2 = compute_probability(image,hist_g2, nbins);
mask_g1 = compute_probability(image,hist_g1, nbins); 

mask_g3 = round(0.7*(mask_g3 / max(max(mask_g3))));
mask_g2 = round(0.7*(mask_g2 / max(max(mask_g2))));
mask_g1 = round(0.7*(mask_g1 / max(max(mask_g1))));

mask = min((mask_g1+mask_g2+mask_g3),1);
imshow(mask);