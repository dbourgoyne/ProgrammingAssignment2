# Test program for cachematrix

# Source in the cachematrix R code
source("cachematrix.R")

# Create a random matrix of sufficient size to cause measurable compute
m <- replicate(1000, rnorm(1000))

# From the random matrix, create a cached matrix
cm <- makeCacheMatrix(m)

# Compute the inverse of the random matrix and store it for comparision
t <- system.time( ans <- solve(m) )
print("Computing the inverse of the random matrix took:")
print(t)

# Compute the inverse of the cached random matrix.  Should take approximately
# the same time to compute as the non-cached random matrix.
t <- system.time( cans <- cacheSolve(cm) )
if( !identical(ans, cans) ) {
  print("cacheSolve got the wrong answer")
} else {
  print("Computing the inverse of the cached random matrix took:")
  print(t)
}

# Compute the inverse of the cached random matrix a second time.  This time
# it should take almost no compute becaused the cached answer is returned.
t <- system.time( cans <- cacheSolve(cm) )
if( !identical(ans, cans) ) {
  print("cacheSolve got the wrong answer")
} else {
  print("Computing the inverse of the cached random matrix for a second time took:")
  print(t)
}