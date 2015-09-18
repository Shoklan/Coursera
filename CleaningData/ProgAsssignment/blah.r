# Author: Collin Mitchell
#   Date: 9/16/2015

# This is for the "Getting And Cleaning Data" class on Coursera.
# 
#

dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists(dataurl)){ print("There is no data at the other end. Ending.")}
else{
  dir.create("./data")
  download.file(dataurl, destfile = "./data/data.zip")
  zipdata <- unzip("./data/data.zip")
}


library()