function y=single_histogram(image, mask, nbins)
    s = size(image);
    image = normalize_RGB_image(image);    
    histogram = zeros(nbins,nbins,nbins);
    
    for ii=1:s(1)
        for jj=1:s(2)
            if mask(ii,jj)~=0
                r_bin=min(floor(nbins*image(ii,jj,1))+1,nbins);
                g_bin=min(floor(nbins*image(ii,jj,2))+1,nbins);
                b_bin=min(floor(nbins*image(ii,jj,3))+1,nbins);
                histogram(r_bin,:,b_bin)=histogram(r_bin,g_bin,b_bin)+1;
            end
        end
    end
    y=histogram;  
end