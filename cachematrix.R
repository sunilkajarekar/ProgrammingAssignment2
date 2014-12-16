## Put comments here that give an overall description of what your
## functions do
## It's a set of two functions which will act on a matrix object and 
## will find the matrix inverse of it, only once, and later on whenever
## matrix inverse is asked the existing matrix inverse is returned
## without re-calculating matrix inverse.

## Write a short comment describing this function
## makeCacheMatrix function creates various functions for
## setting up value for matrix and matrix inverse, 
## returning value for matrix and matrix inverse, and it also
## creates a list to store all these functions.

makeCacheMatrix <- function(x = matrix()) {
    matrixInverse <- NULL
    set <- function(newValue){
        x <<- newValue
        matrixInverse <<- NULL
    }
    
    get <- function(){ return(x)}
    setInverse <- function(newInverseValue){
        matrixInverse <<- newInverseValue
    }
    
    getInverse <- function(){ return(matrixInverse)}
    
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function
## This functions calculates matrix inverse if it is not calculated
## already, and stores result into a variable to return it if needed
## again.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    matrixInverse <- x$getInverse()
    if(!is.null(matrixInverse)){
        message("Return Cached value of matrix inverse")
        return(matrixInverse)
    }
    
    theMatrix <- x$get()
    matrixInverse <- solve(theMatrix, ...)
    x$setInverse(matrixInverse)
    
    return(matrixInverse)
}

makeCacheMatrix(mtrx)
cacheSolve(x)
cacheSolve(x)
