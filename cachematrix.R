## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# Create a special matrix function that can cache it's inverse
makeCacheMatrix <- function(x = matrix()) {
  invmat <- NULL
  set <- function(m) {
    x <<- m
    invmat <<- NULL
  }
  get <- function() m
  setinvmat <- function(i) invmat <<- i
  getinvmat <- function() invmat
  list( set = set, get = get,
        setinvmat = setinvmat,
        getinvmat = getinvmat)
}


## Write a short comment describing this function
# Returns the inverse of the special matrix.  If previously solved,
# the solution will not be computed.  Instead, the cached solution
# will be returned.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  invmat <- x$getinvmat()
  if( !is.null(invmat) ) {
    return(invmat)
  }
  m <- x$get()
  invmat <- solve(m)
  x$setinvmat(invmat)
  invmat
}
