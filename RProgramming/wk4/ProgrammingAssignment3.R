##  AUTHOR: COLLIN MITCHELL
##    DATE: 2015/7/29
## PURPOSE: ASSIGNMENT WORK.

# Going to need this work.
# For work:
#setwd("C:\\Users\\mitcolli\\Documents\\Docs\\code\\Coursera\\RProgramming\\wk4")
# For Home:

#read data:
# data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

best <- function(state, outcome){
  ## Read outcome Data.
  hAttack  <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  hFAilure <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  pSick    <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  
  ## Check that state and outcome are valid.
  if(!is.character(state)){
    print("State is not valid: Exiting.")
    break
  }
  else if(is.character(outcome) & (outcome != hAttack | outcome != hFailure | outcome != pSick)){
    print("outcome is not a valid searchable condition.")
    break
  }
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate.
  
}

checkHospitals <- function(data){
  # This should work:
  # heartAttack <- subset(outcome, !(is.na(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)))
  # heartFailure <- subset(outcome, !(is.na(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)))
  # pneumonia <- subset(outcome, !(is.na(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)))
  
  
}

# NOTES:
# Use this for filtering.
# temp <- subset(outcome, outcome$State == "NY" & !is.na(outcome[hAttack]))
#
# grab the min index or grab the frame?
# Let's make it fun and use the concept from the last project here;
# push the whole frame into the parent environment!
# Don't forget to convert to numeric! (is.numeric(val))