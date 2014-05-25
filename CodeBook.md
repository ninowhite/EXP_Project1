CodeBook for Course Project Getting and Cleaning Data
--------------------------------------------------------------------------------

The variables involved in final output of this course project are as below and are a subset of the total variables included in the features.txt file provided in the original zip file. Excluding variables subjectID and activities the other variables are either a mean or standard deviation from the total 561 variables from the features.txt file
 
## Variables:
- subjectID 
- activity
- tBodyAcc_meanx
- tBodyAcc_meany
- tBodyAcc_meanz
- tBodyAcc_stdx
- tBodyAcc_stdy
- tBodyAcc_stdz
- tGravityAcc_meanx
- tGravityAcc_meany
- tGravityAcc_meanz
- tGravityAcc_stdx
- tGravityAcc_stdy
- tGravityAcc_stdz
- tBodyAccJerk_meanx
- tBodyAccJerk_meany
- tBodyAccJerk_meanz
- tBodyAccJerk_stdx
- tBodyAccJerk_stdy
- tBodyAccJerk_stdz
- tBodyGyro_meanx
- tBodyGyro_meany
- tBodyGyro_meanz
- tBodyGyro_stdx
- tBodyGyro_stdy
- tBodyGyro_stdz
- tBodyGyroJerk_meanx
- tBodyGyroJerk_meany
- tBodyGyroJerk_meanz
- tBodyGyroJerk_stdx
- tBodyGyroJerk_stdy
- tBodyGyroJerk_stdz
- tBodyAccMag_mean
- tBodyAccMag_std
- tGravityAccMag_mean
- tGravityAccMag_std
- tBodyAccJerkMag_mean
- tBodyAccJerkMag_std
- tBodyGyroMag_mean
- tBodyGyroMag_std
- tBodyGyroJerkMag_mean
- tBodyGyroJerkMag_std
- fBodyAcc_meanx
- fBodyAcc_meany
- fBodyAcc_meanz
- fBodyAcc_stdx
- fBodyAcc_stdy
- fBodyAcc_stdz
- fBodyAccJerk_meanx
- fBodyAccJerk_meany
- fBodyAccJerk_meanz
- fBodyAccJerk_stdx
- fBodyAccJerk_stdy
- fBodyAccJerk_stdz
- fBodyGyro_meanx
- fBodyGyro_meany
- fBodyGyro_meanz
- fBodyGyro_stdx
- fBodyGyro_stdy
- fBodyGyro_stdz
- fBodyAccMag_mean
- fBodyAccMag_std
- fBodyBodyAccJerkMag_mean
- fBodyBodyAccJerkMag_std
- fBodyBodyGyroMag_mean
- fBodyBodyGyroMag_std
- fBodyBodyGyroJerkMag_mean
- fBodyBodyGyroJerkMag_std

Note: Excluding subjectID and activity the variable names follow similar logic as described:
- lowecaser t or f depdning on if time or frequency of measurement
- the feature (i.e. BoddyAcc) with capital letters for the beginning of each new abbreviation (ex. **B**ody**A**cc**M**ag)
- an underscore ( _ ); This symbol is not generally used in variable names but since most of these variable names are quite long I felt this helps breks up the feature and the value 
- mean or std; each of the variable names are either a value of a mean or std from the original dataset
- lowercase axial signal (x,y,z); axial signal will not apply to all variables and in those cases do not include (x,y,z)

## Process:
**A high level view of the process of creating the final tidy datset is below. Detailed instructions and code are included in the ReadMe file**
- read in features.txt file to see whole population of variable names; file will determine how to subset for mean and std
- read in activity_labels.txt file (i.e. Walking, Sitting, etc)

**Steps below are applied to both the test and train files in the same way**
- read in subject_test.txt file and name single column "subjectID"
- read in X_test.txt file 
- subset X_test file to the columns including a value of a mean or std, determine the columns using the feature names from the feature.txt file 
- using the names() function name the variables of the subset of mean and std columns, I personally wrote out the variable names into the table but an import of the same subset of the featuers.txt file would also work (the import process will include a few other functions/steps to clean up and format the variable names)
- read in y_test.txt file and name the single column "activity"
- exchange the values in y with the corresponding activity (i.e. 1 = Walking, 2= Walking_Downstairs, etc)

**Repeat above steps for train files**
- use cbind() function to combine the test_subject, ytest, and xtest data
- use cbind() function to combine the train_subject, ytrain, and ytrain data
- use rbind() function to combine the two cbind() tables of test and train data
- install and activiate reshape2 package
- create a variable from your data set that includes the names of the columns you want to mean for the tide data set (i.e. all columns except subjectID and activity)
- use dcast function to get the mean of the features grouping by subjectID and activity

## Result: 

The above steps result in a tidy subset of the means of the features grouped by each subject and each activity