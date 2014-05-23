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
 
 Segment 1 - For creating training merged dataset:
 1. x_train.txt
 2. y_train.txt
 3. subject_train.txt
 

 Segment 2 - For creating training merged dataset:
 1. x_test.txt
 2. y_test.txt
 3. subject_test.txt

 Segment 3 - For Adding variable names:
 1. features.txt


 Segment 4 - For Adding Activity Descriptions:
 1. activity_labels.txt
 
 
Steps:
1.) The code reads all the datasets from segment 1 and merges them into a table.
2.) It then names all the varialbes based on the information in Segment 3 (features.txt)
3.) It repeats the process for test files in Segment 2
4.) These files are then appeneded to form a large table with 10299 rows - This is the answer to question 1
5.) A grep function is written to subset this table into a table with only mean and std columns. It ignores meanFreq columns. For the purpose of this project only mean columns are being considered - This is the answer to question 2
6.) Activity and Subject are added to this dataset and merged with the lookup table present in Secment 4 ( activity.txt). 7.) The resulting data set will have a column which will catpture activity descriptions
8.) We will then create a tidy data set "Final_Aggregation.txt" which will be placed in the working directory.

Reading back Final_Aggregation.txt:

You can read back this from the text file by using this code:
agg_tab<- read.table("Final_Aggregation.txt", header=TRUE)




