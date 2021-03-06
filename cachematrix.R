## Matrix inversion is usually a costly computation and 
## there may be some benefit to caching the inverse of 
## a matrix rather than compute it repeatedly
## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  invMat <- NULL 
  set <- function(y) {
    x <<- y
    invMat <<- NULL                                          #Initiate Null Matrix
  }
  get <- function()x 
  setInverse <- function(inverse) invMat <<- inverse         #set the inverse matrix
  getInverse <- function()invMat                             #get the inverted matrix
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already 
##been calculated (and the matrix has not changed), then the 
##cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x' 
  invMat <- x$getInverse()
  if(!is.null(invMat)){          #Check to see if the inverse matrix has been calculated
    message("getting cached data")
    return(invMat)
  }
    mat <- x$get()
    invMat <- solve(mat, ...)
    x$setInverse(invMat)
    invMat                       #Return the inverse matrix
}
