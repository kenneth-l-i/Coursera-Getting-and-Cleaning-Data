---
title: "Human Activity Recognition Using Smartphones Data Set"
author: "Kenneth Li"
date: "2021/5/13"
output: html_document
---

## Background Information

One of the most exciting areas in all of data science right now is wearable computing . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

## Source of data for analysis

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

## Purpose of this project

The R script called run_analysis.R that does the following.

1.  Merges the training and the test sets to create one data set.

2.  Extracts only the measurements on the mean and standard deviation for each measurement.

3.  Uses descriptive activity names to name the activities in the data set

4.  Appropriately labels the data set with descriptive variable names.

5.  From the data set above, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Workflow in run_analysis.R

1.  Create a new directory and set it as working directory.
2.  Download and unzip data file from the source.
3.  Read the CSV file (features, activity, X Y Subject of test and train data set).
4.  Merge the test and train data set.
5.  Rename the variable name (features).
6.  Update the activit
