complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  #Begin My Code
  directoryData <- list.files(directory, full.names = TRUE)
  
  data <- data.frame(row.names = c("Date", "sulfate", "nitrate"))
  finalData <- data.frame(row.names = c("id", "nobs"))
  iter <- 1
  
  parseData <- function(funcData){
    countInternal <- 0
    i<- 1
    while(i < length(funcData[,1]) +1){
      frame <- funcData[i,]
      if(is.na(frame["Date"]) == FALSE & is.na(frame["sulfate"]) == FALSE & is.na(frame["nitrate"]) == FALSE)
        countInternal <- countInternal + 1
      i <- i + 1
    }
    
    countInternal
  }
  
  while(iter < length(id)+1){
    data <- rbind(data, read.csv(directoryData[id[iter]]))
    count <- parseData(data)
    finalData <- rbind(finalData, data.frame(id=iter, nobs=count))
    
    # Reset data to nothing again!
    data <- data.frame(row.names = c("Date", "sulfate", "nitrate"))
    iter <- iter+1
  }
  
  finalData
}
