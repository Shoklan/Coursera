## AUTHOR: COLLIN MITCHELL
##   DATE: 2015/7/24
##   ROLE:
#        | This is Programming assignment 2 for the Data Science Specialization.
#        | This is to practice and understand the concepts of Lexical Scoping and the
#        | "<<-" is used for assigning to variables in the parent environment.
#        | This allows you to push a variable into a different environment
#        | for safe keeping and disallow it to affect the present calculations.
#        | To select a matrix that is invertable. Or, you can use the code:
#        | matrixData <- matrix(c(1,-1,1,-1,2,1,1-1,3,4),3,3).
#        | This was taken from the Khan Academy lecture
#        | "Examples of finding matrix inverse."
######################################################################################

### 
# Generate a list storing functions and variables in the parent environment
# that will cache matrices that have already been searched for.
# This will speed up the time substantially by not having to redo
# inversions on large matrices we already know the solution for.
############################################################################
makeCacheMatrix <- function(x = matrix()) {
  s   <- NULL
  set <- function(y){
      x <<- y
      s <<- NULL
  }
  
  get <- function() x
  setInverse <- function(solve) s <<- solve # stubbed?
  getInverse <- function()      s
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


### 
# Attempt to find the inverse of a matrix.
# If it exists in our cache, then return that.
# If it doesn't exist, then run solve, store in cache, then return.
####################################################################
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  s <- x$getInverse()
  if(!is.null(s)){
    message("Getting Cached Data:")
    return(s)
  }
  
  data <- x$get()
  s <- solve(data, ...)
  x$setInverse(s)
  s
}
