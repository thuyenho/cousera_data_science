---
title: "Course Project Getting and clearning data"
author: "Thuyen Ho"
date: "23/10/2015"
output:
  html_document:
    keep_md: yes
---
## Project Description

This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

###Collection of the raw data
* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Creating the tidy datafile

###Guide to create the tidy data file

[README.md](https://github.com/thuyenho/project2_getting_clearning_data_course/blob/master/README.md)

###Cleaning of the data

There are 5 parts:

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set.
 4. Appropriately labels the data set with descriptive activity names.
 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Description of the variables in the tiny_data.txt file
 * subject variable: identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
 * activity variable: each person performs activities

           1: Walking
           2: Walking upstairs
           3: Walking downstairs
           4: Sitting
           5: Standing
           6: Laying

 * remaining variables: the average of each variable for each activity and each subject.
