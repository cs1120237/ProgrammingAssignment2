## Put comments here that give an overall description of what your
## functions do

## list containing a function to set the matrix, get the matrix, set the inverse, get the inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinvrs <- function(invrs) m <<- invrs
  getinvrs <- function() m
  list(set = set, get = get,
       setinvrs= setinvrs,
       getinvrs = getinvrs)
}


## calculates the inverse of the special "vector" created with the above function, if already calculated, gets it from the cache

cacheSolve <- function(x, ...) {
  m <- x$getinvrs()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinvrs(m)
  m
}

