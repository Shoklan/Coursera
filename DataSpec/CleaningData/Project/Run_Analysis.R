# Author: Collin Mitchell
# Date: 2016 January 31th
# Name: Run_Analysis.R
################################################

###---------
# Libraries|
#----------- 
library(dplyr)

###---------
# Variables|
#-----------
# Final List as well as Date of running
Results = list("Date" = Sys.Date())

# Offsite location
dataUrl   <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# local dirs
file.dir  <- "./data"
completePath <- paste(file.dir, "/data.zip", sep = "")

# Try not to do this, but it works for now
testDataFile = "data/UCI HAR Dataset/test/X_test.txt"
testActivityFile = "data/UCI HAR Dataset/test/y_test.txt"
testSubjectFile = "data/UCI HAR Dataset/test/subject_test.txt"

## Train file locations
trainDataFile = "data/UCI HAR Dataset/train/X_train.txt"
trainActivityFile = "data/UCI HAR Dataset/train/y_train.txt"
trainSubjectFile = "data/UCI HAR Dataset/train/subject_train.txt"

# filtering files based on these attributes
patternList <- c("body_acc_x", "body_acc_y", "body_acc_z", "body_gyro_x", "body_gyro_y", "body_gyro_z",
                 "total_acc_x", "total_acc_y", "total_acc_z")

# Fixed names for finalized List of extra data
sublistNames = c("BodyAccX", "BodyAccY", "BodyAccZ",
                 "BodyGyroX", "BodyGyroY", "BodyGyroZ",
                 "TotalAccX", "TotalAccY", "TotalAccZ")

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
  return(read.fwf(targetFile, c(2)))
}

####
# -> Returns the indexes of the matching files from both folders
returnIndexes <- function(){
  df = data.frame()
  for(pattern in patternList){
    df <- rbind(df, grep(pattern, files.list))
  }
  return(df)
}

####
# -> Collect Data, bind on column per subject, and then return the data frame.
mergeDataFiles <- function(dataFile, activityFile, subjectFile){
  activityData = readSingleColumn(activityFile)
  colnames(activityData) <- "activity"
  
  subjectData = readSingleColumn(subjectFile)
  colnames(subjectData) <- "subject"
  
  data = readFileData(dataFile)
  return(cbind(subjectData, activityData, data))
}

####
# -> Collect information from the other folders that
# -> Are not needed for the assignment but I did anyways
compileExtraData <- function(){
  
  # since the file list is sorted alphabetically by default,
  # I don't have to worry about ordering it.
  #Test  = list(blank = 1:128)
  Test  = list()
  Train = list()
  transfer = list()
  for(n in 1:nrow(indexCollection)){
  
    # read data
    testTemp  = readFileData( files.list[indexCollection[n,1]] )
    trainTemp = readFileData( files.list[indexCollection[n,2]] )
    
    # assign data
    Test[[sublistNames[n]]] = testTemp
    Train[[sublistNames[n]]] = trainTemp
  }
  
  # collect and pass data
  transfer$Test = Test
  transfer$Train = Train
  return(transfer)
}

# This can be used for both the mean or the standard dev.
compileStat <- function(data, statFunc){
  return(sapply(data, statFunc))
}

###----------
# MAIN
#-----------
# Prepare environment for data
if(!file.exists(file.dir)){ dir.create("./data")}

# Extract Data:
#download.file(dataUrl, destfile = completePath)
#filename <- unzip(completePath, exdir=file.dir)

## collect file's list
files.list <- list.files(recursive = TRUE)

# Get test and train data
testSet  = mergeDataFiles(testDataFile, testActivityFile, testSubjectFile)
trainSet = mergeDataFiles(trainDataFile, trainActivityFile, trainSubjectFile)

# combine the two data frames.
limit = ncol(testSet)
data = data.frame(c(testSet[,1], trainSet[,1]))
for(n in 2:limit)
  data = cbind(data, c(testSet[,n], trainSet[,n]))


# adjust the labels and store in Results List.
column.names = c("subject", "activity", paste(rep("sample", 128), 1:128, sep = ""))
colnames(data) <- column.names

# combining data destroys column names, so remaking.
data$activity = factor(data$activity, levels = c(1,2,3,4,5,6),
                       labels = c("walking", "WalkingUpstairs", "walkingDownstairs", "sitting", "standing", "laying"))

# Store data in Results.
Results$Data = data

# collect the important requested stats.
Results$DataMean <- mean( compileStat(Results$Data[c(-1,-2)], mean) )
Results$DataSD   <- mean( compileStat(Results$Data[c(-1,-2)], sd) )

# get indexes
indexCollection <- returnIndexes()

# Going above and beyond
# Grabbing data from the other folders not required
# for the project
catch = list()
catch = compileExtraData()

# collect results
Results$Test = catch$Test
Results$Train = catch$Train

# Create tidy data set
Tidy = list()
for(action in unique(Results$Data$activity)){
  Tidy[action] <- mean(compileStat(filter(Results$Data, activity == action)[c(-1,-2)], mean))
}

for(subject in unique(Results$Data$subject)){
  Tidy[paste("subject", subject, sep = "")] <- mean(compileStat(filter(Results$Data, subject == subject)[c(-1,-2)], mean))
}
# Collect tidy data frame
Results$Tidy = Tidy

# Dump everything but the results from memory
# rm(list = (ls()[ -(grep("Results", ls())) ]))