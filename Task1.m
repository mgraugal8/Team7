%% Task 1 -- Analyse the dataset

%cd('datasets/train_set/train');
clear all;
samples=dir('datasets/train_set/train');

%% READ IMAGES IN THE TRAIN FOLDER
%samples=samples(arrayfun(@(x) x.name(1)~='.',samples));
samples=samples(arrayfun(@(x) x.name(1)=='0',samples));

%% GROUP IMAGES BY TYPES IN MATRIX
aa=0;
bb=0;
cc=0;
dd=0;
ee=0;
ff=0;

index=0;

for ii=1:length(samples)
    [~,name_sample,~]=fileparts(samples(ii).name);
    file=fileread(['datasets/train_set/train/gt/gt.' name_sample '.txt']);
    text=regexp(file, ' ', 'split');
    
    index=index+1;
    
    value(1)=str2num(text{1});
    value(2)=str2num(text{2});
    value(3)=str2num(text{3});
    value(4)=str2num(text{4});
    
    %Computed values
    value(5)=abs(value(2)-value(4)); %X size
    value(6)=abs(value(1)-value(3)); %Y size
    value(7)=value(5)/value(6); %form factor
    value(8)=value(5)*value(6); %bbox area
    value(9)=compute_area(name_sample);
    value(10)=value(9)/value(8); %filling ratio
    value(11)=index; %Relate an integer to a name
    
    file_name{index}=name_sample;
    
    if text{5}(1)=='A'
        aa=aa+1;
        A(aa,:)=value(1,:);
    else if text{5}(1)=='B'
            bb=bb+1;
            B(bb,:)=value(1,:);
        else if text{5}(1)=='C'
                cc=cc+1;
                C(cc,:)=value(1,:);
            else if text{5}(1)=='D'
                    dd=dd+1;
                    D(dd,:)=value(1,:);
                else if text{5}(1)=='E'
                        ee=ee+1;
                        E(ee,:)=value(1,:);
                    else if text{5}(1)=='F'
                            ff=ff+1;
                            F(ff,:)=value(1,:);
                        end
                    end
                end
            end
        end
    end  
end
