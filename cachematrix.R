## These two functions will compute the inverse of the matrix in a possibly 
## efficient way. The makeCacheMatrix will create the functionality to cache the 
## inverse of a matrix, while the cacheSolve function will first check if the 
## inverse has been already stored in the cache before computing it with solve.

## This function creates a special "matrix" object that can cache its inverse.
## More specifically, it will create a list containing functions to get/set 
## the value of the matrix and set/get the value of its inverse
makeCacheMatrix <- function(x = matrix()) {
  
  ## initializing inverse
  inv <- NULL
  
  ## creating the set function
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  ## creating the get
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated  
## (and the matrix has not changed), then the cachesolve should
## retrieve the inverse from the cache.

cacheSolve <- function(x) {
  ## Return a matrix that is the inverse of 'x'
  
  ## tried to get the cached inverse
  inverse <- x$getinverse()
  
  ## if the inverse is getting returned...
  ## then we print the 'getting cached data' message
  ## and we end the execution of the function returning it
  if(!is.null(inverse)) {
    message("getting cached data")
    return(m)
  }
  
  ## getting the matrix data
  data <- x$get()
  
  ## computing the inverse
  inv <- inverse(data)
  
  ## setting the inverse to the 'cachable' object
  x$setinverse(inv)
  
  ## returning the inverse
  return(inv)

}
