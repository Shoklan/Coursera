# Author: Collin Mitchell
# Date: 2016 January 27th
# Name: Run_Analysis.R
################################################

## Notes:
# Final Result will be a list:
#   $DataSet
#   $Date
#   $Subject1
#     $BodyAccelerationX
#     $BodyAccelerationY
#     $BodyAccelerationZ
#     $Walking
#     $WalkingUpStairs
#     $WalkingDownstairs
#     $Sitting
#     $Standing
#     $Laying
#   $Subject2
#     $BodyAccelerationX
#     $BodyAccelerationY
#     $BodyAccelerationZ
#     ...
#-------------------------------

#--------------------------------
#
# Subject |] Found in x_[type].txt
# Range 1-30

#
# 
###---------
# Libraries|
#-----------
library(dplyr)
library(data.table)


###---------------------------------------
# Variables|
# Note: Globals are usually bad practice,
# and I'll convert them after.
#-----------------------------------------
Results = list("Date" = Sys.Date())
timestamp <- Sys.Date()
dataUrl   <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file.dir  <- "./data"
completePath <- paste(file.dir, "/data.zip", sep = "")



patternList <- c("body_acc_x", "body_acc_y", "body_acc_z", "body_gyro_x", "body_gyro_y", "body_gyro_z",
                 "total_acc_x", "total_acc_y", "total_acc_z")

###---------
# Functions|
#-----------
# -> Reads file, then returns as data frame
readFileData <- function(targetFile){
  fwfPattern <- rep(c(-2, 14), times = 128)
  df = read.fwf(targetFile, fwfPattern)
  return(df)
}


####
# -> Read Single Column data,
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

#### DELETE
# -> pull out unique file endings
#getUniqueList <- function(){
#  uniqueList <- vector()
#  for(counter in 1:length(files)){
#    if(!is.na(files[[counter]][5]))
#      uniqueList <- c(uniqueList, unique(files[[counter]][5]))
#  }
#  return(uniqueList)
#



####
# -> Collect Data, bind on column per subject, and then return the data frame.
mergeDataFiles <- function(dataFile, activityFile, subjectFile){
  activityData = readSingleColumn(activityFile)
  colnames(activityData) <- "activity"
  activityData$activity <- factor(activityData$activity, levels = c(1,2,3,4,5,6),
                            labels = c("walking", "WalkingUpstairs", "walkingDownstairs", "sitting", "standing", "laying"))
  
  
  subjectData = readSingleColumn(subjectFile)
  colnames(subjectData) <- "subject"
  
  dataFile = files.list[17]
  data = readFileData(dataFile)
  
  return(cbin(subjectData, activityData, data))
  
}

###----------
# Begin Work
#-----------

# Prepare environment for data and get data.
if(!file.exists(file.dir)){ dir.create("./data")}

# Extract Data:
download.file(dataUrl, destfile = completePath)
filename <- unzip(completePath, exdir=file.dir)

## collect file's list
files.list <- list.files(recursive = TRUE)
files <- strsplit(files.list, split = "/")
# DELETE: uniqueFileList <- getUniqueList()

# Vector locations that I want:
## Test set:
## -- Data    : 17
## -- Activity: 18
## -- Subject : 16

## Test set:
## -- Data    : 29
## -- Activity: 30
## -- Subject : 28

# - Activity Labels |] Found in y_[type].txt
# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING

# 2] Extract only mean and standard dev details.

testSet  = mergeDataFiles(files.list[17], files.list[18], files.list[17])
trainSet = mergeDataFiles(files.list[29], files.list[30], files.list[28])

limit = ncol(testSet)
# Results$Data = 