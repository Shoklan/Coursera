# AUTHOR: COLLIN MITCHELL
# DATE: 2015/8/9
# PURPOSE:
#        | This program is Project 1 of the Expolatory Data Analysis project.
#        | The purpose is to explore the creation of graphs created by the plotting
#        | system.
#        | Graph 3
####################################################################################

#Variables
fileName <- "household_power_consumption.txt"
lowerBoundString <- "1/2/2007"
upperBoundString <- "3/2/2007"
varNames         <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colorNames       <- c("black", "red", "blue")
# we only care aboyut data between 2007-02-01 and 2007-02-02

# Wasn't sure how to subset via the file yet,
# So I just did the normal pull all, subset style.
initData <- read.table(fileName, header = TRUE, sep = ";")

# Slice out data I want based on index;
# yes, I did open the file on my desktop to browse it
lowerBound <- match(TRUE, initData$Date == lowerBoundString)
upperBound <- match(TRUE, initData$Date == upperBoundString) -1
data <- initData[lowerBound:upperBound,]

# Get mid index and total rows
midIndex <- match("2/2/2007", data$Date)
dataLength = length(data[,1])

# Get them out of factors
subMeter1 <- as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
subMeter2 <- as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
subMeter3 <- data$Sub_metering_3

# Print to png
png(file = "plot3.png")

# Beginning plotting process!
plot(1:dataLength, subMeter1, type="l", xaxt="n", xlab="", ylab="Energy sub metering")

# Set up graph axis
axisTicks = c(0, midIndex, dataLength )
axisLabels = c("Thu", "Fri", "Sat")
axis(1, at = axisTicks, labels = axisLabels)

# draw the remaining two lines of data
lines(1:dataLength, subMeter2, type="l", col="red")
lines(1:dataLength, subMeter3, type="l", col="blue")

# .. and, make the legend.
legend("topright", lty = 1,  varNames, col = colorNames, horiz=FALSE)


# CLOSE OR LOSE YOUR DATA
dev.off()
