# AUTHOR: COLLIN MITCHELL
# DATE: 2015/8/9
# PURPOSE:
#        | This program is Project 1 of the Expolatory Data Analysis project.
#        | The purpose is to explore the creation of graphs created by the plotting
#        | system.
#        | Graph 4
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


# Graph one is just a repeat of Part 1
# format variables I care about
globalActive <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]
voltage <- as.numeric(levels(data$Voltage))[data$Voltage]
subMeter1 <- as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
subMeter2 <- as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
subMeter3 <- data$Sub_metering_3
globalReactive <- as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power]

# Get mid index and total rows
midIndex <- match("2/2/2007", data$Date)
dataLength = length(data[,1])

plot.new()

#Open File for Writing
png(file = "plot4.png")


# Set up columns for printing.
par(mfrow = c(2,2))

#Plot Graph Part 2 Again
plot(globalActive, type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")

axisTicks = c(0, midIndex, dataLength )
axisLabels = c("Thu", "Fri", "Sat")
axis(1, at = axisTicks, labels = axisLabels)

# Plot Graph 2 of Part 4
plot(voltage, type="l", xlab = "datetime", ylab="Voltage", xaxt="n",)
axisTicks = c(0, midIndex, dataLength )
axisLabels = c("Thu", "Fri", "Sat")
axis(1, at = axisTicks, labels = axisLabels)

# Plot Graph 3 of Part 4
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

# Plot Graph 4 of Part 4
plot(globalReactive, type="l", xaxt="n", xlab="datetime", ylab="Global_reactive_power")

# Set up graph axis
axisTicks = c(0, midIndex, dataLength )
axisLabels = c("Thu", "Fri", "Sat")
axis(1, at = axisTicks, labels = axisLabels)


# CLOSE OR LOSE YOUR DATA
dev.off()