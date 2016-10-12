%% Task 2 - Split the dataset into training and validation
%% Desription: Create train/validation split using provided training images

% It's important to have execute the task 1 to have all data
% This algorithm select a number of samples for each type taking the N 
% first samples. It's possible to add a new criteria for example, randomly 
% sorting the matrix.

function task2()
% Load images_data from task1
if exist('images_data.mat', 'file') == 2
    images_data = load('images_data.mat');
    images_data = images_data.images_data;
    %% Create new directories
    if ~exist('datasets', 'dir')
      % Train split directories
        mkdir('datasets/train_set/train_split');
        mkdir('datasets/train_set/train_split/gt');
        mkdir('datasets/train_set/train_split/mask');
        % Validations split directories
        mkdir('datasets/train_set/validation_split');
        mkdir('datasets/train_set/validation_split/gt');
        mkdir('datasets/train_set/validation_split/mask');
    end

    %% Split types
    array_types = {'A','B','C','D','E','F'};
    num_types_singals = length(fieldnames(images_data));

    for tp=1:num_types_singals  
        % Get type of signal
        type_signal = char(array_types(tp));
        [m, ~] = size(images_data().(type_signal));
        train_partition = 0.7;
        num_training = round(m * train_partition);       

        for pp=1:m
            % Make file name
            name_file = num2str(images_data().(type_signal)(pp,1));
            name_file = make_file_name(name_file);

            % Put image on train or validation split, depending on value of
            % num_training calculated before
            if pp <= num_training     
                image_directory = 'datasets/train_set/train_split';
                gt_directory = 'datasets/train_set/train_split/gt';
                mask_direcotry = 'datasets/train_set/train_split/mask';
            else
                image_directory = 'datasets/train_set/validation_split';
                gt_directory = 'datasets/train_set/validation_split/gt';
                mask_direcotry = 'datasets/train_set/validation_split/mask';
            end

            % Copy image
            copyfile(['train/' name_file '.jpg'], image_directory);
            % Copy gt file
            copyfile(['train/gt/gt.' name_file '.txt'], gt_directory);
            % Copy mask
            copyfile(['train/mask/mask.' name_file '.png'], mask_direcotry);
        end
    end
else
   disp('Error to load images_data.mat variable');
   disp('Execute task1() to create images_data.mat!');
end
end