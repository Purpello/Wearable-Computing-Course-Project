Getting and cleaning data - Course-Project
=================================
This repository contains the R script (run_analysis.R) for the course project for the "Getting and Cleaning Data" class offered by Coursera. The output of the script is a tidy data set, created by merging two data sets (see more detail below).

Definition of Tidy:
-------------------
I used the definition of tidy provided in class to guide the creation of a tidy data set.
* Each observation forms a row.
* Each variable forms a column.
* Each table/file stores data about one kind of observation.

The paper by [Hadley Wickham] (http://vita.had.co.nz/papers/tidy-data.pdf "Tidy Data, in the Journal of Statistical Software") was also very helpful in understanding the definition of tidy data.  Despite that, it was still difficult to
decide on the best tidy state for this data.  It is important to have an understanding of the underlying data, which was difficult in this project.  One "observation" was a single slice in time, during which all of the data was collected. Distinctions that could be made between measures include gyroscope and accelerometer, time and frequency, standard deviation and mean.  Lacking a deep theoretical understanding of the data, I chose to make each of the 66 variables that were a mean or std its own column, resulting in 10,299 rows and 68 columns, which included a column each for Participant and Activity.  To create the 2nd, independent data set mentioned in the assignment, I used melt and cast to create 180 rows with 68 columns.

Assumptions:
-------------
1) You have downloaded the data files for the assignment
   and your working directory contains the folder "UCI HAR Dataset", 
   which is created when you unzip the file you downloaded.  
   The URL to download the data is: 
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
   
   The data set is referenced in the following paper:
   Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on         Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
   
2) You have installed the packages data.table and reshape2.

The R script, run_analysis.R, does the following:
-------------------------------------------------

1) Merges the training and the test data sets to create one data set.
   
2) Extracts only the measurements on the mean and standard deviation for each measurement.

3) Gives descriptive names to variables and activities in the data set.

4) Creates a second, independent tidy data set with the average of each variable 
   for each activity and each subject.

