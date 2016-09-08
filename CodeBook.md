run_analysis.R
====================================
the script creates the following data sets and values

 - subject_train : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
 - subject_test : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- subject merge - a data frame of the merged data sets subject_train and subject_test

- X_train: Training set.
- X_test:  Testing set
- X_merge: a data frame of the merged data sets X_train and X_test

  col_means: the mean for each measurement in X_merge
  col_sd: the standard deviation for each measurement in Y_merge
  
- subject_train: Training set subject numbers.
- subject_test:  Testing set subject numbers
- subject_merge: a data frame of the merged data sets subject_train and subject_test  

- y_train: Training set Acivity Types.
- y_test:  Testing set Activity Types
- y_merge: a data frame of the merged data sets y_train and y_test

- merge2: a merged data set of X_merge and subject_merge
- Full_Data_Set: a merged data set of merge2 and y_merge

- names: a vector containing all variable names within "Full_Data_Set"

- Activities: a vector containing all activity types within "Full_Data_Set"

- Tidy Data : an independent tidy data set, with the average of each variable for each activity and each subject.

- features: a vector containing the names of all variables in X_merge
- features1: a vector containing "Activity Type", "Subject" and the contents of features
