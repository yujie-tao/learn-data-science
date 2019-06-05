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
