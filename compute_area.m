function area=compute_area(file_name)
    mask=imread(['/Users/marccarneherrera/Desktop/M1_project/datasets/train_set/train/mask/mask.' file_name '.png']);
    %Area = num of white píxels
    S=size(mask);
    area=0;
    
    for ii=1:S(1)
        for jj=1:S(2)
            if mask(ii,jj)==1
                area=area+1;
            end
        end
    end
end
