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
completepath <- paste(file.dir, "/data.zip", sep = "")


# Prepare environment for data and get data.
if(!file.exists(file.dir)){ dir.create("./data")}

download.file(dataUrl, destfile = completepath)
filename <- unzip(completepath, exdir=file.dir)
data <- read.csv(filename)

