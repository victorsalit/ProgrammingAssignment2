### Programming Assignment 2: Caching the Inverse of a Matrix

The two functions in  cachematrix.R demonstrate the caching of a matrix for 
a case where recomputing it might be too time consuming. 
For this demonstration an inverse of the input Matrix is cached for later reuse.

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.

For this assignment, we assume that the matrix supplied is always
invertible.

### Tests:

1. fork and clone the repo.
2. in R: 
> source('your_path/cachematrix.R')
> testm<- makeCacheMatrix(diag(2,2,2))
> testm$get()
     [,1] [,2]
[1,]    2    0
[2,]    0    2

> testm$getinv()
NULL
> cacheSolve(testm)
     [,1] [,2]
[1,]  0.5  0.0
[2,]  0.0  0.5
> testm$getinv()
     [,1] [,2]
[1,]  0.5  0.0
[2,]  0.0  0.5
> testm$set(diag(3,2,2))
> testm$get()
     [,1] [,2]
[1,]    3    0
[2,]    0    3
> testm$getinv()
NULL
> cacheSolve(testm)
          [,1]      [,2]
[1,] 0.3333333 0.0000000
[2,] 0.0000000 0.3333333
> testm$set(diag(3,2,2))
> testm$getinv()
          [,1]      [,2]
[1,] 0.3333333 0.0000000
[2,] 0.0000000 0.3333333

The last test checks that the cached inverse is not cleared at set() in 
case the new matrix is equal the previous one. 
