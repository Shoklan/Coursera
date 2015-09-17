# Author: Collin Mitchell
#   Date: September 15, 2015
#


## Variables
baseurl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
file.dir <- "./data"
completepath <- paste(file.dir, "/data.zip", sep = "")


# Get a
if(!file.exists(file.dir)){ dir.create("./data")}
download.file(baseurl, destfile = completepath)
filename <- unzip(completepath, exdir=file.dir)

data <- read.csv(filename)

#Step 1
# Load the data (i.e. read.csv())
# Process/transform the data (if necessary) into a format suitable for your analysis

# Challenge 1
# mean steps per day?
## Ignore NA values (.., rm.na = T)

# Challenge 2
# Histogram of values
# Report mean & median steps/day

# Challenge 3
# Time series plot: 5-minute interval, avg steps taken, across all days
# Which 5 minute interval has the most steps.


# Challenge 4
# n of NAs in data?
# deal with NA's in data and substitute solution in copy of data

# Challenge 5 | NEW DATASET
# Histogram of number of steps/day
# calculate mean/median again.
# Different from before?

# Challenge 6 | NEW DATASET
# //Weekdays() funct.
# Create factor variable in new dataset (weekday, weekend)
##  if day %in% ("Monday-Friday") = weekday
##  else weekend
# Panel plot| 5 minute interval steps/day wkend vs wkday.
