## Course Project Getting and Cleaning Data
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

