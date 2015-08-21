# AUTHOR: COLLIN MITCHELL
# DATE: 2015/8/16
# PURPOSE:
#        | This program is Project 2 of the Expolatory Data Analysis project.
#        | The purpose is to explore the creation of graphs created by the plotting
#        | system.
#        | Graph #3
####################################################################################

############
# Functions:
#
# Function to collect the substrings
collectSubstring <- function(data, types, cityFIPS="24510", index=1){
  for(type in types){
    subStringCollection[index] <- substring(data, data$type == type & data$cityFIPS == cityFIPS)
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

types <- c("point", "nonpoint", "onroad", "nonroad")

# Pull out relevant years data into substrings
subStrings    <- collectSubstring(NEI, types)

# collect the data for plotting.
sumCollection <- collectEmissions(subStrings)


# Plotting phase!
png(file = "plot3.png")
# Need to use ggplot2
#plot(years,  sumCollection)

# CLOSE OR LOSE YOUR DATA
dev.off()