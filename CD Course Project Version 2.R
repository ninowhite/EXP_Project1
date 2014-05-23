
## Course Project
## set directory to dataset UCI

#These are the variable names for the "xtest" and "ytest" csv's. 561 names for the 561 columns in those obervations.
Features <- read.table("features.txt", sep = " ", stringsAsFactors = FALSE) ## reads in features

#These are the activity labels for the 7 activities. i.e. 1's will be walking, 2's will be walking_upstars, etc.
activitylabels <- read.table("activity_labels.txt", sep = " ", stringsAsFactors = FALSE) ## reads in activities


setwd("test") ##updates directory

## This is each the subject ID for which subject was doing the things going on in each row.
subjecttest <- read.table("subject_test.txt", sep = " ", stringsAsFactors = FALSE) ## reads in subject
## I would give this a name now so it carries over in the cbind,rbind to a larger complete dataset.
colnames(subjecttest)
colnames(subjecttest)<- "SubjectID"

## These are what is going in each measurement for each row for each subject.
xtest <- read.table("X_test.txt", sep = "") ## reads in x_test data
## These currently have no names, just default names V1-V561.
colnames(xtest)
## But we have all of the names for these in the Features table read in earlier in the second column.
Features$V2
## We can directly move those names to from that Features table into the colnames of the xtest and overwrite the V1-V561 nonsense.
colnames(xtest) <- Features$V2
## Now all of the colnames for the xtest are overwritten with the of the names from the Feature table
colnames(xtest)
View(xtest)
str(xtest)
## do this for xtest and later the same thing for ytest so they are all labeled correctly before combining into a complete set of both so it will keep the names.


## This is the activity they were doing. 1-7. The number-to-label names are in the activity labels. You'll want to replace each number with the appropriate names. i.e. 1's will be walking, 2's will be walking_upstars, etc. This can be now, for each test and train set, or after they combined into a giatn set.
ytest <- read.table("y_test.txt", sep = "") ## reads in y_test data
## I would give this a name now so it carries over in the cbind,rbind to a larger complete dataset.
colnames(ytest)
colnames(ytest)<- "Activity"
colnames(ytest)

## Each of these has 2947 rows. I would cbind all of these together here into a complete "test" dataset. Then do the same for the "train" dataset next. Once there are two complete test and train sets, rbind them into one giant set. That way it was all of the columns needed. 
alltest<- data.frame( subjecttest, xtest, ytest)
names(alltest) ## Now all the names we applied earlier to parts stay in place as we combine into one large test set. Same kind of processes for the train set, and all colnames will be in place already. Then combine those two large test and train sets into one large complete set.


setwd("..") ## Updates directory
setwd("train") ## updates directory

## 7352 rows identifying which subject ID was doing the stuff in each row.
subjecttrain <- read.table("subject_train.txt", sep = " ", stringsAsFactors = FALSE) ## reads in subject_train
## The different measurements each subject ID was being measured on for each of those rows. 
xtrain <- read.table("X_train.txt", sep = "") ##reads in x_train data
## The number of each activity being done in that row. These numbers correspond to the activity being done. 1 for walking, etc. Numbers to be replaced with the activity name. This can be done either before or after combining into a complete dataset but if done before, it has to be done (once for test set and once for training set).
ytrain <- read.table("y_train.txt", sep = "") ## reads in y_train data
## This is where I would combine all 3 train pieces(activities, 561 measurement variables, subject ID's) with cbind. Once there are two complete test and train sets, rbind them into one giant set. That way it was all of the columns needed. 
## some thing like:
## totalset<- rbind(test, train) Not sure which would come first in the rbind?

## Then from here, you can more easily find the colnames with mean and std for mean and standard deviation and subset out those columns, along with the activity and subjectID columns for a totalset of just the columns relevent to you.



#Here is where rbind would put both of those test and train complete sets into one giant complete set.
# totalset<- rbind(test, train)

xobservations <- rbind(xtest, xtrain) ## combines xtest and ytest data
yobservations <- rbind(ytest, ytrain) ## combines xtrain and ytrain data


# At this point the Features would already be names in the dataset. Changes to those names would made the colnames(totalset) vector of names.
features <- tolower(Features) ## lowwers case variables in features...data gets messed up here
features1 <- sub("\\()", "", features) ## guesses
features2 <- gsub("\.", "", features1) ## guesses

# For me to load on my pc to follow along.
setwd("C:/Users/fch80_000/Dropbox/~Coursera/DataScienceSpec/Getting-and-Cleaning-Data/Week-3")
setwd("UCI HAR Dataset")
