# Author: Collin Mitchell
# Date: September 19, 2015
# Name: ReproduceProject2.R


# Variables
dataUrl   <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
file.dir  <- "./data"
completepath <- paste(file.dir, "/data.csv.bz2", sep = "")
expValues <- c("h", "H", "B", "m", "M", "K", "")

# Libraries
library(dplyr)


# Prepare environment for data and get data:
if(!file.exists(file.dir)){ dir.create("./data")}

# Extract Data:
download.file(dataUrl, destfile = completepath)
filename <- bzfile(completepath)

# Get data
data <- read.csv(filename)

# filter to remove Summary items
sliceIndexes<- grep("Summary", data$EVTYPE)
data <- data[-sliceIndexes,]

# split apart based on questions
propertyCopy <- filter(data, PROPDMGEXP %in% expValues)
cropCopy     <- filter(data, CROPDMGEXP %in% expValues)






# Function to replace exponent with real multiplier
replace <- function(target){
  hundredsIndex <- grep("[hH]", target)
  millionsIndex <- grep("[mM]", target)
  billionsIndex <- grep("[bB]", target)
  target <- rep(1, length(target))
  
  target[hundredsIndex] = 100
  target[millionsIndex] = 1000000
  target[billionsIndex] = 1000000000
  
  as.factor(target)
  }

propertyCopy$PROPDMGEXP <- replace(propertyCopy$PROPDMGEXP)
cropCopy$PROPDMGEXP     <- replace(cropCopy$PROPDMGEXP)

# factor is not dropping the old values;
# compiling new factors
propertyCopy$PROPDMGEXP <- factor(propertyCopy$PROPDMGEXP)
cropCopy$CROPDMGEXP     <- factor(cropCopy$CROPDMGEXP)

#*# 
# Mutate and create a new column called cost
propertyCopy <- mutate(propertyCopy, PropertyCost = as.numeric(PROPDMG) * as.numeric(PROPDMGEXP))
cropCopy     <- mutate(cropCopy,         CropCost = as.numeric(CROPDMG) * as.numeric(CROPDMGEXP))

# Sum costs
propertySum <- 0
cropSum     <- 0
for(item in unique(levels(data$EVTYPE))){
  tempslice <- filter(data, EVTYPE == item)
  propertySum <- c(propertySum, sum(as.numeric(tempslice$PropertyCost)))
  cropSum     <- c(cropSum,     sum(as.numeric(tempslice$CropCost)))
}

# sum individual harms
peopleHarmSum <- 0
for(item in unique(levels(data$EVTYPE))){
  tempslice <- filter(data, EVTYPE == item)
  peopleHarmSum <- c(peopleHarmSum, sum(tempslice$FATALITIES) + sum(tempslice$INJURIES))
  
}

results <- data.frame(type = levels(data$EVTYPE), propertycost = propertySum[2:length(propertySum)], cropcost = cropSum[2:length(cropSum)], harm=peopleHarmSum[2:length(peopleHarmSum)])
