# Author: Collin Mitchell
# Date: 2016 January 27th
# Name: Run_Analysis.R
################################################

## Notes:
# Final Result will be a list:
#   $Date
#   $Data
#   $Test
#     $BodyAccelerationX
#     $BodyAccelerationY
#     $BodyAccelerationZ
#     $Walking
#     $WalkingUpStairs
#     $WalkingDownstairs
#     $Sitting
#     $Standing
#     $Laying
#   $Train
#     $BodyAccelerationX
#     $BodyAccelerationY
#     $BodyAccelerationZ
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
  
  data = readFileData(dataFile)
  
  return(cbind(subjectData, activityData, data))
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

testDataFile = "data/UCI HAR Dataset/test/X_test.txt"
testActivityFile = "data/UCI HAR Dataset/test/y_test.txt"
testSubjectFile = "data/UCI HAR Dataset/test/subject_test.txt"

trainDataFile = "data/UCI HAR Dataset/train/X_train.txt"
trainActivityFile = "data/UCI HAR Dataset/train/y_train.txt"
trainSubjectFile = "data/UCI HAR Dataset/train/subject_train.txt"

testSet  = mergeDataFiles(testDataFile, testActivityFile, testSubjectFile)
trainSet = mergeDataFiles(trainDataFile, trainActivityFile, trainSubjectFile)

limit = ncol(testSet)
data = data.frame(c(testSet[,1], trainSet[,1]))
for(n in 2:limit)
  data = cbind(data, c(testSet[,n], trainSet[,n]))

column.names = c("subject", "activity", paste(rep("sample", 128), 1:128, sep = ""))
colnames(data) <- column.names
Results$Data = data

# 2] Extract only mean and standard dev details.


indexCollection = data.frame()
for(pattern in patternList){
  indexCollection <- rbind(indexCollection, grep(pattern, files.list))
}

# collect test

# collect train