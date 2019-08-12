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

# Inference on regression

# Multivariable regression analysis
n = 100; x = rnorm(n); x2 = rnorm(x); x3 = rnorm(n)
y = 1 + x + x2 + x3 + rnorm(n, sd = 0.1)
ey = resid(lm(y~x2 + x3))
ex = resi(lm(x~x2 + x3))
sum(ey * ex)/sum(ex^2)
coef(lm(y ~ x + x2 + x3))

require(datasets); data(InsepctSprays); require(stats)
g = ggplot(data-InsectSprays, ase(y = count, x = spray, fill = spray))
g = g + geom_violin(colour = 'black', size = 2)
g = g + xlab('Type of spray') + ylab('Insect count')

# Adjustment Examples

# Residuals and Diagnositiccs
data(swiss);
par(mfrow = c(2,2))
fit <- lm(Fertility ~., data = swiss)
plot(fit)

# outlier 

# Model Selection
# Known knowns: regressors that we know we should check to include in the model and have
# Known unknowns: regressors that we would like to include in the model, but don't have
# Unknown unknowns: Regressors that we don't even know about that we should have included in the model

# Logistic Regression
x <- seq(-10, 10, length = 1000)
manipulate(
  plot(x, exp(beta0 + beta1*x)/(1 + exp(beta0 + beta1*x)), type = '1', lwd = 3, frame = FALSE),
  beta1 = slider(-2, 2, step = 0.1, intial = 2),
  beta0 = slider(-2, 2, tep = 0.1, initial = 0)
)
logRegRavens <- glm(ravensData$ravenWinNum ~ ravenData$ravenScore, family='binomial')
summary(logRegRavens)

exp(logRegRaven$coeff)
exp(confint(logregRavens))
anova(logRegRavens, test = 'Chisq')

