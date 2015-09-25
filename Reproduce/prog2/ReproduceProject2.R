# Author: Collin Mitchell
# Date: September 19, 2015
# Name: ReproduceProject2.R

# Details from Documentation
### 
# 
#
## Challenges:
# 1] Across the United States, which types of events (as indicated in the EVTYPE variable) are most harmful with respect to population health?
#   P # EVTYPE
#     # FATALITIES 
#     # INJURIES

# 2] Across the United States, which types of events have the greatest economic consequences?
#   P # EVTYPE
#     # PROPDMG
#     # PROPDMGEXP
#     # CROPDMG
#     # CROPDMGEXP

# PROPDMG
# EVTYPE 
################################################

###
# Variables
dataUrl   <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
file.dir  <- "./data"
completepath <- paste(file.dir, "/data.csv.bz2", sep = "")
cumulativeSum <- 

# Libraries
library(dplyr)


# Prepare environment for data and get data:
if(!file.exists(file.dir)){ dir.create("./data")}

# Extract Data:
download.file(dataUrl, destfile = completepath)

filename <- bzfile(completepath)
data <- read.csv(filename)


# Title

# Synopsis

# Data Processing
# 1] Select type
# 2] Sum consequences
# 3] Report results.

index <- 1

for(item in levels(data$EVTYPE)){
  tempslice <- filter(data, EVTYPE == item)
  cumulativeSum <- c(cumulativeSum, sum(tempslice$FATALITIES) + sum(tempslice$INJURIES))
}

storage <- data.frame(type = levels(data$EVTYPE), sums=cumulativeSum)

# Results