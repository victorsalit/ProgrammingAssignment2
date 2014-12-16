# These two functions demonstrate the caching of an object for a case where 
# recomputing the object might be too time consuming. 
# Matrix inversion for example might be such a costly computation 
# (size dependant) and there may be some benefit to caching the inverse of a 
# matrix rather than computing it repeatedly.


makeCacheMatrix <- function(x = matrix()) {
    # This function creates a special "matrix" object that can cache its inverse.

    inv <- NULL # initialize the variable for the inverse matrix
    
    # Methods:
    set <- function(y) {# assigning a new matrix and resetting the inv
        if(!identical(x, y)){# in case the new matrix is not the same one
        x <<- y
        inv <<- NULL # here one could directly compute the new inverse
                     # but assuming that the inverse might not always be 
                     # needed, we just reset it to Null.
        }
    }
    
    get <- function() x # retrieve the matrix
    
    setinv <- function(inverse) inv <<- inverse # set the inv
    
    getinv <- function() inv                    # get the inv
    
    list(set = set, get = get, setinv = setinv, getinv = getinv)
    
}


cacheSolve <- function(x) {
    # This function computes the inverse of the special "matrix" constructed 
    # by `makeCacheMatrix` above. If the inverse has already been calculated 
    # (and the matrix has not changed), then `cacheSolve` should retrieve 
    # the inverse from the cache.
    
    
    inv <- x$getinv()    # retrieve the cached value
    
    if(!is.null(inv)) {  
        message("getting cached data")
        return(inv)
    }

    # in case the retrieved value is Null we need to compute the inverse:
    matrx <- x$get()    # retrieve the original matrix
    inv <- solve(matrx) # invert it (no other parameters needed)
    x$setinv(inv)       # cache the computed inverse
    inv                 # output
    
}
