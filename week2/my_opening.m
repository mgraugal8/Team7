function y=my_opening(image, se)
    y=my_erosion(image,se);
    y=my_dilation(y,se);
end