## This program has two main functions. The object of the program is to check if the inverse
## of a matrix is already calculated. In that case, the program retrieves the cached value. 
## Otherwise, it calculates the inverse of the matrix and stores it in the object 'sol'. 

## This function takes a matrix, x, and returns a list with the matrix and its inverse
## along with a complete copy of the environment in which the function 'makeCacheMatrix'
## was written. 

makeCacheMatrix <- function(x = matrix()) {
    sol <- NULL
    set <- function(y) {
      x <<- y
      sol <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) sol<<- solve
    getsolve <- function() sol
    list(set=set, get = get, 
         setsolve = setsolve,
         getsolve = getsolve)
}
  
## This function takes a matrix in the form provided by 'makeCacheMatrix', checks whether
## its inverse exists and if it does, gets if from the cache. Otherwise it solves the matrix
## for its inverse and stores the result in the object 'sol'. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

  sol <- x$getsolve()
  if(!is.null(sol)) {
    message("getting cached data")
    return(sol)
  }
  data <- x$get()
  sol <- solve(data,...)
  x$setsolve(sol)
  sol
}