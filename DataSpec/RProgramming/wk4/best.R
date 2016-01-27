##  AUTHOR: COLLIN MITCHELL
##    DATE: 2015/7/29
## PURPOSE: ASSIGNMENT WORK.

# Going to need this work.
# For work:
#setwd("C:\\Users\\mitcolli\\Documents\\Docs\\code\\Coursera\\RProgramming\\wk4")

# Check to see if actually a State
checkState <- function(state){
  for(st in state.abb)
    if(state == st) return(TRUE)
  return(FALSE)
}

best <- function(state, outcome){
  # Read the Data.
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  # This is for my own reference to make debugging easier and for comparison.
  hAttack  <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  hFailure <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  pSick    <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  name     <- "Hospital.Name"
  
  # map inputs to comparable values.
  if(outcome == "heart attack")  outcome <- hAttack
  if(outcome == "heart failure") outcome <- hFailure
  if(outcome == "pneumonia")     outcome <- pSick
  
  ## Check that state and outcome are valid.
  if(!is.character(state) | !checkState(state)){
    stop("invalid state")
  }
  else if(!is.character(outcome) & (outcome != hAttack | outcome != hFailure | outcome != pSick)){
    stop("outcome is not a valid searchable condition.")
  }
  else{
    ## Return hospital name in that state with lowest 30-day death
    ## rate.
    
    # Retrieve all possible hostpitals in the state:
    temp <- subset(data, data$State == state)
    # Debug:randomTemp <<- temp
    
    # pull out all number of outcomes and sort:
    filterTarget<- sort(as.numeric(temp[,outcome]))
    
    # Debug:randomFilter <<- filterTarget
    
    # PUll out any duplicates in the data frame with the same number of
    # occurances:
    potentialResults <- subset(temp, temp[,outcome] == min(filterTarget))
    
    # Debug:random <<- potentialResults
    
    # If more than one result, sort and get first name:
    if(length(potentialResults[outcome]) > 1){
      result <- as.character(sort(potentialResults[name])[1])
    } else {
      # Just return the one item:
      result <- as.character(potentialResults[name])
    }
    result
  }
}