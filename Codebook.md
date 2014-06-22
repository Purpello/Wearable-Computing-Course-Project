Introduction
=
This code book describes the tidy data set produced for the course project for the "Getting and Cleaning Data" class offered by Coursera.  

Study design
=

Original Study
-
The [data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) downloaded for this homework assignment is referenced in the following paper: 

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. *Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine.* International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The README.txt file that accompanies the downloaded data explains in detail the design of the study that resulted in the  the downloaded data.  Below is an excerpt from that README file.
>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

Homework Assignment
-

Our script was supposed to:

* Merges the training and the test data sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Gives descriptive names to variables and activities in the data set.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

A detailed outline of the steps to achieve these goals can be found by following the annotated R script run_analysis.R which is in this repository and is also outlined in the README.md file for this repository.

Code book
=

Variables and Units
-
As mentioned above, the variables are described in great detail in the original data set.  They will be briefly reviewed here.

The collected data from the study included:

* ‘README.txt' A general description of the study and the variables.
- 'features_info.txt': Shows information about the variables used on the feature vector.
* ’features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- subject_train.txt and subject_test.txt: Each row identifies the subject who performed the activity for each window sample. 

- The data about participants ranges from 1 to 30. 
- Activity codes ranged from 1 to 6 and mapped to the test labels, which were text.
- The sensor data was “unit less” based on transformations from the original raw data.  It ranged from [-1 1] 

When the test and training data were merged, there were 10,299 observations on 561 variables.  We then selected the variables that had “-mean()” or “-std()” in the variable name (e.g. tBodyAcc-mean()-X).  This resulted in 66 movement variables in the merged data set (listed at the end of this file).  The participant and activity variables were added to this data set, resulting in 10,299 rows and 68 columns.  

How this data set is tidy
-
I used the definition of tidy provided in class to guide the creation of a tidy data set.

- Each observation forms a row.
- Each variable forms a column.
- Each table/file stores data about one kind of observation.

The paper by [Hadley Wickham](http://vita.had.co.nz/papers/tidy-data.pdf) was helpful in understanding the definition of tidy data. Despite that, it was still difficult to decide on the best tidy state for this data. It is important to have an understanding of the underlying data, which was difficult in this project. One "observation" was a single slice in time, during which all of the data was collected. Distinctions that could be made between measures include gyroscope and accelerometer, time and frequency, standard deviation and mean. Lacking a deep theoretical understanding of the data, I chose to make each of the 66 variables that were a mean or std its own column, resulting in 10,299 rows and 68 columns, which included a column each for Participant and Activity. To create the 2nd, independent data set mentioned in the assignment, I used melt and cast to create 180 rows with 68 columns.

66 movement variables in the tidy data set
-
1	tBodyAcc-mean()-X

2	tBodyAcc-mean()-Y

3	tBodyAcc-mean()-Z

4	tBodyAcc-std()-X

5	tBodyAcc-std()-Y

6	tBodyAcc-std()-Z

7	tGravityAcc-mean()-X

8	tGravityAcc-mean()-Y

9	tGravityAcc-mean()-Z

10	tGravityAcc-std()-X

11	tGravityAcc-std()-Y

12	tGravityAcc-std()-Z

13	tBodyAccJerk-mean()-X

14	tBodyAccJerk-mean()-Y

15	tBodyAccJerk-mean()-Z

16	tBodyAccJerk-std()-X

17	tBodyAccJerk-std()-Y

18	tBodyAccJerk-std()-Z

19	tBodyGyro-mean()-X

20	tBodyGyro-mean()-Y

21	tBodyGyro-mean()-Z

22	tBodyGyro-std()-X

23	tBodyGyro-std()-Y

24	tBodyGyro-std()-Z

25	tBodyGyroJerk-mean()-X

26	tBodyGyroJerk-mean()-Y

27	tBodyGyroJerk-mean()-Z

28	tBodyGyroJerk-std()-X

29	tBodyGyroJerk-std()-Y

30	tBodyGyroJerk-std()-Z

31	tBodyAccMag-mean()

32	tBodyAccMag-std()

33	tGravityAccMag-mean()

34	tGravityAccMag-std()

35	tBodyAccJerkMag-mean()

36	tBodyAccJerkMag-std()

37	tBodyGyroMag-mean()

38	tBodyGyroMag-std()

39	tBodyGyroJerkMag-mean()

40	tBodyGyroJerkMag-std()

41	fBodyAcc-mean()-X

42	fBodyAcc-mean()-Y

43	fBodyAcc-mean()-Z

44	fBodyAcc-std()-X

45	fBodyAcc-std()-Y

46	fBodyAcc-std()-Z

47	fBodyAccJerk-mean()-X

48	fBodyAccJerk-mean()-Y

49	fBodyAccJerk-mean()-Z

50	fBodyAccJerk-std()-X

51	fBodyAccJerk-std()-Y

52	fBodyAccJerk-std()-Z

53	fBodyGyro-mean()-X

54	fBodyGyro-mean()-Y

55	fBodyGyro-mean()-Z

56	fBodyGyro-std()-X

57	fBodyGyro-std()-Y

58	fBodyGyro-std()-Z

59	fBodyAccMag-mean()

60	fBodyAccMag-std()

61	fBodyBodyAccJerkMag-mean()

62	fBodyBodyAccJerkMag-std()

63	fBodyBodyGyroMag-mean()

64	fBodyBodyGyroMag-std()

65	fBodyBodyGyroJerkMag-mean()

66	fBodyBodyGyroJerkMag-std()
