Run analysis markdown
===========

The raw data
===========
The raw data can be accessed at the following url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data need to be downloaded locally on the workstation where the analysis is performed and they have to be made available (in their zipped form) in the same working directory of R.

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