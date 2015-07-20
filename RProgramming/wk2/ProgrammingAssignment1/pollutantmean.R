pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  ## Begin my Code
  directoryData <- list.files(directory, full.names = TRUE)
  
  
  i <- 1
  data <- data.frame(row.names = c("Date", "sulfate", "nitrate"))
  
  while(i < length(id)+1 ){
    #print(id[i])
    #readline("Pause")
    #print(read.csv(directoryData[id[i]]))
    #readline("Pause")
    data <- rbind(data, read.csv(directoryData[id[i]]))
    #readline("Pause")
    i <- i + 1
  }

  mean(data[pollutant][,1], na.rm = TRUE)
}
