# AUTHOR: COLLIN MITCHELL
# DATE: 2015/8/16
# PURPOSE:
#        | This program is Project 2 of the Expolatory Data Analysis project.
#        | The purpose is to explore the creation of graphs created by the plotting
#        | system.
#        | Graph #5
####################################################################################

############
# Functions:
#
# Function to collect the substrings
collectFrames <- function(data, years, sccValues, index=1){
  culumSum <- 0
  for(yr in years){
    temp            <- filter(data, year == yr, SCC %in% sccValues)
    randomTemp <<- temp
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

# Pull out SCC values based on the coal search indexes.
motorNameIndexes <- grep("Motor Vehicle", SCC$Short.Name)

# Realized that I don't need a function to get the SCC codes
sccCodes <- SCC$SCC[motorNameIndexes]

# Grab frames
frames <- collectFrames(NEI, years, sccCodes)





# Plotting phase!
png(file = "plot5.png")
plot(years,  frames)

# CLOSE OR LOSE YOUR DATA
dev.off()