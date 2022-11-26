setwd('C:/Users/rubind1/Documents/Coursera-R')
##
## I simply set the input x as a matrix
## and then set the solved value "s" as a null
## then I changed every reference to "mean" to "solve"
makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  set_solve <- function(solve) s <<- solve
  get_solve <- function() s
  list(set = set, get = get,
       set_solve = set_solve,
       get_solve = get_solve)
}
## Same here, changed "mean" to "solve" and "m" to "s"
cache_Solve <- function(x, ...) {
  s <- x$get_solve()
  if(!is.null(s)) {
    message("getting inversed matrix")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
# now adding SSHA
