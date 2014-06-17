# the script assumes (as specified in the instructions) that the zipped dataset
# is available in the working directory

# the function writes a file in the working directory called "analysis_result.txt"
# and returns the data.frame written to the file

# Changelog: v1.0 - built on 2014.06.17 for the Coursera "Getting and Cleaning Data" project

run_analysis <- function() {
  # load the library required to perform the functions
  # merge (join) at step3
  # ddply at step5
  library(plyr)
  
  # load the library required to perform the function melt at step5
  library(reshape2)
  
  # ================ step1 ================
  # Merges the training and the test sets to create one data set.
  
  # obs is a data.frame of 10299 obs of 561 variable
  obs <- step1()
  
  #================ step2 ================
  # Extracts only the measurements on the mean and standard deviation for each measurement.
  
  # the full list of features, the indexes are excluded
  features <- (read.table("UCI HAR Dataset/features.txt")$V2)
  
  # only the measurements of the mean and the standard deviation are extracte
  # from the list of features
  colindexes <- listfeatureindexes(features)
  features <- features[colindexes]
  
  # obs is a data.frame of 10299 obs of 79 variable
  obs <- step2(obs, colindexes)
  
  #================ step3 ================
  # Uses descriptive activity names to name the activities in the data set
  
  # obs is a data.frame of 10299 obs of 80 variable
  obs <- step3(obs)
  
  #================ step4 ================
  # Appropriately labels the data set with descriptive variable names. 
  
  # obs is a data.frame of 10299 obs of 80 variable
  obs <- step4(obs, features)
  
  #================ step5 ================
  # Creates a second, independent tidy data set with the average of each variable 
  # for each activity and each subject. 
  
  # obs is a data.frame of 180 obs of 81 variable
  obs <- step5(obs)
}

step1 <- function(obs) {
  # list of files to be extracted                                     
  files <- c("UCI HAR Dataset/train/subject_train.txt",
             "UCI HAR Dataset/test/subject_test.txt",
             "UCI HAR Dataset/train/X_train.txt",
             "UCI HAR Dataset/test/X_test.txt",
             "UCI HAR Dataset/features.txt",
             "UCI HAR Dataset/train/y_train.txt",
             "UCI HAR Dataset/test/y_test.txt",
             "UCI HAR Dataset/activity_labels.txt")
  
  # unzip only the required files
  unzip("getdata_projectfiles_UCI HAR Dataset.zip", files = files)
  
  
  # load obs
  # the result is a data.frame of 10299 obs of 561 variable
  obs <- rbind(read.table("UCI HAR Dataset/train/X_train.txt"),
               read.table("UCI HAR Dataset/test/X_test.txt"))
}

step2 <- function(obs, colindexes) {
  # subset obs to contain only the obs about Mean or Std
  # the result is an array of 10299 obs of 81s variables
  obs <- obs[,colindexes]
}

step3 <- function(obs) {
  # load activities
  # the result is an array of 10299 obs of 1 variable
  activities <- rbind(read.table("UCI HAR Dataset/train/y_train.txt"),
                      read.table("UCI HAR Dataset/test/y_test.txt"))      
  
  # add a column name to the activities dataframe, this will be used for the merge (join)
  names(activities) <- c("activityid")
  
  # load activitylabels
  # the result is an array of 6 obs of 2 variable
  activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")
  # add a column name to the activitylabels dataframe, this will be used for the merge
  names(activitylabels) <- c("activityid", "activitylabel")
  
  
  # this is the list of activities with their corresponding labels
  # the merge function sorts the result by default
  
  # join is used to keep the original sorting on activities
  # the result is an array of 10299 obs of 2 variable
  activities <- join(activities, activitylabels)
  
  # the obs dataframe contains the descriptive name for the activities as the first column
  # the result is an array of 10299 obs of 80 variables
  obs <- cbind(activities$activitylabel, obs)
}

step4 <- function(obs, features) {
  # features contains the labels matching mean or std (only lower case)
  # calculated at Step2
  
  # all features column names are processed as follow
  # - they are transformed into lower case
  # - the special character -,() are removed
  # - the bodybody string has been replaced by body
  # I'm not using the make.names function because I also want to avoid "."
  # in the column names
  
  # the names of the columns are unique
  names(obs) <-  c("activitylabel",
                   paste(gsub("bodybody", "body", 
                              gsub("-|,|\\(|\\)", "", tolower(features)))))
  
  # I decided not to go to full proper English names to avoid long column names
  # I also followed what was explained here:
  # https://class.coursera.org/getdata-004/forum/thread?thread_id=106#comment-422
  
  # to check if the names are valid for the make.names function, I used the following code
  # the result of sum(a == b) is 79, which means that every value in a matches the value in b
  # as the length of a is 79
  
  obs
}

step5 <- function(obs) {
  # Creates a second, independent tidy data set with the average of each variable 
  # for each activity and each subject. 
  
  # add the subjects column
  # the result is an array of 10299 obs of 81 variables
  
  # load subjects
  # the result is an data.frame of 10299 obs of 1 variable
  
  obs <- cbind(rbind(read.table("UCI HAR Dataset/train/subject_train.txt"),
                     read.table("UCI HAR Dataset/test/subject_test.txt")),
               obs)
  
  # add the column name to the subjects column
  names(obs)[1] <- "subject"
  
  # this returns an data frame "tall and slim" 
  # of 813621 obs of 4 variables
  # the variables are subject, activitylabel, variable (e.g. tbodyaccmeanx), value
  # 813621 = 10299  * 79
  # where 10299 is the number of obs before the melt
  # and 79 the number of variables before the melt without the 2 ids (subject and activitylabel)
  
  # data.frame of subject/activity/variable/label
  obs <- melt(obs, id=c("subject", "activitylabel"))
  
  # each couple of subject & activity is described in each line
  # the values of the mean are avaialble as a column for every line
  obs <- dcast(obs, subject+activitylabel ~ variable, mean)
  
  write.table(obs, "./analysis_result.txt", row.names = FALSE)

  # return obs
  obs
}

listfeatureindexes <- function(features) {
  # the indexes of the columns for obs to be equal to the expected t of features
  
  # 79 columns match mean or std
  
  # only the columns containing exactly mean and std all lowercase are included
  # the columns where Mean is part of angle (e.g. angle(tBodyAccMean,gravity)) are excluded,
  # in all this cases (7 columns) mean is written with a capital M
  
  # the following code would be used to extract all features
  # (including the ones with M uppercase):
  # colindexes <- grep("[M|m][E|e][A|a][N|n]|[S|s][T|t][D|d]", features)
  
  colindexes <- grep("mean|std", features)
}

