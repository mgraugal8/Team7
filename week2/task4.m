%% Task 4 -- Apply histogram back-projection to perform color segmentation

function task4()

% Show description on screen about task4
show_description_on_screen();

% Load images from train
sdir = '../week1/train';
samples = dir(sdir); 
samples = samples(arrayfun(@(x) x.name(1) == '0', samples));
total_images = uint8(length(samples));

images_data_group = struct('ABC', zeros(0, 0, 0),'DF', zeros(0, 0, 0),'E', zeros(0, 0, 0));
images_data_group = divide_signals(images_data_group, total_images, samples, sdir);

% Save struct of computational times
save('matlab_files/images_data_group.mat', 'images_data_group', '-v7.3');
disp('Save images_data_group.mat: done');

disp('task4(): done');
end

% Function: show_description
% Description: show description on screen
% Input: None
% Output: None
function show_description_on_screen()
disp('----------------------- TASK 4 DESCRIPTION -----------------------');
disp('Apply histogram back-projection to perform color segmentation ');
disp('------------------------------------------------------------------');
fprintf('\n');
end

% Function: divide_signals
% Description: divide the signals into groups according to color
% Input: images_data_group, total_images, samples, sdir
% Output: images_data_group
function images_data_group = divide_signals(images_data_group, total_images, samples, sdir)
disp('Divide the signals into groups according to color: ABC, DF and E');
num_image = 0;
for ii=1:total_images
   
    [~, name_sample, ~] = fileparts(samples(ii).name);
    file = fileread(['../week1/train/gt/gt.' name_sample '.txt']);
    lines= regexp(file, '\n', 'split');
    text = regexp(lines, ' ', 'split');
    image_type = char(text{1}{5});
    
    directory = sprintf('%s/%s.jpg', sdir, name_sample);
    image = imread(directory);
    
    switch image_type
        case {'A', 'B', 'C'}
            [n, ~] = size(images_data_group().ABC);
            images_data_group.ABC(n+1, :, :) = image(:, :);
        case {'D', 'F'}
            [n, ~] = size(images_data_group().DF);
            images_data_group.DF(n+1, :, :) = image(:, :);
        case 'E'
            [n, ~] = size(images_data_group().E);
            images_data_group.E(n+1, :, :) = image(:, :);
        otherwise
            disp('Unknow image type');
    end
    
   % Message to display on matlab
   num_image = num_image + 1;
   message = sprintf('Images processed: %d/%d', num_image, total_images);
   disp(message);
end
end