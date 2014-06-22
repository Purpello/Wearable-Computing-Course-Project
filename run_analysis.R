#This script performs the analyses specified in the 
#Course Project for the Getting and Cleaning Data class offered by Coursera.
#
#Assumptions
# 1) It assumes that you have downloaded the data files for the home work assignment
#    and that your working directory contains the folder "UCI HAR Dataset" which 
#    is created when you unzip the file you downloaded.  
#    The URL to download the data is: 
#    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# 2) It assumes that you have installed the packages data.table and reshape2.

#The script does the following:
#
# 1) Merges the training and the test sets to create one data set called 
#
# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
#
# 3) Gives descriptive names to variables and activities in the data set.
#
# 4) Creates a second, independent tidy data set with the average of each variable 
#    for each activity and each subject.
#
# Comments in the code describe the steps in more detail.

library(data.table) 
library(reshape2)

#Get human-readable variable names from a file
variable_names_all<-fread("./UCI HAR Dataset/features.txt")

#Subset the variable names to the ones we'll be using.
#We want variables that contain one of two strings that could occur anywhere in the variable name.
# '-mean()' or '-std()' 
# These are means and standard deviations, respectively.
# One of these has actual values and the other has logical values, which we'll use later
# to select columns from the data.
variable_names<-grep("[-]mean[()]|std[()]",variable_names_all$V2, value=TRUE)
variable_names_logical<-grep("[-]mean[()]|std[()]",variable_names_all$V2)

#Get experiment participant (subject) labels for training and test data sets
subject_training<-fread("./UCI HAR Dataset/train/subject_train.txt")
subject_test<-fread("./UCI HAR Dataset/test/subject_test.txt")

#Get the human-readable labels for the activity codes.
activity_labels<-fread("./UCI HAR Dataset/activity_labels.txt")

#Get numeric activity codes for the training and test data sets.
#Replace numerical values with human-readable values.
training_activity_codes<-fread("./UCI HAR Dataset/train/y_train.txt")
training_activity_codes$V1[training_activity_codes$V1==1]<-activity_labels$V2[1]
training_activity_codes$V1[training_activity_codes$V1==2]<-activity_labels$V2[2]
training_activity_codes$V1[training_activity_codes$V1==3]<-activity_labels$V2[3]
training_activity_codes$V1[training_activity_codes$V1==4]<-activity_labels$V2[4]
training_activity_codes$V1[training_activity_codes$V1==5]<-activity_labels$V2[5]
training_activity_codes$V1[training_activity_codes$V1==6]<-activity_labels$V2[6]

test_activity_codes<-fread("./UCI HAR Dataset/test/y_test.txt")
test_activity_codes$V1[test_activity_codes$V1==1]<-activity_labels$V2[1]
test_activity_codes$V1[test_activity_codes$V1==2]<-activity_labels$V2[2]
test_activity_codes$V1[test_activity_codes$V1==3]<-activity_labels$V2[3]
test_activity_codes$V1[test_activity_codes$V1==4]<-activity_labels$V2[4]
test_activity_codes$V1[test_activity_codes$V1==5]<-activity_labels$V2[5]
test_activity_codes$V1[test_activity_codes$V1==6]<-activity_labels$V2[6]

#Get the training and test data sets.
tcon<-file("./UCI HAR Dataset/train/X_train.txt","r")
training_data<-readLines(tcon)
close(tcon)

tcon<-file("./UCI HAR Dataset/test/X_test.txt","r")
test_data<-readLines(tcon)
close(tcon)

#The data was read in as one big character string for each line.  
#So, we need to split that based on white space using the regex \\s+
training_data<-strsplit(training_data,"\\s+")
test_data<-strsplit(test_data,"\\s+")

#The data is now a list.  Let's convert to a data frame.
training_data<-data.frame(matrix(as.numeric(unlist(training_data)), nrow=length(training_data), byrow=T),stringsAsFactors=FALSE)
test_data<-data.frame(matrix(as.numeric(unlist(test_data)), nrow=length(test_data), byrow=T),stringsAsFactors=FALSE)

#drop the first column because it's junk.
training_data<-training_data[,-1]
test_data<-test_data[,-1]

#select just the columns we want using the logical data we created earlier.
training_data<-training_data[,variable_names_logical]
test_data<-test_data[,variable_names_logical]

#assign the variable names to the data frame as column names
setnames(training_data,variable_names)
setnames(test_data,variable_names)

#make data tables so we can do more.
training_data<-data.table(training_data)
test_data<-data.table(test_data)

#add the subject and activity columns to the data
training_data<-cbind(subject_training$V1,training_activity_codes$V1,training_data)
setnames(training_data,1:2,c("Participant","Activity"))

test_data<-cbind(subject_test$V1,test_activity_codes$V1,test_data)
setnames(test_data,1:2,c("Participant","Activity"))

#combine the training and test data sets. Write out the data as the tidy data set.
all_data<-rbind(training_data,test_data)
write.table(all_data, "./tidy_data.txt", sep="\t")

#The second independent data set is created by melting and casting the tidy data.
melted_data<-melt(all_data,id=c("Participant","Activity"))
summarized_mean_data<-dcast(melted_data, Participant + Activity ~ variable, mean)
