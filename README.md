---
title: "Tidy Data for Human Activity Recognition Using Smartphones Data Set"
author: "Kenneth Li"
date: "2021/5/13"
output: html_document
---
# Tidy Data for Human Activity Recognition Using Smartphones Data Set



## Background Information

One of the most exciting areas in all of data science right now is wearable computing . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

## Source of data for analysis

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


## Purpose of this project

The R script called run_analysis.R that does the following.

1.  Merges the training and the test sets to create one data set.

2.  Extracts only the measurements on the mean and standard deviation for each measurement.

3.  Uses descriptive activity names to name the activities in the data set

4.  Appropriately labels the data set with descriptive variable names.

5.  From the data set above, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## R prerequisite
1. dplyr

## Workflow in run_analysis.R

1.  Create a new directory and set it as working directory.
2.  Download and unzip data file from the source.
3.  Read the CSV file (features, activity, X Y Subject of test and train data set).
4.  Merge the test and train data set.
5.  Rename the variable name (features).
6.  Update the activities name for each observation.
7.  Add the subjects and activities before each observation.
8.  Select the subjects, activities, mean, std of each observation.
9.  Go back to the parent directory and return the data frame.


