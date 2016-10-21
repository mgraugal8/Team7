function y=compute_probability(image, hist, nbins)
    s = size(image);
    image = normalize_RGB_image(image);
    prob = zeros(s(1),s(2));

    for ii=1:s(1)
        for jj=1:s(2)
            r_bin=min(floor(nbins*image(ii,jj,1))+1,nbins);
            g_bin=min(floor(nbins*image(ii,jj,2))+1,nbins);
            b_bin=min(floor(nbins*image(ii,jj,3))+1,nbins);
            prob(ii,jj)=hist(r_bin,g_bin,b_bin);
        end
    end
    y=prob;
end