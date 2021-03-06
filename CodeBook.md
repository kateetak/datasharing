﻿CodeBook
====================

###Resulting data set
The resulting data set contains 81 columns and 180 rows.

The resulting data has the following structure:
- it includes the headers (first column)
- it does not include row names

###Variables
Following variables are included in the tidy data set:
* the subjects: a total of 30 subjects have been observed for this study, they are identified by a number (from 1 to 30)
* the activities: the observations have been collected while each subject was performing different activities. There are six activities, each one  has a descriptive name in the tidy data set, the full set of options is: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* the mean of the features: a set of 79 features observed on the subject when performing different activities. Each column is the mean of the values by subject and activity of a feature, for a description of the feature please refer to the study itself as the data have not been modified in their units or scale (the only transformation applied has been the calculation of the mean). The 79 features have been extracted from the original set of 561 by selecting only the ones containing a mean or a std value. ***Note***: meanFreq values have not been excluded

###NA values
The tidy data set does not contain any NA values.

###Summary choices made
The observation have been summarized by the subject and the activity, a total of 180 rows are available corresponding to 6 activities for every subject 30 (180 = 30 * 6).

###Transformations to the numerical data
The numerical observations have not been transformed in their units or scale. The 79 features have only been summarized by calculating their mean.

###Data clean up
============
The following changes have been applied to the data set in order to obtain the tidy data set:

####Data aggregation
The train and test data set have been aggregated in one data set.
As requested by the assignment, no variable has been added to keep track of the original type of observation (train or data).

Also the list subjects and activities have been merged accordingly.

####Column names
Each column has a descriptive label. The names have been obtained by removing the invalid characters (e.g. "-", ",", "(" and ")") included in the raw data and each column has a unique name.

The names of the columns have been modified to be completely lower case.

Further transformations have not been applied with the purpose of keeping the column names short. The naming convention applied to the column names is consistent and follows specific rules explained in the raw data set (see explanation below).

**Assumption: the column names containing "BodyBody" were in the data by mistake (i.e. they were not included in the features list documentation) and they have been modified to contain the word Body only ones.

####Categorical values
The values in the column for the activities have been transformed from their numerical value to a descriptive name (e.g. "WALKING" instead of 1)

####Units of the variables
As in the raw data, also in the tidy data the features have no units. The features in the raw data were already normalized by dividing by the range (by dividing the units by the same units, the units are cancelled)



The instruction script
====================
###Run_analysis.R
The full set of instructions used is available in the run_analysis.R script available in this github repository.

###Versions
The tidy data have been obtaining by running the script on a Windows 7 platform, using R version 3.1.0 (2014-04-10).

Study design
===========
*The following explanation has been sourced from the website where the package has been dowloaded and from the description in the data package itself*


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information:
For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 

### Feature Selection 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Notes: 
====================
- Features are normalized and bounded within [-1,1]
- The features have no units because they have been normalized (the data has been scaled by dividing by the range, and when you divide units by the same units, the units are cancelled.)
- Each feature vector is a row on the text file.

Reference website:
====================
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

License:
====================
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

