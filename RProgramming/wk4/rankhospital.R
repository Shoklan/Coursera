##  AUTHOR: COLLIN MITCHELL
##    DATE: 2015/8/1
## PURPOSE: ASSIGNMENT WORK.

# For work:
#setwd("C:\\Users\\mitcolli\\Documents\\Docs\\code\\Coursera\\RProgramming\\wk4")

# Check to see if actually a State
checkState <- function(state){
  for(st in state.abb)
    if(state == st) return(TRUE)
  return(FALSE)
}

# check for NA's
checkNA <- function(reference, data, outcome, num){
  print("Going into loop: ")
  print(num)
  #  computeReference <- as.numeric(data[reference[num], outcome])
  #Debug:
  #randomCompute <<- computeReference
  # randomNonNumeric <<- 
  while(is.na(data[reference[num], outcome])){    # computeReference[num]
    num <- num - 1
    print(c(num))
  }
  
  data[reference[num], name]
  
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
  if(outcome == "heart attack")  outcome <- hAttack
  if(outcome == "heart failure") outcome <- hFailure
  if(outcome == "pneumonia")     outcome <- pSick
  if(num == "best")              num <- 1
  if(num == "worst")             num <- length(data[,1])
  if(num > length(data[,1]))     return(NA)
  
  ## Check that state and outcome are valid.
  if(!is.character(state) | !checkState(state)){
    stop("invalid state")
  }
  else if(!is.character(outcome) & (outcome != hAttack | outcome != hFailure | outcome != pSick)){
    stop("outcome is not a valid searchable condition.")
  }
  else{
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    reference <- order(data[,outcome], data[,name])
    #debug:
    randomReference <<- reference
    checkNA(reference, data, outcome, num)
    
  }
}