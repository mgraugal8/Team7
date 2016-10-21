function normalize_RGB = normalize_RGB_image(image)
    % Split channels RBG
    red = double(image(:, :, 1));            
    green = double(image(:, :, 2));           
    blue = double(image(:, :, 3)); 

    % Normalize each channel
    normalize_red = max(0,red./sqrt(power(red,2) + power(green,2) + power(blue,2)));
    normalize_green = max(0,green./sqrt(power(red,2) + power(green,2) + ...
    power(blue,2)));
    normalize_blue = max(0,blue./sqrt(power(red,2)+ power(green,2) + power(blue,2)));

    normalize_red = normalize_red / (sqrt(3));
    normalize_green = normalize_green / (sqrt(3)); 
    normalize_blue = normalize_blue / (sqrt(3));
    
    % Merge channels again
    normalize_RGB = cat(3,normalize_red, normalize_green, normalize_blue);
end