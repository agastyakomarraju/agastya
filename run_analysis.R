### This script- run_analysis.R does the following: 

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
# 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Path Assumption - IMPORTANT

# This code will ONLY run if you have "UCI HAR Dataset " in your working direcotry
# Check your working directory with getwd() and place this folder there for the code to run


# All Intertial Signal files will be ignored


# Files used in this program: 

# For creating training merged dataset:
###################
# X_train.txt
# y_train.txt
# subject_train.txt
################

# For creating testing merged dataset:
###################
# X_test.txt
# y_test.txt
# subject_test.txt
################

# For Adding variable names:
###################
# features.txt
################

# For Adding Activity Descriptions:
###################
# activity_labels.txt
################


library(gdata)
library(reshape)
### Read Training Data In 

x_train<- read.table('UCI HAR Dataset/train/X_train.txt', header =FALSE)
y_train<- read.table('UCI HAR Dataset/train/y_train.txt', header =FALSE)
z_train<- read.table('UCI HAR Dataset/train/subject_train.txt', header =FALSE)


#Set Row ID for standarization 
row_id <-c(1:nrow(x_train))
x_train$row_id <- row_id
y_train$row_id <- row_id
z_train$row_id <- row_id

#Merge all training datasets
tb4<- merge(x_train, y_train, by="row_id")
tb4 <- merge(tb4, z_train, by="row_id")

#Setup names for the merged training dataset
names <- read.table("UCI HAR Dataset/features.txt")
names <- names[2]
names<- as.vector(t(names))
names<- c("Row_id", names, "Activity", "Subject")
names(tb4)<- names


#Read Test data 
x_test<- read.table('UCI HAR Dataset/test/X_test.txt', header =FALSE)
y_test<- read.table('UCI HAR Dataset/test/y_test.txt', header =FALSE)
z_test<- read.table('UCI HAR Dataset/test/subject_test.txt', header =FALSE)


#Set Row ID for standarization 
row_id2 <-c(1:nrow(x_test))
x_test$row_id <- row_id2
y_test$row_id <- row_id2
z_test$row_id <- row_id2

#Merge All Test Datasets and setting up names
tb1<- merge(x_test, y_test, by="row_id")
tb1 <- merge(tb1, z_test, by="row_id")
names(tb1)<- names

#Step1 Appending training and testing data
tb5<- rbind(tb4, tb1)  


#Step2
# Create reg ex for all variables with mean and std in their names
# using only mean and std - Excluding mean Freqs
l<- grep("mean\\(|std",names(tb5), value=TRUE)
tb6 <-tb5[l]


#Step3 and Step 4
#Add Activity and Subject to tb6 and merge it with activity lables
#Use appropriate labels

names2 <- names(tb6)
tb6$Activity <- tb5$Activity
tb6$Subject <- tb5$Subject
act_lab<- read.table('UCI HAR Dataset/activity_labels.txt', header =FALSE)
names(act_lab)<- c("Activity", "Act_Lab")
tb6 <- merge(tb6, act_lab, by.x="Activity")

#Step 5 - Aggregation to get mean for each variable 
# grouped by Activity and Subject
# It has 180 rows and 
td7 <- aggregate( tb6[,2:67], tb6[,68:69], FUN = mean )
names(td7)[2]<- "Activity"

#Final tidy data
write.fwf(td7, file="Final_Aggregation.txt")


