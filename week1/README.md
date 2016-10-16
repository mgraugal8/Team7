# Week1

All images with mask and annotations folder are provided on current project. Project structure are split into 4 main files:

  - task1(). Analyse the dataset. Determine the characteristics of the signals in the training set: max and min size, form factor, filling ratio of each type of signal, frequency of appearance (using text annotations and ground-truth masks).         Group the signals according to their shape and color.
   
  - taks2(). Create train/validation split using provided training images. Create a folder dataset, with train_set folder,         where are located train and validation split, each of them contains set of images with mask and annotations folder.  
  
  - task3(). Color segmentation to generate a mask. In order to generate a color segmentation, there are 3 methods to implement     color segmentation, in order to recognize traffic signals. All methods use the same equation but different colour spaces:
  
    Equation segmentation to detect colors red and blue of traffic signals
	  mask =  red_mask + blue_mask  → α = 0.68
    red_mask = red_component - α (green_component + blue_component)
    blue_mask = blue_component - α (red_component + green_component)

    Methods implemented:

      - Method 1: RGB color space
      
      - Method 2: normalized RGB color space
      
      - Method 3: CIE XYZ color space
  
  - task4(). Evaluate the segmentation using ground truth.
  
