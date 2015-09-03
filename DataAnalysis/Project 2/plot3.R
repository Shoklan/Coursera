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
# Function to collect and split databy year
collectYears <- function(data, years, cityFIPS="24510", index=1){
  # This will create an empty dataframe!
  culumFrames <- read.table(text = "", col.names = col.names)
  for(yr in years){
    culumFrames <- rbind(culumFrames, filter(data, year == yr, fips == cityFIPS))
  }
  
  culumFrames
}
#
# End Functions
###############

# Note: Rds stands for R Data Serialization.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

# Get each unique year
years <- levels(as.factor(NEI$year))
# Steal column names
col.names <- colnames(NEI)

# Pull out relevant years data into substrings
collectYears <- collectYears(NEI, years)

# Plotting phase!
png(file = "plot3.png", height=600, width=600)
qplot(year, Emissions, data = collectYears, facets = type ~ ., geom = "smooth", method = "lm", xlab="Year", ylab = "Emissions (Tons)") + ggtitle("Baltimore City Emissions by Type")

# CLOSE OR LOSE YOUR DATA
dev.off()
