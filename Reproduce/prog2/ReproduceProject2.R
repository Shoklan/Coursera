# Author: Collin Mitchell
# Date: September 19, 2015
# Name: ReproduceProject2.R

# Details from Documentation
### 
# 
#
## Challenges:
# 1] Across the United States, which types of events (as indicated in the EVTYPE variable) are most harmful with respect to population health?
# 2] Across the United States, which types of events have the greatest economic consequences?
################################################

###
# Variables

dataUrl   <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
file.dir  <- "./data"

completepath <- paste(file.dir, "/data.csv.bz2", sep = "")


# Prepare environment for data and get data.
if(!file.exists(file.dir)){ dir.create("./data")}

# Extract Data:
download.file(dataUrl, destfile = completepath)
filename <- bzfile(completepath)
data <- read.csv(filename)
