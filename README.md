Wearable-Computing-Course-Project
=================================
This repository contains the script for the course project for the "Getting and Cleaning Data" class offered by Coursera.  The R script, run_analysis.R, does the following:

1) It assumes that you have downloaded the data files for the home work assignment
   and that your working directory contains the folder "UCI HAR Dataset" which 
   is created when you unzip the file you downloaded.  
   The URL to download the data is: 
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
   
The data set is referenced in the following paper:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on   Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

2) Merges the training and the test sets to create one data set called 
   "Merged_Training_and_Test_Data".

3) Extracts only the measurements on the mean and standard deviation for each measurement.

4) Gives descriptive names to variables and activities in the data set.

5) Creates a second, independent tidy data set with the average of each variable 
   for each activity and each subject.

