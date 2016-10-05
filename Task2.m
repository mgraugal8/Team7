%% Task 2 - Split the dataset into training and validation

%It's important to have execute the task 1 to have all data
%This algorithm select a number of samples for each type taking the N first
%samples. It's possible to add a new criteria for example, randomly sorting
%the matrix.

%% Create new directories
mkdir('datasets/train_set/train_split');
mkdir('datasets/train_set/train_split/gt');
mkdir('datasets/train_set/train_split/mask');

mkdir('datasets/train_set/validation_split');
mkdir('datasets/train_set/validation_split/gt');
mkdir('datasets/train_set/validation_split/mask');


%% Split types

%% A
num_training=round(aa*0.7);
tot_training=aa;

for pp=1:num_training
    index=A(pp,11); %For a sample of type A
    name_file=file_name{index};
    
    ['datasets/train_set/train/' name_file '.jpg']
    
    %Copy image
    copyfile(['datasets/train_set/train/' name_file '.jpg'],['datasets/train_set/train_split']);
    %Copy gt file
    copyfile(['datasets/train_set/train/gt/gt.' name_file '.txt'],['datasets/train_set/train_split/gt']);
    %Copy mask
    copyfile(['datasets/train_set/train/mask/mask.' name_file '.png'],['datasets/train_set/train_split/mask']);
end

for pp=(num_training+1):tot_training
    index=A(pp,11); %For a sample of type A
    name_file=file_name{index};
    
    %Copy image
    copyfile(['datasets/train_set/train/' name_file '.jpg'],['datasets/train_set/validation_split']);
    %Copy gt file
    copyfile(['datasets/train_set/train/gt/gt.' name_file '.txt'],['datasets/train_set/validation_split/gt']);
    %Copy mask
    copyfile(['datasets/train_set/train/mask/mask.' name_file '.png'],['datasets/train_set/validation_split/mask']);
end

%% B
num_training=round(bb*0.7);
tot_training=bb;

for pp=1:num_training
    index=B(pp,11); %For a sample of type B
    name_file=file_name{index};
    
    %Copy image
    copyfile(['datasets/train_set/train/' name_file '.jpg'],['datasets/train_set/train_split']);
    %Copy gt file
    copyfile(['datasets/train_set/train/gt/gt.' name_file '.txt'],['datasets/train_set/train_split/gt']);
    %Copy mask
    copyfile(['datasets/train_set/train/mask/mask.' name_file '.png'],['datasets/train_set/train_split/mask']);
end

for pp=(num_training+1):tot_training
    index=B(pp,11); %For a sample of type B
    name_file=file_name{index};
    
    %Copy image
    copyfile(['datasets/train_set/train/' name_file '.jpg'],['datasets/train_set/validation_split']);
    %Copy gt file
    copyfile(['datasets/train_set/train/gt/gt.' name_file '.txt'],['datasets/train_set/validation_split/gt']);
    %Copy mask
    copyfile(['datasets/train_set/train/mask/mask.' name_file '.png'],['datasets/train_set/validation_split/mask']);
end

%% C
num_training=round(cc*0.7);
tot_training=cc;

for pp=1:num_training
    index=C(pp,11); %For a sample of type C
    name_file=file_name{index};
    
    %Copy image
    copyfile(['datasets/train_set/train/' name_file '.jpg'],['datasets/train_set/train_split']);
    %Copy gt file
    copyfile(['datasets/train_set/train/gt/gt.' name_file '.txt'],['datasets/train_set/train_split/gt']);
    %Copy mask
    copyfile(['datasets/train_set/train/mask/mask.' name_file '.png'],['datasets/train_set/train_split/mask']);
end

for pp=(num_training+1):tot_training
    index=C(pp,11); %For a sample of type C
    name_file=file_name{index};
    
    %Copy image
    copyfile(['datasets/train_set/train/' name_file '.jpg'],['datasets/train_set/validation_split']);
    %Copy gt file
    copyfile(['datasets/train_set/train/gt/gt.' name_file '.txt'],['datasets/train_set/validation_split/gt']);
    %Copy mask
    copyfile(['datasets/train_set/train/mask/mask.' name_file '.png'],['datasets/train_set/validation_split/mask']);
end

%% D
num_training=round(dd*0.7);
tot_training=dd;

for pp=1:num_training
    index=D(pp,11); %For a sample of type D
    name_file=file_name{index};
    
    %Copy image
    copyfile(['datasets/train_set/train/' name_file '.jpg'],['datasets/train_set/train_split']);
    %Copy gt file
    copyfile(['datasets/train_set/train/gt/gt.' name_file '.txt'],['datasets/train_set/train_split/gt']);
    %Copy mask
    copyfile(['datasets/train_set/train/mask/mask.' name_file '.png'],['datasets/train_set/train_split/mask']);
end

for pp=(num_training+1):tot_training
    index=D(pp,11); %For a sample of type D
    name_file=file_name{index};
    
    %Copy image
    copyfile(['datasets/train_set/train/' name_file '.jpg'],['datasets/train_set/validation_split']);
    %Copy gt file
    copyfile(['datasets/train_set/train/gt/gt.' name_file '.txt'],['datasets/train_set/validation_split/gt']);
    %Copy mask
    copyfile(['datasets/train_set/train/mask/mask.' name_file '.png'],['datasets/train_set/validation_split/mask']);
end

%% E
num_training=round(ee*0.7);
tot_training=ee;

for pp=1:num_training
    index=E(pp,11); %For a sample of type E
    name_file=file_name{index};
    
    %Copy image
    copyfile(['datasets/train_set/train/' name_file '.jpg'],['datasets/train_set/train_split']);
    %Copy gt file
    copyfile(['datasets/train_set/train/gt/gt.' name_file '.txt'],['datasets/train_set/train_split/gt']);
    %Copy mask
    copyfile(['datasets/train_set/train/mask/mask.' name_file '.png'],['datasets/train_set/train_split/mask']);
end

for pp=(num_training+1):tot_training
    index=E(pp,11); %For a sample of type E
    name_file=file_name{index};
    
    %Copy image
    copyfile(['datasets/train_set/train/' name_file '.jpg'],['datasets/train_set/validation_split']);
    %Copy gt file
    copyfile(['datasets/train_set/train/gt/gt.' name_file '.txt'],['datasets/train_set/validation_split/gt']);
    %Copy mask
    copyfile(['datasets/train_set/train/mask/mask.' name_file '.png'],['datasets/train_set/validation_split/mask']);
end

%% F
num_training=round(ff*0.7);
tot_training=ff;

for pp=1:num_training
    index=F(pp,11); %For a sample of type F
    name_file=file_name{index};
    
    %Copy image
    copyfile(['datasets/train_set/train/' name_file '.jpg'],['datasets/train_set/train_split']);
    %Copy gt file
    copyfile(['datasets/train_set/train/gt/gt.' name_file '.txt'],['datasets/train_set/train_split/gt']);
    %Copy mask
    copyfile(['datasets/train_set/train/mask/mask.' name_file '.png'],['datasets/train_set/train_split/mask']);
end

for pp=(num_training+1):tot_training
    index=F(pp,11); %For a sample of type F
    name_file=file_name{index};
    
    %Copy image
    copyfile(['datasets/train_set/train/' name_file '.jpg'],['datasets/train_set/validation_split']);
    %Copy gt file
    copyfile(['datasets/train_set/train/gt/gt.' name_file '.txt'],['datasets/train_set/validation_split/gt']);
    %Copy mask
    copyfile(['datasets/train_set/train/mask/mask.' name_file '.png'],['datasets/train_set/validation_split/mask']);
end
