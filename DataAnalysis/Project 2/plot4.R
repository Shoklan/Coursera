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
# Function to collect the substrings
collectSubstring <- function(data, years, sccValues, index=1){
  for(year in years){
    subStringCollection[index] <- substring(data, data$year == years & data$SCC %in% sccValues)
    index <- index+1
  }
  
  subStringCollection
}

# map coalIndexes to SCC values
convertIndexToSCC <- function(indexes, SCCIndex=1){
  for(index in indexes){
    sccValues[SCCIndex] <- SCC$SCC[index]
    SCCIndex <- SCCIndex +1
  }
  
  sccValues
}

# Function to sum emissions
collectEmissions <- function(collection, index=1:length(years)){
  for(i in index){
    data[i] <- sum(collection$Emissions)
  }
  
  data  
}
#
# End Functions
###############

# Note: Rds stands for R Data Serialization.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get each unique year
years <- levels(as.factor(NEI$year))

# Find which codes map to coal using grep("coal", data)
coalNameIndexes <- grep("coal", SCC$Short.Name)

# Pull out SCC values based on the coal search indexes.
sccCodes <-convertIndexToSCC(coalNameIndexes)

# Get values and sum for plotting



# Plotting phase!
png(file = "plot4.png")
plot(years,  sumCollection)

# CLOSE OR LOSE YOUR DATA
dev.off()