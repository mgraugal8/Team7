function y=my_closing(image,se)
    y=my_dilation(image,se);
    y=my_erosion(image,se);
end