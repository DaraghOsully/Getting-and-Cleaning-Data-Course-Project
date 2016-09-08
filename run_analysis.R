

# MERGE THE TRAINING AND THE TEST SETS TO CREATE ON DATA SET
  X_train <- read.table("~/R/3 -Getting and Cleaning Data/Week 4/run_analysis/UCI HAR Dataset/train/X_train.txt", quote="\"")
  X_test <- read.table("~/R/3 -Getting and Cleaning Data/Week 4/run_analysis/UCI HAR Dataset/test/X_test.txt", quote="\"")
  X_merge <- rbind(X_train, X_test)

# EXTRACT ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT
  col_means <- colMeans(X_merge)
  col_sd <- apply(X_merge, 2, sd)
  
  # create a vector from the file features.txt, of all variable names
  features <- read.table("~/R/3 -Getting and Cleaning Data/Week 4/run_analysis/UCI HAR Dataset/features.txt", quote="\"")
  features <- as.vector(features[,2])
  
# APPROPRIATELY LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES
  names(X_merge) <- features
  
  # Merge the subject_train and subject_test data sets
  subject_train <- read.table("~/R/3 -Getting and Cleaning Data/Week 4/run_analysis/UCI HAR Dataset/train/subject_train.txt", quote="\"")
  subject_test <- read.table("~/R/3 -Getting and Cleaning Data/Week 4/run_analysis/UCI HAR Dataset/test/subject_test.txt", quote="\"")
  subject_merge <- rbind(subject_train, subject_test)
  
  # Merge the y_train and y_test data sets
  y_train <- read.table("~/R/3 -Getting and Cleaning Data/Week 4/run_analysis/UCI HAR Dataset/train/y_train.txt", quote="\"")
  y_test <- read.table("~/R/3 -Getting and Cleaning Data/Week 4/run_analysis/UCI HAR Dataset/test/y_test.txt", quote="\"")
  y_merge <- rbind(y_train, y_test)
   
  
  # merge X_merge, subject_merge, y_merge data sets
  merge2 <- cbind(X_merge, subject_merge)
  Full_Data_Set <- cbind(merge2, y_merge)
  
  
  
# USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET
  names <- names(Full_Data_Set)
  names[562:563] <- c("Subject","Activity Type")
  names(Full_Data_Set) <- names
  
  # renaming Activity Type 
  Activities <- read.table("~/R/3 -Getting and Cleaning Data/Week 4/run_analysis/UCI HAR Dataset/activity_labels.txt", quote="\"")
  Activities <- as.vector(Activities[,2])  
  Full_Data_Set[,563] <- as.factor(Full_Data_Set[,563])
  levels(Full_Data_Set[,563]) <- Activities
  
  # Extract the measurements on the mean and standard deviation for each meeasurement
  col_means <- colMeans(Full_Data_Set[,1:561])
  col_sd <- apply(Full_Data_Set[,1:561], 2, sd)
  
# CREATE A SECOND INDEPENDENT TIDY DATA SET WITH THE AVERAGE
# OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
  
  # start with doing so for the first variable
  Tidy_Data <- aggregate(list(axel =Full_Data_Set[,1]), by=list(Activity =Full_Data_Set[,563], Subject=Full_Data_Set[,562]), FUN=mean)
  
  # add to Independent_Data the aggregate values for the remaining variables
  for (i in 1:561){
          Tidy_Data[,i+2] <- aggregate(list(axel =Full_Data_Set[,i]), by=list(Activity =Full_Data_Set[,563], Subject=Full_Data_Set[,562]), FUN=mean)[3]} 
 
  # test to see the data set created is correct
  # for (i in 1:561){
  #         test2[i] <- mean(Full_Data_Set[Full_Data_Set[,562]==1 & Full_Data_Set[,563]==5,i])}
  
  # appropirately label the data set with descriptive variable names
  features <- read.table("~/R/3 -Getting and Cleaning Data/Week 4/run_analysis/UCI HAR Dataset/features.txt", quote="\"")
  features <- as.vector(features[,2])
  features1 <- c("Activity","Subject")
  features1 <- append(features1, features)
  
  #use descriptive activity names to name the activities in the data set
  names(Tidy_Data) <- features1
  Tidy_Data[,1] <- as.factor(Tidy_Data[,1])
  levels(Tidy_Data[,1]) <- Activities
  
  write.table(Tidy_Data, file = "Tidy Data", row.name=FALSE)

  