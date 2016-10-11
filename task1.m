%% Task 1 -- Analyse the dataset
%% Description: Determine the characteristics of the signals in the 
%% training set: max and min size, form factor, filling ratio of each type 
%% of signal, frequency of appearance (using text annotations and 
%% ground-truth masks). Group the signals according to their shape and 
%% color

clear all;                      % Clear screen
samples = dir('train');         % List directory

%% READ IMAGES IN THE TRAIN FOLDER
samples = samples(arrayfun(@(x) x.name(1) == '0', samples));

%% GROUP IMAGES BY TYPES IN MATRIX
% Initialize group of images in order to preallocate memory
% Format: (field, value) --> (type of signal, array of values)
n = 0;  % rows. Firstly, initialized to 0
m = 5;  % columns. 1: file name, 2: width, 3: height, 4: form factor, 
        % 5: bbox area,  6: compute area, 7: filling ratio
images_data = struct('A', zeros(n, m),'B', zeros(n, m),'C', zeros(n, m) ...
,'D', zeros(n, m), 'E', zeros(n, m),'F', zeros(n, m));

for ii=1:length(samples)
    [~, name_sample, ~] = fileparts(samples(ii).name);
    file = fileread(['train/gt/gt.' name_sample '.txt']);
    text = regexp(file, ' ', 'split');
    
    % Get name. Delete character '.' from string name in order to 
    % save index of name image
    name_sample = strrep(name_sample,'.','');
    value(1) = str2double(name_sample);     % file name
    tly = str2double(text{1});              
    tlx = str2double(text{2});
    bry = str2double(text{3});
    brx = str2double(text{4});
    
    % Computed values
    value(2) = abs(tlx-brx);                % width
    value(3) = abs(tly-bry);                % height
    value(4) = value(2)/value(3);           % form factor
    value(5) = value(2)*value(3);           % bbox area
    % value(6) = compute_area(name_sample); % compute area
    % value(7) = value(6)/value(5);         % filling ratio

    image_type = char(text(1,5));
    % There are extra space after letter. So we get the letter of type
    % image only from position (1,1). Note: position(1,2) space character
    image_type = image_type(1,1);               
    [n, ~] = size(images_data().(image_type));
    images_data().(image_type)(n+1, :) = value(1, :);
end