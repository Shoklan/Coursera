# AUTHOR: COLLIN MITCHELL
# DATE: 2015/8/16
# PURPOSE:
#        | This program is Project 2 of the Expolatory Data Analysis project.
#        | The purpose is to explore the creation of graphs created by the plotting
#        | system.
#        | Graph #6
####################################################################################

############
# Functions:
#
# Function to collect the substrings
collectFrames <- function(data, years, sccValues, cityFIPS="24510", index=1){
  culumSum <- 0
  for(yr in years){
    temp            <- filter(data, year == yr, SCC %in% sccValues, fips == cityFIPS)
    culumSum[index] <- sum(temp$Emissions)
    index <- index+1
  }
  
  culumSum
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

# Los Angeles County FIPS
LAFIPS <- "06037"

# Pull out SCC values based on the coal search indexes.
motorNameIndexes <- grep("Motor Vehicle", SCC$Short.Name)

# DON'T FORGET THIS NEEDS TO BE A CHARACTER
sccCodes <- as.character(SCC$SCC[motorNameIndexes])

# Pulling two different data frames!
BCFrame <- collectFrames(NEI, years, sccCodes)
LAFrame <- collectFrames(NEI, years, sccCodes, cityFIPS = LAFIPS)





# Plotting phase!
png(file = "plot6.png", height=600, width=700)
par(mfrow = c(1,2))
plot(years,  BCFrame, main="Baltimore City Emissions", xlab="Year", ylab="Emissions (Tons)")
lines(years, BCFrame)
plot(years,  LAFrame, main="Los Angeles Emissions", xlab="Year", ylab="Emissions (Tons)")
lines(years, LAFrame)
# CLOSE OR LOSE YOUR DATA
dev.off()
