# Author: Collin Mitchell
# Date: 2016 January 27th
# Name: Run_Analysis.R
################################################

## Notes:
# Final Result will be a list:
#   Subject1
#     $BodyAccelerationX
#     $BodyAccelerationY
#     $BodyAccelerationZ
#     $Walking
#     $WalkingUpStairs
#     $WalkingDownstairs
#     $Sitting
#     $Standing
#     $Laying
#   Subject2
#     $BodyAccelerationX
#     $BodyAccelerationY
#     $BodyAccelerationZ
#     ...
#   Date
#     Val
#-------------------------------
#
# - Activity Labels |] Found in y_[type].txt
# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING

#--------------------------------
#
# Subject |] Found in x_[type].txt
# Range 1-30


###-------------
# Initial Setup|
#---------------

###---------
# Libraries|
#-----------
library(dplyr)


###---------
# Variables|
#-----------
timestamp <- Sys.Date()
dataUrl   <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file.dir  <- "./data"
completePath <- paste(file.dir, "/data.zip", sep = "")



patternList <- c("body_acc_x", "body_acc_y", "body_acc_z", "body_gyro_x", "body_gyro_y", "body_gyro_z",
                 "total_acc_x", "total_acc_y", "total_acc_z")


# Prepare environment for data and get data.
if(!file.exists(file.dir)){ dir.create("./data")}

# Extract Data:
download.file(dataUrl, destfile = completePath)
filename <- unzip(completePath, exdir=file.dir)

# Stub
Results = list()

###------------------------------
# Merge training and test set.  |
#--------------------------------




###---------
# Functions|
#-----------

## -> selects target file, reads it, then returns as data frame
readFileData <- function(targetfile){
  fwfPattern <- rep(c(-2, 14), times = 128)
  df = read.fwf(targetFile, fwfPattern)
  return(df)
}


####
# -> Read Single Column data
readSingleColumn <- function(targetFile){
  return(read.fwf(targetFile, c(1)))
}

####
# -> Returns the indexes of the matching files from both folders
returnIndexes <- function(){
  indexes = data.frame()
  for(pattern in patternList){
    indexes <- rbind(indexes, grep(pattern, files.list))
  }
  print(indexes)
}


####
# -> Collect Data, bind on column per subject, and then return the data frame.
mergeData <- function(){
  # stub
}


###----------
# Begin Work
#-----------

## collect file's list
files.list <- list.files(recursive = TRUE)
files <- strsplit(files.list, split = "/")

## pull out unique file endings
uniqueList <- vector()
for(counter in 1:length(files)){
  if(!is.na(files[[counter]][5]))
    uniqueList <- c(uniqueList, unique(files[[counter]][5]))
}

grep("body_acc_x", uniqueList)

# 2] Extract only mean and standard dev details.

# 3] Uses descriptive activity names to name the activities in the data set

# 4] Rename variables with useful names

# 5] Create a tidy data set


# explore: