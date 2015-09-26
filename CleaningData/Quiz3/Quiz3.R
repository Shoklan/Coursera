library(dplyr)

GDPUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(GDPUrl, destfile = "gpd.csv")
gdp <- read.csv("gpd.csv")

EducationUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(EducationUrl, destfile = "edu.csv")
edu <- read.csv("edu.csv")
str(edu)
str(gdp)

finalResult <- merge(edu, gdp, by.x = "CountryCode", by.y = "X")
str(finalResult)
dataArrange$Gross.domestic.product.2012 <- as.numeric(dataArrange$Gross.domestic.product.2012)
dataArrange <- arrange(finalResult, desc(Gross.domestic.product.2012))


dataArrange[14,]


select(dataArrange, CountryCode, Gross.domestic.product.2012)
class(dataArrange$Gross.domestic.product.2012)

temp <- filter(finalResult, Income.Group == "High income: nonOECD")[,"Gross.domestic.product.2012"]
mean(as.numeric(temp), rm.na = T)
