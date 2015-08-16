# AUTHOR: COLLIN MITCHELL
# DATE: 2015/8/9
# PURPOSE:
#        | This program is Project 1 of the Expolatory Data Analysis project.
#        | The purpose is to explore the creation of graphs created by the plotting
#        | system.
#        | Graph 1
####################################################################################

#Variables
fileName <- "household_power_consumption.txt"
lowerBoundString <- "1/2/2007"
upperBoundString <- "3/2/2007"
# we only care aboyut data between 2007-02-01 and 2007-02-02

# Wasn't sure how to subset via the file yet,
# So I just did the normal pull all, subset style.
initData <- read.table(fileName, header = TRUE, sep = ";")

# Slice out data I want based on index;
# yes, I did open the file on my desktop to browse it
lowerBound <- match(TRUE, initData$Date == lowerBoundString)
upperBound <- match(TRUE, initData$Date == upperBoundString) -1
data <- initData[lowerBound:upperBound,]

# format variable I care about
globalActive <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]



# Plotting phase!
png(file = "plot1.png")
plot1 <- hist(globalActive, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
# CLOSE OR LOSE YOUR DATA
dev.off()
