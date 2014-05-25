This ReadMe file is an in-depth look into the code written for the Course Project of Getting and Cleaning Data
--------------------------------------------------------------------------------

Course Project:
 
**set working directory to directory UCI (zip file rename to UCI); original zip file renamed to UCI**

setwd(UCI)

**the variables in this file end up being the basis for the variable names and measurements in the final tidy data set**

Features <- read.table("features.txt", sep = " ", stringsAsFactors = FALSE)

**the elements in this file are the description of the data in the y files describing the activity (i.e. walking, sitting, etc) and corresponding value**

activitylabels <- read.table("activity_labels.txt", sep = " ", stringsAsFactors = FALSE)

**set working directory to test file**

setwd("test")

**the elements in this file are the y values of the subjects being tested; this will make more sense once combined in the larger dataset**

subjecttest <- read.table("subject_test.txt", sep = " ", stringsAsFactors = FALSE, col.names = "subjectID") 

**elements in this file are the recorded measurements for each row and each variable that will match up later**

xtest <- read.table("X_test.txt", sep = "")

**subset below will extract only mean and standard deviations from all of the values of the 561 variables in the x file; determining the fields can be done by looking into the features file and makring down the variables of std and mean**

xtest <- xtest[, c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266:271, 345:350, 424:429, 503, 504, 516, 517, 529, 530, 542, 543)]

**function below will input the specified variable names in the created subset of variable measurements. I personally wrote the variables directly into the table but there are ways to import the names from the features file and use a few functions to clean up and format the variable names**

names(xtest) <- c("tBodyAcc_meanx", "tBodyAcc_meany", "tBodyAcc_meanz", "tBodyAcc_stdx", "tBodyAcc_stdy", "tBodyAcc_stdz", "tGravityAcc_meanx", "tGravityAcc_meany", "tGravityAcc_meanz", "tGravityAcc_stdx", "tGravityAcc_stdy", "tGravityAcc_stdz", "tBodyAccJerk_meanx", "tBodyAccJerk_meany", "tBodyAccJerk_meanz", "tBodyAccJerk_stdx", "tBodyAccJerk_stdy", "tBodyAccJerk_stdz", "tBodyGyro_meanx", "tBodyGyro_meany", "tBodyGyro_meanz", "tBodyGyro_stdx", "tBodyGyro_stdy", "tBodyGyro_stdz", "tBodyGyroJerk_meanx", "tBodyGyroJerk_meany", "tBodyGyroJerk_meanz", "tBodyGyroJerk_stdx", "tBodyGyroJerk_stdy", "tBodyGyroJerk_stdz", "tBodyAccMag_mean", "tBodyAccMag_std", "tGravityAccMag_mean", "tGravityAccMag_std", "tBodyAccJerkMag_mean", "tBodyAccJerkMag_std", "tBodyGyroMag_mean", "tBodyGyroMag_std", "tBodyGyroJerkMag_mean", "tBodyGyroJerkMag_std", "fBodyAcc_meanx", "fBodyAcc_meany", "fBodyAcc_meanz", "fBodyAcc_stdx", "fBodyAcc_stdy", "fBodyAcc_stdz", "fBodyAccJerk_meanx", "fBodyAccJerk_meany", "fBodyAccJerk_meanz", "fBodyAccJerk_stdx", "fBodyAccJerk_stdy", "fBodyAccJerk_stdz", "fBodyGyro_meanx", "fBodyGyro_meany", "fBodyGyro_meanz", "fBodyGyro_stdx", "fBodyGyro_stdy", "fBodyGyro_stdz", "fBodyAccMag_mean", "fBodyAccMag_std", "fBodyBodyAccJerkMag_mean", "fBodyBodyAccJerkMag_std", "fBodyBodyGyroMag_mean", "fBodyBodyGyroMag_std", "fBodyBodyGyroJerkMag_mean", "fBodyBodyGyroJerkMag_std")

**the elements in this file are the numeric representations of the activites that will be written in in the next steps**

ytest <- read.table("y_test.txt", sep = "", col.name = "activity")

**the functions below replaces the numeric values of the activities performed with characters( i.e. 1 = Walking)**

ytest[ytest == 1] <- "Walking"
ytest[ytest == 2] <- "Walking_Upstairs"
ytest[ytest == 3] <- "Walking_Downstairs"
ytest[ytest == 4] <- "Sitting"
ytest[ytest == 5] <- "Standing"
ytest[ytest == 6] <- "Laying"
setwd("..") 

**set working directory one level up**

setwd("..")

**set working directory to train file**

setwd("train") 

**the elements in this file are the y values of the subjects being testted; this will make more sense once combined in the larger dataset**

subjecttrain <- read.table("subject_train.txt", sep = " ", stringsAsFactors = FALSE, col.name = "subjectID") 

**elements in this file are the recorded measurements for each row and each variable that will match up later**

xtrain <- read.table("X_train.txt", sep = "") 

**subset below will extract only mean and standard deviations from all of the values of the 561 variables in the x file; determining the fields can be done by looking into the features file and makring down the variables of std and mean**

xtrain <- xtrain[, c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266:271, 345:350, 424:429, 503, 504, 516, 517, 529, 530, 542, 543)]

**function below will input the specified variable names in the created subset of variable measurements. I personally wrote the variables directly into the table but there are ways to import the names from the features file and use functions to clean up and format the variable names**

names(xtrain) <- c("tBodyAcc_meanx", "tBodyAcc_meany", "tBodyAcc_meanz", "tBodyAcc_stdx", "tBodyAcc_stdy", "tBodyAcc_stdz", "tGravityAcc_meanx", "tGravityAcc_meany", "tGravityAcc_meanz", "tGravityAcc_stdx", "tGravityAcc_stdy", "tGravityAcc_stdz", "tBodyAccJerk_meanx", "tBodyAccJerk_meany", "tBodyAccJerk_meanz", "tBodyAccJerk_stdx", "tBodyAccJerk_stdy", "tBodyAccJerk_stdz", "tBodyGyro_meanx", "tBodyGyro_meany", "tBodyGyro_meanz", "tBodyGyro_stdx", "tBodyGyro_stdy", "tBodyGyro_stdz", "tBodyGyroJerk_meanx", "tBodyGyroJerk_meany", "tBodyGyroJerk_meanz", "tBodyGyroJerk_stdx", "tBodyGyroJerk_stdy", "tBodyGyroJerk_stdz", "tBodyAccMag_mean", "tBodyAccMag_std", "tGravityAccMag_mean", "tGravityAccMag_std", "tBodyAccJerkMag_mean", "tBodyAccJerkMag_std", "tBodyGyroMag_mean", "tBodyGyroMag_std", "tBodyGyroJerkMag_mean", "tBodyGyroJerkMag_std", "fBodyAcc_meanx", "fBodyAcc_meany", "fBodyAcc_meanz", "fBodyAcc_stdx", "fBodyAcc_stdy", "fBodyAcc_stdz", "fBodyAccJerk_meanx", "fBodyAccJerk_meany", "fBodyAccJerk_meanz", "fBodyAccJerk_stdx", "fBodyAccJerk_stdy", "fBodyAccJerk_stdz", "fBodyGyro_meanx", "fBodyGyro_meany", "fBodyGyro_meanz", "fBodyGyro_stdx", "fBodyGyro_stdy", "fBodyGyro_stdz", "fBodyAccMag_mean", "fBodyAccMag_std", "fBodyBodyAccJerkMag_mean", "fBodyBodyAccJerkMag_std", "fBodyBodyGyroMag_mean", "fBodyBodyGyroMag_std", "fBodyBodyGyroJerkMag_mean", "fBodyBodyGyroJerkMag_std")

**the elements in this file are the numeric representations of the activites that will be written in in the next steps**

ytrain <- read.table("y_train.txt", sep = "", col.names = "activity")

**the functions below will be replacing the numeric values of the activities performed with characters( i.e. 1 = Walking)**

ytrain[ytrain == 1] <- "Walking"
ytrain[ytrain == 2] <- "Walking_Upstairs"
ytrain[ytrain == 3] <- "Walking_Downstairs"
ytrain[ytrain == 4] <- "Sitting"
ytrain[ytrain == 5] <- "Standing"
ytrain[ytrain == 6] <- "Laying"

**the function below does a column combined of the subjects tested, the activity performed, and the measurement recorded of the test values**

alltest <- cbind(subjecttest, ytest, xtest)

**the function below does a column combined of the subjects tested, the activity performed, and the measurement recorded of the train values**

alltrain <- cbind(subjecttrain, ytrain, xtrain)

**function below does a row combine of the two column binded tables that were just created from the test and train data; essentially lumping one dataset on top of the other**

alldata <- rbind(alltest, alltrain)

**install reshape 2 package to run dcast function**

install.packages("reshape2")

**loads reshape2 package**

library(reshape2)

**creates a variable of all of the headers in your large data set excluding the subjectID and activity column; essentially just all of the recorded measurements**

variables <- names(alldata[, 3:68])

*using dcast function creates a tidy data set of the means of the recorded values for each subject and each activity; otherwise said as the means of each subjects recorded meaurements for each activity**

meanfeatures <- dcast(alldata, subjectID + activity ~ variables, mean)

***Below is the code in full***

```
## Course Project
## rename zip file to UCI and prior to running code set working directory to UCI
Features <- read.table("features.txt", sep = " ", stringsAsFactors = FALSE)
activitylabels <- read.table("activity_labels.txt", sep = " ", stringsAsFactors = FALSE)
setwd("test") 
subjecttest <- read.table("subject_test.txt", sep = " ", stringsAsFactors = FALSE, col.names = "subjectID") 
xtest <- read.table("X_test.txt", sep = "") 
xtest <- xtest[, c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266:271, 345:350, 424:429, 503, 504, 516, 517, 529, 530, 542, 543)]
names(xtest) <- c("tBodyAcc_meanx", "tBodyAcc_meany", "tBodyAcc_meanz", "tBodyAcc_stdx", "tBodyAcc_stdy", "tBodyAcc_stdz", "tGravityAcc_meanx", "tGravityAcc_meany", "tGravityAcc_meanz", "tGravityAcc_stdx", "tGravityAcc_stdy", "tGravityAcc_stdz", "tBodyAccJerk_meanx", "tBodyAccJerk_meany", "tBodyAccJerk_meanz", "tBodyAccJerk_stdx", "tBodyAccJerk_stdy", "tBodyAccJerk_stdz", "tBodyGyro_meanx", "tBodyGyro_meany", "tBodyGyro_meanz", "tBodyGyro_stdx", "tBodyGyro_stdy", "tBodyGyro_stdz", "tBodyGyroJerk_meanx", "tBodyGyroJerk_meany", "tBodyGyroJerk_meanz", "tBodyGyroJerk_stdx", "tBodyGyroJerk_stdy", "tBodyGyroJerk_stdz", "tBodyAccMag_mean", "tBodyAccMag_std", "tGravityAccMag_mean", "tGravityAccMag_std", "tBodyAccJerkMag_mean", "tBodyAccJerkMag_std", "tBodyGyroMag_mean", "tBodyGyroMag_std", "tBodyGyroJerkMag_mean", "tBodyGyroJerkMag_std", "fBodyAcc_meanx", "fBodyAcc_meany", "fBodyAcc_meanz", "fBodyAcc_stdx", "fBodyAcc_stdy", "fBodyAcc_stdz", "fBodyAccJerk_meanx", "fBodyAccJerk_meany", "fBodyAccJerk_meanz", "fBodyAccJerk_stdx", "fBodyAccJerk_stdy", "fBodyAccJerk_stdz", "fBodyGyro_meanx", "fBodyGyro_meany", "fBodyGyro_meanz", "fBodyGyro_stdx", "fBodyGyro_stdy", "fBodyGyro_stdz", "fBodyAccMag_mean", "fBodyAccMag_std", "fBodyBodyAccJerkMag_mean", "fBodyBodyAccJerkMag_std", "fBodyBodyGyroMag_mean", "fBodyBodyGyroMag_std", "fBodyBodyGyroJerkMag_mean", "fBodyBodyGyroJerkMag_std")
ytest <- read.table("y_test.txt", sep = "", col.name = "activity")
ytest[ytest == 1] <- "Walking"
ytest[ytest == 2] <- "Walking_Upstairs"
ytest[ytest == 3] <- "Walking_Downstairs"
ytest[ytest == 4] <- "Sitting"
ytest[ytest == 5] <- "Standing"
ytest[ytest == 6] <- "Laying"
setwd("../train")  
subjecttrain <- read.table("subject_train.txt", sep = " ", stringsAsFactors = FALSE, col.name = "subjectID") 
xtrain <- read.table("X_train.txt", sep = "") 
xtrain <- xtrain[, c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266:271, 345:350, 424:429, 503, 504, 516, 517, 529, 530, 542, 543)]
names(xtrain) <- c("tBodyAcc_meanx", "tBodyAcc_meany", "tBodyAcc_meanz", "tBodyAcc_stdx", "tBodyAcc_stdy", "tBodyAcc_stdz", "tGravityAcc_meanx", "tGravityAcc_meany", "tGravityAcc_meanz", "tGravityAcc_stdx", "tGravityAcc_stdy", "tGravityAcc_stdz", "tBodyAccJerk_meanx", "tBodyAccJerk_meany", "tBodyAccJerk_meanz", "tBodyAccJerk_stdx", "tBodyAccJerk_stdy", "tBodyAccJerk_stdz", "tBodyGyro_meanx", "tBodyGyro_meany", "tBodyGyro_meanz", "tBodyGyro_stdx", "tBodyGyro_stdy", "tBodyGyro_stdz", "tBodyGyroJerk_meanx", "tBodyGyroJerk_meany", "tBodyGyroJerk_meanz", "tBodyGyroJerk_stdx", "tBodyGyroJerk_stdy", "tBodyGyroJerk_stdz", "tBodyAccMag_mean", "tBodyAccMag_std", "tGravityAccMag_mean", "tGravityAccMag_std", "tBodyAccJerkMag_mean", "tBodyAccJerkMag_std", "tBodyGyroMag_mean", "tBodyGyroMag_std", "tBodyGyroJerkMag_mean", "tBodyGyroJerkMag_std", "fBodyAcc_meanx", "fBodyAcc_meany", "fBodyAcc_meanz", "fBodyAcc_stdx", "fBodyAcc_stdy", "fBodyAcc_stdz", "fBodyAccJerk_meanx", "fBodyAccJerk_meany", "fBodyAccJerk_meanz", "fBodyAccJerk_stdx", "fBodyAccJerk_stdy", "fBodyAccJerk_stdz", "fBodyGyro_meanx", "fBodyGyro_meany", "fBodyGyro_meanz", "fBodyGyro_stdx", "fBodyGyro_stdy", "fBodyGyro_stdz", "fBodyAccMag_mean", "fBodyAccMag_std", "fBodyBodyAccJerkMag_mean", "fBodyBodyAccJerkMag_std", "fBodyBodyGyroMag_mean", "fBodyBodyGyroMag_std", "fBodyBodyGyroJerkMag_mean", "fBodyBodyGyroJerkMag_std")
ytrain <- read.table("y_train.txt", sep = "", col.names = "activity")
ytrain[ytrain == 1] <- "Walking"
ytrain[ytrain == 2] <- "Walking_Upstairs"
ytrain[ytrain == 3] <- "Walking_Downstairs"
ytrain[ytrain == 4] <- "Sitting"
ytrain[ytrain == 5] <- "Standing"
ytrain[ytrain == 6] <- "Laying"
alltest <- cbind(subjecttest, ytest, xtest)
alltrain <- cbind(subjecttrain, ytrain, xtrain)
alldata <- rbind(alltest, alltrain)
install.packages("reshape2")
library(reshape2)
variables <- names(alldata[, 3:68])
meanfeatures <- dcast(alldata, subjectID + activity ~ variables, mean)
 
```
