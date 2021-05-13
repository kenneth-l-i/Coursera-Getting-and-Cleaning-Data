library(dplyr)

## main function to tidy the data for Human_Activity_Recognition

tidy <- function(folder = "./Human_Activity_Recognition"){ 
  
  ## create and change the working folder for the function
  if (!dir.exists(folder)){
    dir.create(folder)
  }
  setwd(folder)
  
  ## download the data file for tidy  
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "Dataset.zip")
  unzip("Dataset.zip")
  
  ## read the variable name of the data X (features) and data y (activity)
  features <- read.csv("./UCI HAR Dataset/features.txt", header=FALSE, sep="")
  activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt", header=FALSE, sep="")
  
  
  ## read the test data
  X_test <- read.csv("UCI HAR Dataset/test/X_test.txt", header=FALSE,sep="")
  y_test <- read.csv("UCI HAR Dataset/test/y_test.txt", header=FALSE,sep="")
  subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt", header=FALSE,sep="")
  
  ## read the train data
  X_train <- read.csv("UCI HAR Dataset/train/X_train.txt", header=FALSE,sep="")
  y_train <- read.csv("UCI HAR Dataset/train/y_train.txt", header=FALSE,sep="")
  subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt", header=FALSE,sep="")
  
  ## merging the test data and training data
  X_merged <- rbind.data.frame(X_test,X_train)
  y_merged <- rbind.data.frame(y_test,y_train)
  subject_merged <- rbind.data.frame(subject_test,subject_train)
  
  
  ## rename the variables 
  names(X_merged) <- features$V2
  names(subject_merged) <- c("subject")

  ## update the activity
  act <- activity_labels$V2
  y_merged <- y_merged %>% mutate(activity = act[V1]) %>% select(activity)
  
  
  ## combine the subject , activity and measurement data
  mergedData <<- cbind(subject_merged,y_merged, X_merged)
  mergedData <<- mergedData[, regexpr("^subject$|^activity$|mean[(][)]|std[(][)]",names(mergedData))>0]

  ## task5
  mergedDataAvg <<- mergedData %>% group_by(subject,activity) %>% summarise_all(mean)
  
  setwd("../")
  
}

