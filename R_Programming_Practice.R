add2 <- function(x,y){
  x+y
}

above10 <- function(x){
  use <- x>10
  x[use] #give out all x satisfy the logic, x input would be a range
}

above <- function(x,n){
  use<- x>n
  x[use]
}

columnmean <- function(x){
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){ 
    means[i] <- mean(y[,i])
  }
  means
}

# Loop in R
# lapply: Loop over a list and evaluate a function on each element
# sapply: Same as lapply but try to simplify the result
# apply: Apply a function over the margins of anarray
# tapply: Apply a function over subsets of a vector
# mapply: Multivariate version of lapply

x <- list(a = 1:5, b = rnorm(10)) # rnorm: random normal distribution
# apply mean function to each element in x
lapply(x, mean) 

x <- 1:4
lapply(x, runif, min = 0, max = 10) # runif generates n random values

# lapply in matrix
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6,3,2))
# extract the first column of each matrix
lapply(x, function(elt) elt[,1])

