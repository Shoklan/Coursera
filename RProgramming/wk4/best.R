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
    stop("State is not valid: Exiting.")
  }
  else if(!is.character(outcome) & (outcome != hAttack | outcome != hFailure | outcome != pSick)){
    stop("outcome is not a valid searchable condition.")
  }
  else{
    ## Return hospital name in that state with lowest 30-day death
    ## rate.
    temp <- subset(data, data$State == state) # & !is.na(data[outcome])
    randomTemp <<- temp
    filterTarget<- sort(as.numeric(temp[,outcome]))
    randomFilter <<- filterTarget
    potentialResults <- subset(temp, temp[,outcome] == min(filterTarget))
    random <<- potentialResults
    if(length(potentialResults[outcome]) > 1){
      result <- as.character(sort(potentialResults[name])[1])
    } else {
      result <- as.character(potentialResults[name])
      print(result[name])
      print(class(result))
    }
    result
  }
}