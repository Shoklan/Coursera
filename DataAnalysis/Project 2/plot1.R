# AUTHOR: COLLIN MITCHELL
# DATE: 2015/8/16
# PURPOSE:
#        | This program is Project 2 of the Expolatory Data Analysis project.
#        | The purpose is to explore the creation of graphs created by the plotting
#        | system.
#        | Graph #1
####################################################################################

############
# Functions:
#
# Function to collect the substrings
collectSubstring <- function(data, years, index=1){
  for(year in years){
    subStringCollection[index] <- substring(data, data$year == years[index])
    index <- index+1
  }
  
  subStringCollection
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

# Pull out relevant years data into substrings
subStrings    <- collectSubstring(NEI, years)

# collect the data for plotting.
sumCollection <- collectEmissions(subStrings)

# Plotting phase!
png(file = "plot1.png")
plot(years,  sumCollection)

# CLOSE OR LOSE YOUR DATA
dev.off()

