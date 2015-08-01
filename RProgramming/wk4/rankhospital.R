##  AUTHOR: COLLIN MITCHELL
##    DATE: 2015/8/1
## PURPOSE: ASSIGNMENT WORK.

# Check to see if actually a State
checkState <- function(state){
  for(st in state.abb)
    if(state == st) return(TRUE)
  return(FALSE)
}

# check for NA's
checkNA <- function(reference, outcome, num, name){
  while(is.na(reference[num, outcome])){
    num <- num - 1
  }
  
  # RETURN THE ANSWER
  reference[num,name]
}

rankhospital <- function(state, outcome, num="best"){
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
  
  ## Check that state and outcome are valid.
  if(!is.character(state) | !checkState(state)){
    stop("invalid state")
  }
  # This is duplicate code, but I'm not going to mess with it since it's working.
  else if(!is.character(outcome) & (outcome != hAttack | outcome != hFailure | outcome != pSick)){
    stop("invalid outcome")
  }
  else{
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    ## Pull out state I care about
    temp <- subset(data, data$State == state, rm.na= FALSE)
    
    ## catch and convert numbers
    # "worst"              = last element
    # "best"               = 1
    # num > total elements = NA
    if(num == "worst")                  num <- length(temp[,1])
    else if(num == "best")              num <- 1
    else if(num > length(temp[,1]))     return(NA)
    
    convertToNum <- sapply(temp[,outcome], as.numeric)
    temp[,outcome] = convertToNum

    # Sort the data based on outcome and then name!    
    reference <- temp[ order(temp[,outcome], temp[,name]), ]

    # Finally, check for NA's at the bottom and return!
    checkNA(reference, outcome, num, name)
  }
}