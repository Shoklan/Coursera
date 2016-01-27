# AUTHOR: COLLIN MITCHELL
# DATE: 2015/8/16
# PURPOSE:
#        | This program is Project 2 of the Expolatory Data Analysis project.
#        | The purpose is to explore the creation of graphs created by the plotting
#        | system.
#        | Graph #4
####################################################################################

############
# Functions:
#
# Function to collect frames
collectFrames <- function(data, years, sccValues, index=1){
  # culumFrames <- read.table(text = "", col.names = col.names)
  culumSum <- 0
  for(yr in years){
    temp            <- filter(data, year == yr, SCC %in% sccValues)
    culumSum[index] <- sum(temp$Emissions)
    index <- index+1
  }
  
  culumSum
}

# map coalIndexes to SCC values
convertIndexToSCC <- function(indexes, SCCIndex=1){
  # blank storage vector
  sccValues <- vector()
  for(index in indexes){
    sccValues[SCCIndex] <- as.character(SCC$SCC[index])
    SCCIndex <- SCCIndex +1
  }
  
  sccValues
}
#
# End Functions
###############

# Note: Rds stands for R Data Serialization.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get each unique year
years <- levels(as.factor(NEI$year))

# grab column names from data
col.names <- colnames(NEI)

# Find which codes map to coal using grep("coal", data)
coalNameIndexes <- grep("coal", SCC$Short.Name)

# Pull out SCC values based on the coal search indexes.
sccCodes <-convertIndexToSCC(coalNameIndexes)

# Get values
frames <- collectFrames(NEI, years, sccCodes)



# Plotting phase!
png(file = "plot4.png")
plot(years,  frames, main = "US Coal Emissions", xlab="Year", ylab = "Emissions   (Tons)")
lines(years, frames)

# CLOSE OR LOSE YOUR DATA
dev.off()
