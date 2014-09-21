## Put comments here that give an overall description of what your
## functions do

## creates a special "matrix object that can cache inverse

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y){
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) inverse <<- solve(x)
  getinverse <- function() inverse
  list(set = set, get = get, setinverse = setinverse,
       getinverse = getinverse)
}

x <- matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2)


## computes the inverse of the special matrix, if inverse is 
## already created, it will retrieve from cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  calc_inv <- x$getinverse()
  print(calc_inv)
  if(!is.null(calc_inv)){
    message("getting cached data")
    return(calc_inv)
  }
  data <- x$get()
  print(data)
  calc_inv <- solve(data, ...)
  x$setinverse(calc_inv)
  calc_inv
}

cacheSolve(test_1)
test_1$getinverse()

