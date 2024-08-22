## The following functions are used to calculate and cache the inverse of a matrix. 
## If the inverse of the matrix is already cached then it will pull it from the memory
## and return it instead recalculating it, which can reduce the computational time,
## which can be costly, depending on the size of the matrix

## The function below takes a matrix and creates a matrix object that can cache its inverse.
## It returns the value of the below methods as a list
## Methods:
## set - assigns the the given matrix to x and assigns NULL to m in the memory.
## get -  returns the given matrix (value of x)
## setinverse - assigns the passed value of matrix inverse to m, which is written into the memory
## getinverse - gets the the value of m  (matrix inverse) from memory  

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inv) m <<- inv
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
        
}


## The following function takes the previously defined matrix object 
## and returns the inverse of that matrix. If inverse was already calculated 

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
        
        
        
         ## Return a matrix that is the inverse of 'x'
}
