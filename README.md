Description about runanalysis.R
=======
Summary: 
run_analysis.R does the following: 

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive activity names. 
 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Based on the Samsung data that is provided, we will be reading in the required data sets from the "UCI HAR Dataset" folder.

Path Assumption - IMPORTANT

This code will ONLY run if you have "UCI HAR Dataset " in your working direcotry.
Check your working directory with getwd() and place this folder in your working directory for the code to run.

All Intertial Signal files in the "UCI HAR Dataset"  will be ignored.

Here is a list of files that are used by the script: 
 
 For creating training merged dataset:
 1. x_train.txt
 2. y_train.txt
 3. subject_train.txt
 

 For creating training merged dataset:
 1. x_test.txt
 2. y_test.txt
 3. subject_test.txt

 For Adding variable names:

 1. features.txt


 For Adding Activity Descriptions:

 1. activity_labels.txt
 
 
 For Adding variable names:
 
 1. features.txt


# For Adding Activity Descriptions:
###################
# activity_labels.txt
