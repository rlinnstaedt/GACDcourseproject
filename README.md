# GACDcourseproject
run_analysis.R

#####Read in the files using read.table
```
data_subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
data_X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
data_y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
data_features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
data_subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
data_X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
data_y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
```

#####Combine the tables using rbind and cbind
We want to take 8 files and arrange them into one dataset.  We take the seven from above and add
the eighth in a later step.  we want the features to form the variable names the X_train and X_test
to form the body of the data.  Using the names() we add labels to the activity and subjects 
```
dataSubject <- rbind(data_subject_train, data_subject_test)
dataY <- rbind(data_y_train, data_y_test)
dataX <- rbind(data_X_train, data_X_test)
names(dataSubject) <- c("subject")
names(dataY) <- c("activity")
names(dataX) <- data_features$V2
combine <- cbind(dataSubject, dataY)
fullData <- cbind(dataX, combine)
```

#####Filter out only columns including "mean()" or "std()" plus subject and activity
using base package grep to get the string matches and the second column from our variable list
assigned to data_features.  Then subset to produce a final reduced data set.
```
subData <- data_features$V2[grep("mean\\(\\)|std\\(\\)", data_features$V2)]
selectNames <- c(as.character(subData), "subject", "activity")
fullData <- subset(fullData, select=selectNames)
```

#####Replace keys in activity column with their respective values
read table to get the eighth data set which contains the keys/values for activity
use factor() to assign values to keys.  
```
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
fullData$activity <- factor(fullData$activity, labels=activityLabels$V2)
```

#####Rename messy variables using gsub() and names()
```
names(fullData) <- gsub("^t", "time", names(fullData))
names(fullData) <- gsub("^f", "frequency", names(fullData))
names(fullData) <- gsub("Acc", "Accelerometer", names(fullData))
names(fullData) <- gsub("Gyro", "Gyroscope", names(fullData))
names(fullData) <- gsub("Mag", "Magnitude", names(fullData))
names(fullData) <- gsub("BodyBody", "Body", names(fullData))
```

#####Create a final tidy data set
Using plyr package's aggregate(): calculate the mean for each variable for each subject.  Use order()
to further arrange data set by activity.  Finally write.table to export results to a .txt file.
```
library(plyr)
tidyData <- aggregate(.~subject + activity, fullData, mean)
tidyData <- tidyData[order(tidyData$subject, tidyData$activity),]
write.table(tidyData, file = "tidyData.txt", row.name=FALSE)
```