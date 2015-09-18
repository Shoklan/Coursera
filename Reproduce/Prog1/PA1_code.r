# Author: Collin Mitchell
#   Date: September 15, 2015
#


## Variables
baseurl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
file.dir <- "./data"
completepath <- paste(file.dir, "/data.zip", sep = "")

cumulativeSums     <- 0
cumulativeMeans    <- 0
cumulativeMedians  <- 0
cumulativeInterval <- 0

## Libraries
library(dplyr)
library(reshape2)

# Prepare environment for data and get data.
if(!file.exists(file.dir)){ dir.create("./data")}

download.file(baseurl, destfile = completepath)
filename <- unzip(completepath, exdir=file.dir)
data <- read.csv(filename)


# Arrange Data based on the dates.
data <- arrange(data, date)


# Challenge 1
# mean steps per day?
## Ignore NA values (.., rm.na = T)
index = 1

for(distinctdates in levels(data$date)){
  temp <- filter(data, date == distinctdates)
  cumulativeSums[index] = sum(temp$steps, rm.na = T)
  index <- index + 1
}

# Histogram of values
print( factor(cumulativeSums) )
length(cumulativeSums)
hist(cumulativeSums)


# Report mean & median steps/day
index = 1
for(distinctdates in levels(data$date)){
  temp <- filter(data, date == distinctdates)
  cumulativeMeans[index] = mean(temp$steps, rm.na = T)
  index <- index + 1
}

length(cumulativeMeans)

index = 1
for(distinctdates in levels(data$date)){
  temp <- filter(data, date == distinctdates)
  cumulativeMedians[index] = median(temp$steps)
  index <- index + 1
}

length(cumulativeMedians)

# Report results.
print(cumulativeMeans)
print(cumulativeMedians)

# Challenge 3
# Time series plot: 5-minute interval, avg steps taken, across all days
# Which 5 minute interval has the most steps.

splitOnInterval <- dcast(data, date + steps ~ interval)

for(index in 3:ncol(splitOnInterval) ){
  cumulativeInterval[index-2] <- sum(splitOnInterval[,index], na.rm = T)
}

# Fix the plot labels, but otherwise done.
plot(colnames(splitOnInterval)[3:length(splitOnInterval)], cumulativeInterval, type = "l")


# I wanted the solution to be generic:
colnames(splitOnInterval)[match(max(cumulativeInterval), cumulativeInterval) + 2]

# Challenge 4
# n of NAs in data?
# deal with NA's in data and substitute solution in copy of data
sum(is.na(data$steps))


for(distinctdates in levels(data$date)){
  tempData <- filter(data, date == distinctdates)
  fillmean <- mean(tempData$steps, rm.na = T)
  print(distinctdates)
  
  #Don't forget about this exception
  if(is.na(fillmean)){ fillmean = 0}
  
  while(sum(is.na(tempData$steps))){
    target <- match(NA, tempData$steps)
    print(tempData$steps[target])
    tempData$steps[target] <- fillmean
    print(target)
  }
  
  if(nrow(copyData) == 1){ copyData <- tempData}
  else{
    copyData <- rbind(copyData, tempData)
  }

}


# Histogram of number of steps/day
# calculate mean/median again.
# Different from before?

# Challenge 6 | NEW DATASET
# //Weekdays() funct.
# Create factor variable in new dataset (weekday, weekend)
##  if day %in% ("Monday-Friday") = weekday
##  else weekend
# Panel plot| 5 minute interval steps/day wkend vs wkday.
