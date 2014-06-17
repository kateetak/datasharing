Run analysis Readme
===========

What is it?
===========
An R program to transform a raw data set in a clean one.

The raw data
===========
The raw data can be accessed at the following url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data need to be downloaded locally on the workstation where the analysis is performed and they have to be made available (in their zipped form) in the same working directory of R.

The script will take care of unzipping the necessary files, the unzipped files will be extracted in the working directory of R in the "UCI HAR Dataset" folder.

Prerequisites
===========
Following prerequisites have to be observed before running the R programm:
- the raw data have to be available in the current working directory of R
- the following libraries have to be installed: plyr, reshape2

How to run the analysis
===========
There is one single script required for the analysis.

The script is called run_analysis.R and can be run with the following command:
obs <- run_analysis.R

After it has been sourced using the source command:
source("run_analysis.R")

What is returned by the analysis
===========
At the end of the analysis a file, called "analysis_result.txt", is written to the working directory of R.

The file is added to the same directory where the raw data are available.

This is the same file that has been uploaded as the "tidy data set".

The script also returns the data.frame written to the file.

How is the script organized?
===========
In the script there are more than one functions, each one is used for this analysis. From an high level point of view, the code has been organized so that each step mentioned in the assignement is performed by a separate function.

The functions used are:
* run_analysis: the main function
* step1: returns the expected outcome of the step1 in the assignement
* step2: returns the expected outcome of the step2 in the assignement
* step3: returns the expected outcome of the step3 in the assignement
* step4: returns the expected outcome of the step4 in the assignement
* step5: returns the expected outcome of the step5 in the assignement
* listfeatureindexes: returns the indexes of the list of features matching mean or std

These are the five steps from the assignment's description:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Changelog:
====================
v1.0 - built on 2014.06.17 for the Coursera "Getting and Cleaning Data" project

License:
====================
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


Use of the script requires to be aknowledged by refencing the kateetak github account.