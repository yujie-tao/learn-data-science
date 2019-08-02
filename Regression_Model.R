# Basic Least Squares
  # Minimize the sum of (Yi-mu)^2, for all i

# Regression to the Mean

# Statistical Linear Regression Models
library(UsingR)
data(diamond)
library(ggplot2)
g = ggplot(diamond, aes(x = carat, y = price))
g = g + xlab('Mass (carts)')
g = g + ylab('Price (SIN $)')
g = g + geom_point(size = 6, colour = 'black', alpha = 0.2)
g = g + geom_point(size = 5, colour = 'blue', alpha = 0.2)
g = g + smooth(method = 'lm', colour = 'black')

fit <- lm(price ~ crart, data = diamond)
coef(fit) # get intercept

fit2 <- lm(price ~ I(carat - mean(carat), data = diamond))
coef(fit2)

# Residuals
data(diamond)
y <- diamond$price;
x <- diamond$carat
n <- length(y)
fit <- resid(fit)
yhat <- predict(fit)
max(abs(e- (y-yhat)))