library(dplyr)

## run_analysis: function to tidy the data for Human_Activity_Recognition
## input:   folder: folder name for the tidy process, default is 
##          "./Human_Activity_Recognition"
##          fileUrl: URL for data to be processed.
## output:  data frames for merged data, 

run_analysis <- function(
  folder = "./Human_Activity_Recognition",
  fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"){ 
  
  ## create and change the working directory for the function
  if (!dir.exists(folder)){
    dir.create(folder)
  }
  setwd(folder)
  
  ## download the data file for tidy  
  
  download.file(fileUrl, "Dataset.zip")
  unzip("Dataset.zip")
  
  ## read the variable name of the data X (features) and data y (activity)
  features <- read.csv("./UCI HAR Dataset/features.txt", header=FALSE, sep="")
  activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt", 
                              header=FALSE, sep="")
  
  
  ## read the test data
  X_test <- read.csv("UCI HAR Dataset/test/X_test.txt", header=FALSE,sep="")
  y_test <- read.csv("UCI HAR Dataset/test/y_test.txt", header=FALSE,sep="")
  subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt", 
                           header=FALSE,sep="")
  
  ## read the train data
  X_train <- read.csv("UCI HAR Dataset/train/X_train.txt", header=FALSE,sep="")
  y_train <- read.csv("UCI HAR Dataset/train/y_train.txt", header=FALSE,sep="")
  subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt", 
                            header=FALSE,sep="")
  
  
  ## task 1: Merges the training and the test sets to create one data set.
  ## merging the test data and training data 
  X_merged <- rbind.data.frame(X_test,X_train)
  y_merged <- rbind.data.frame(y_test,y_train)
  subject_merged <- rbind.data.frame(subject_test,subject_train)
  
  ## task 4: Appropriately labels the data set with descriptive variable names. 
  ## rename the variables from the features vector.
  names(X_merged) <- features$V2
  names(subject_merged) <- c("subject")

  ## task 3: Uses descriptive activity names to name the activities in the data
  ##         set
  ## update the activity
  act <- activity_labels$V2
  y_merged <- y_merged %>% mutate(activity = act[V1]) %>% select(activity)
  
  ## column combine the subject, activity and measurement data ( left to right )
  mergedData <- cbind(subject_merged,y_merged, X_merged)
  
  ## task 2:  Extracts only the measurements on the mean and standard
  ##          deviation for each measurement. 
  ## use the regexp to extract mean, std variables and also subject and activity.
  mergedData <- mergedData[, 
                            regexpr("^subject$|^activity$|mean[(][)]|std[(][)]",
                                    names(mergedData)
                                    ) > 0]

  
  
  ## go back parent directory
  setwd("../")
  
  ##return the merged dataset
  mergedData
  
}

