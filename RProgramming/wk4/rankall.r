##  AUTHOR: COLLIN MITCHELL
##    DATE: 2015/8/1
## PURPOSE: ASSIGNMENT WORK.

# For work:
#setwd("C:\\Users\\mitcolli\\Documents\\Docs\\code\\Coursera\\RProgramming\\wk4")

filterState <- function(data, outcome, name, num){
  # Create container for data
  results <- data.frame(hospital = NA, state = NA)
  count   <- 1
  if(num == "worst") worstFlag <- TRUE
  else               worstFlag <- FALSE
  if(num == "best")        num <- 1
  
  # Begin going through data!
  #!# There are 4 territories that need to be added: [1] "DC", "GU", "PR", "VI"
  #!# also, %in% is a thing to be used!
  for(st in state.abb){
    # Generate slice of state data
    slice <- subset(data, data$State == st)
    
    
    # The subset seems to return the data to char type
    # so, convert and order after taking the slice
    slice[,outcome] = as.numeric(slice[,outcome])
    #convertToNum <- sapply(slice[,outcome], as.numeric)
    #slice[,outcome] = convertToNum
    
    
    reference <- slice[ order(slice[,outcome], slice[,name]), ]
    if(worstFlag) num <- length(slice[,1])
    #DEBUG:
    #print(count)
    #print(st)
    randomSlice <<- slice
    randomReference <<- reference
    
    if(count == 1){
      results[1,"hospital"]  <- reference[num,name]
      results[1,"state"] <- reference[num,"State"]
    }
    else if(num > length(reference[,1])){
      results[count,"hospital"]    <- NA
      results[count,"state"] <- st
      #print(c("NUmber of Hospitals", length(reference[,1])))
      #print(c("Hospital Name: ", reference[num,name]))
      #print(reference[num,st])
    }else{
      results[count,"hospital"]  <- reference[num,name]
      results[count,"state"] <- reference[num,"State"]
    }
    
    count <- count +1
  }
  
  # Now I get to sort this too...
  # reference <- slice[ order(slice[,outcome], slice[,name]), ]
  
  results[ order(randomResults[,"state"], randomResults[,"hospital"]), ]
  randomResults <<- results
  #print(results)
  results
}

rankall <- function(outcome, num="best"){
  # Read the data:
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  # This is for my own reference to make debugging easier and for comparison.
  hAttack  <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  hFailure <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  pSick    <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  name     <- "Hospital.Name"
  
  # map inputs to comparable values.
  # This makes debugging sooooo much easier!
  if(     outcome == "heart attack")  outcome <- hAttack
  else if(outcome == "heart failure") outcome <- hFailure
  else if(outcome == "pneumonia")     outcome <- pSick
  else { stop("invalid outcome")}
  

  #convertToNum <- sapply(data[,outcome], as.numeric)
  #data[,outcome] = convertToNum
  #print(outcome)
  #randomData <<- data
  ## For each state, find the hospital of the given rank
  filterState(data, outcome, name, num)
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  #results <- data.frame(Hospital.Name, State = st)
    
  }