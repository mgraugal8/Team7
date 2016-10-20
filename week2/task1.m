%% Task 1 -- Implement morphological operators Erosion/Dilation. Compose new operators from Dilation/Erosion:
%% Opening, Closing, TopHat and TopHat dual

function task1()

% Show description on screen about task1
show_description_on_screen();

% Load example image to process. Images are logical (binaries)
image = im2bw(imread('example.png'));

% Structuring element: 5 by 5 square
% Getnhood: Get structuring element neighborhood. By this way, we can see
% value of variable on matlab workspace
se = getnhood(strel('square', 5));

%%------------------------------ EROSION -----------------------------%%

% Operations
image_er = imerode(image,se);
image_custom_er = custom_imerode(image, se);
show_images(image, image_er, image_custom_er, 'EROSION operation', 'ORIGINAL image', 'MATLAB image', ...
'CUSTOM image');

% Check that custom erosion operation was succesfull
disp('Check EROSION operation. Comparing images ...');
check_images(image_er, image_custom_er);


%%----------------------------- DILATION -----------------------------%%

% Operations
image_di = imdilate(image,se);
image_custom_di = custom_imdilate(image, se);
show_images(image, image_di, image_custom_di, 'DILATION operation', 'ORIGINAL image', 'MATLAB image', ...
'CUSTOM image');

% Check that custom dilation operation was succesfull
disp('Check DILATION operation. Comparing images ...');
check_images(image_di, image_custom_di);


%%------------------------------ OPENING -----------------------------%%

% Operations
image_op = imopen(image,se);
image_custom_op = custom_imopen(image, se);
show_images(image, image_op, image_custom_op, 'OPENING operation', 'ORIGINAL image', 'MATLAB image', ...
'CUSTOM image');

% Check that custom opening operation was succesfull
disp('Check OPENING operation. Comparing images ...');
check_images(image_op, image_custom_op);


%%------------------------------ CLOSING -----------------------------%%

% Operations
image_cl = imopen(image,se);
image_custom_cl = custom_imclose(image, se);
show_images(image, image_cl, image_custom_cl, 'CLOSING operation', 'ORIGINAL image', 'MATLAB image', ...
'CUSTOM image');

% Check that custom closing operation was succesfull
disp('Check CLOSING operation. Comparing images ...');
check_images(image_cl, image_custom_cl);


%%------------------------------ TOP HAT -----------------------------%%


%%---------------------------- DUAL TOP HAT --------------------------%%


end

% Function: show_description
% Description: show description on screen
% Input: None
% Output: None
function show_description_on_screen()
disp('----------------------- TASK 1 DESCRIPTION -----------------------');
disp('Implement morphological operators Erosion/Dilation.');
disp('Compose new operators from Dilation/Erosion: Opening, Closing, ');
disp('TopHat and TopHat dual');
disp('------------------------------------------------------------------');
fprintf('\n');
end

% Function: check_images
% Description: compare images in order to know if are equals
% Input: image_1, image_2
% Output: None (show on screen result)
function check_images(image_1, image_2)
fprintf('Images are: ');
if sum(image_1(:)) == sum(image_2(:))
    fprintf('equal\n');
    fprintf('\n');
else
    fprintf('different\n');
    fprintf('\n');
end
end

% Function: show_images
% Description: show two images on screen
% Input: image_1, image_2, title_figure, title_1, title_2
% Output: None
function show_images(image_1, image_2, image_3, title_figure, title_1, title_2, title_3)
% Shows original image and dilated image
figure();
set(gcf,'name', title_figure,'numbertitle','off','Position', [300, 300, 1300, 400]);
subplot(1,3,1), imshow(image_1), title(title_1);
subplot(1,3,2), imshow(image_2), title(title_2);
subplot(1,3,3), imshow(image_3), title(title_3);
pause();
close all;
end

% Function: custom_imdilate
% Description: custom dilation operation
% Input: image, se
% Output: image dilated
function image_dilated = custom_imdilate(image, se)
% Get integer sizes of structuring element
[m, n] = size(se);
% Divided by 2 in order to adjust local window into image
m = floor(m/2);
n = floor(n/2);

% Add value 0 on borders of images
image = padarray(image, [m n]);
% Initialize to 0 dilated image
image_dilated = false(size(image));
% Get sizes of dilated image
[max_i, max_j] = size(image);

% Set max_i and max_j iterations to iterate inside of image
max_i = max_i-(2*m);
max_j = max_j-(2*n);

% Iterate pixel by pixel of image
for i=1:max_i
    for j=1:max_j
        window = image(i:i+(2*m),j:j+(2*n));   % Get window
        max_value = max(max(window&se));       % Get local MAXIMUM
        image_dilated(i,j) = max_value;        % Assing pixel value to image
    end
end
% Resize image dilated
image_dilated = image_dilated(1:max_i, 1:max_j);
end

% Function: image_eroded
% Description: custom erosion operation
% Input: image, se
% Output: image_eroded
function image_eroded = custom_imerode(image, se)
% Get integer sizes of structuring element
[m, n] = size(se);
% Divided by 2 in order to adjust local window into image
m = floor(m/2);
n = floor(n/2);

% Add value 0 on borders of images
image = padarray(image, [m n]);
% Initialize to 0 dilated image
image_eroded = false(size(image));
% Get sizes of dilated image
[max_i, max_j] = size(image);

% Set max_i and max_j iterations to iterate inside of image
max_i = max_i-(2*m);
max_j = max_j-(2*n);

% Iterate pixel by pixel of image
for i=1:max_i
    for j=1:max_j
        window = image(i:i+(2*m),j:j+(2*n));   % Get window
        min_value = min(min(window&se));       % Get local MINIMUM
        image_eroded(i,j) = min_value;         % Assing pixel value to image
    end
end
% Resize image eroded
image_eroded = image_eroded(1:max_i, 1:max_j);
end

% Function: custom_imopen
% Description: custom opening operation
% Input: image, se
% Output: image_opened
function image_opened = custom_imopen(image, se)

image_opened = 0;
end

% Function: custom_imopenimage_opened
% Description: custom closing operation
% Input: image, se
% Output: image_closed
function image_closed = custom_imclose(image, se)

image_closed = 0;
end