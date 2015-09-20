# Author: Collin Mitchell
# Date: September 19, 2015
# Name: CleaningProject.R

# Submit:
##     Tiny Data
##     Github Link.
##     Codebook
################################################

###
# Variables

dataUrl   <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file.dir  <- "./data"
targetDir1 <- "./data/UCI HAR Dataset/test/"
targetDir2 <- "./data/UCI HAR Dataset/train/"
subDir     <- "Inertial Signals"


completepath <- paste(file.dir, "/data.zip", sep = "")


# Prepare environment for data and get data.
if(!file.exists(file.dir)){ dir.create("./data")}

# Extract Data:
download.file(dataUrl, destfile = completepath)
filename <- unzip(completepath, exdir=file.dir)

# 1] Merge training and test set.


# 2] Extract only mean and standard dev details.

# 3] Uses descriptive activity names to name the activities in the data set

# 4] Rename variables with useful names

# 5] Create a tidy data set


# explore: