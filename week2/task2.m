%% Task 2 -- Measure the computational efficiency of your programed operators Erosion/Dilation

function task2()

% Show description on screen about task2
show_description_on_screen();

% Struct to save computational times of operations
computational_time = struct('imdilate', 0, 'custom_imdilate', 0, 'efficiency_dilation', 0, 'imerode', 0, ...
'custom_imerode', 0, 'efficiency_erosion', 0);

% Load example image to process. Images are logical (binaries)
image = im2bw(imread('example.jpg'));

% Structuring element: 5 by 5 square
% Getnhood: Get structuring element neighborhood. By this way, we can see
% value of variable on matlab workspace
se = getnhood(strel('square', 5));

%%------------------------------ EROSION EVAUATION -----------------------------%%

% Matlab erosion
tic
image_er = imerode(image, se);
computational_time.imerode = toc;  

% Custom erosion
tic
image_custom_er = custom_imerode(image, se);
computational_time.custom_imerode = toc;

% Calculate erosion efficiency
computational_time.efficiency_erosion = computational_time.imerode / computational_time.custom_imerode;
computational_time.efficiency_erosion = computational_time.efficiency_erosion*100;

%%------------------------------ DILATION EVAUATION -----------------------------%%

% Matlab dilation
tic
image_di = imdilate(image, se);
computational_time.imdilate = toc;

% Custom dilation
tic
image_custom_er = custom_imdilate(image, se);
computational_time.custom_imdilate = toc;

% Calculate dilaton efficiency
computational_time.efficiency_dilation = computational_time.imdilate / computational_time.custom_imdilate;
computational_time.efficiency_dilation = computational_time.efficiency_dilation*100;

% Save struct of computational times
save matlab_files/computational_time.mat computational_time
disp('Save computational_time.mat: done');

disp('task2(): done');
end

function show_description_on_screen()
disp('----------------------- TASK 2 DESCRIPTION -----------------------');
disp('Measure the computational efficiency of your programed operators ');
disp('Erosion/Dilation.');
disp('------------------------------------------------------------------');
fprintf('\n');
end