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
# lapply: Loop over a list and evaluate a function on each elementa
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

# sapply make everything clearer
x <- list(a = 1:5, b = rnorm(10))
sapply(x, mean) 

# apply is used to evaluate a function over the margins of an array

x <-matrix(rnorm(200), 20, 10)
apply(x, 2, mean) #function(array x, margin, function) 
# 2 collapse row and retain column
apply(2, 1, sum) # 1 retain row and collaps column

rowSums = apply(x, 1, sum)
rowMeans = apply(x, 1, mean)
rowSums = apply(x, 2, sum)
colMeans = apply(x, 2, mean)

# quantiles of the rows of a matrix
x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs = c(0.25, 0.75))

# average matrix in an array
a <- array(rnorm(2*2*10), c(2, 2, 10))
apply(a, c(1,2), mean)

# mapply is a multivariate apply of sorts which applies a function in parllel overa a set of arguments
list(rep(1,4), rep(2,3), rep(3,2), rep(4.1))

# instead we can do
mapply(rep, 1:4, 4:1)

# tapply is used to apply a function over a subsets of a vector
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
tapply(x, f, mean)

# split: takes a vector or other objects and splits it into groups determined by a factor or list of factors
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)


