## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        
        
        inv <<- NULL
        
        get <- function() x
        
        set <- function(y)
        {
                x <<- y
                inv <<- NULL
        }
        
        setinv <- function(inverse) inv <<- inverse
        
        getinv <- function() inv
        
        list(set = set, get = get, setinv = setinv, getinv = getinv)
        
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        inv <- x$getinv()
        
        if(!is.null(inv))
        {
                message("getting cached data")
                return(inv)
        }
        
        data <- x$get()
        inv <- solve(data)
        x$setinv(inv)
        
        inv
        
}




a <- makeCacheMatrix(matrix(c(1,2,3,1),nrow = 2, ncol = 2))

a$get()
a$getinv()


cacheSolve(a)


cacheSolve(a)



a$set(matrix(c(1,0,0,3), nrow = 2, ncol = 2))
a$get()


cacheSolve(a)




