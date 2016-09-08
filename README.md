

The experiments were carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity was captured.

The obtained dataset had been randomly partitioned into two sets:
     -  the 'train' set - where 70% of the volunteers was selected for generating the training data
     -  the 'test' set  - where 30% was selected for generating the test data. 
     

Within the orginal data files supplied in the UCI HAR Dataset
For each record the following is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'test/subject_train.txt' :Each row identifies the subject who performed the activity for each window sample. Its range 
                             is from 1 to 30. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range 
                             is from 1 to 30. 


==========================================


The script "run_analysis.R" reads in, in turn, the necessary files to reassemble the partitioned dataset within UCI HAR:

 1: It merges the training and the test sets to create one data set, called "Full Data Set"
 
 2: It extracts only the measurements on the mean and standard deviation for each measurement, and stores them in vectors
    named 'col means' and 'col_sd' respectively
    
 3: It uses descriptive activity names to name the activities in "Full Data Set"
 
 4: It appropriately labels "Full_Data_Set with descriptive variable names.
 
 5: From "Full Data Set"  it creates and stores an independent tidy data set, "Tidy Data.txt" with the average of each variable for each activity and each subject.
 
