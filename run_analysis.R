##1) a tidy data set as described below
##2) a link to a Github repository with your script for performing the analysis
##3) a code book that describes the variables, the data, and any transformations
##or work that you performed to clean up the data called CodeBook.md. You should
##also include a README.md in the repo with your scripts. This repo explains how
##all of the scripts work and how they are connected.  

##You should create one R script called run_analysis.R that does the following. 
##1. Merges the training and the test sets to create one data set.

##Open and assign the 7 tables
data_subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
data_X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
data_y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
data_features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
data_subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
data_X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
data_y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)

##Using rbind and cbind make a rough table
##combine tests and trains then combine them all
dataSubject <- rbind(data_subject_train, data_subject_test)
dataY <- rbind(data_y_train, data_y_test)
dataX <- rbind(data_X_train, data_X_test)
names(dataSubject) <- c("subject")
names(dataY) <- c("activity")
names(dataX) <- data_features$V2
combine <- cbind(dataSubject, dataY)
fullData <- cbind(dataX, combine)


##2. Extracts only the measurements on the mean and standard deviation for each measurement. 

##I take this question as to asking which columns contain the strings "mean" or "std" and the last two of course
subData <- data_features$V2[grep("mean\\(\\)|std\\(\\)", data_features$V2)]
selectNames <- c(as.character(subData), "subject", "activity")
fullData <- subset(fullData, select=selectNames)

##3. Uses descriptive activity names to name the activities in the data set

activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
fullData$activity <- factor(fullData$activity, labels=activityLabels$V2)

##4. Appropriately labels the data set with descriptive variable names. 
names(fullData) <- gsub("^t", "time", names(fullData))
names(fullData) <- gsub("^f", "frequency", names(fullData))
names(fullData) <- gsub("Acc", "Accelerometer", names(fullData))
names(fullData) <- gsub("Gyro", "Gyroscope", names(fullData))
names(fullData) <- gsub("Mag", "Magnitude", names(fullData))
names(fullData) <- gsub("BodyBody", "Body", names(fullData))

##5. From the data set in step 4, creates a second, independent tidy data set with 
##the average of each variable for each activity and each subject.

##using plyr with aggregate
library(plyr)
tidyData <- aggregate(.~subject + activity, fullData, mean)
##this creates a dataset that is ordered 1:30 for each activity
##we need to rearrange so that it's organized by subject
tidyData <- tidyData[order(tidyData$subject, tidyData$activity),]
write.table(tidyData, file = "tidyData.txt", row.name=FALSE)

