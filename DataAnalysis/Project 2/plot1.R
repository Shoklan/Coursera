# AUTHOR: COLLIN MITCHELL
# DATE: 2015/8/21
# PURPOSE:
#        | This program is Project 2 of the Expolatory Data Analysis project.
#        | The purpose is to explore the creation of graphs created by the plotting
#        | system.
#        | Graph #1
####################################################################################

############
# Functions:
#
# Function to collect the sums
collectSums <- function(data, years, index=1){
  culumSum <- 0
  for(yr in years){
     temp <- filter(data, year == yr)
     culumSum[index] <- sum(temp$Emissions)
     index <- index +1
  }
  
  culumSum
}
#
# End Functions
###############


# Note: Rds stands for R Data Serialization.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)

# Get each unique year
years <- levels(as.factor(NEI$year))

# Pull out relevant years data
sums <- collectSums(NEI, years)

# Plotting phase!
png(file = "plot1.png")
plot(years, sums)

# CLOSE OR LOSE YOUR DATA
dev.off()


