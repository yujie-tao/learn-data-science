# Statistical Inference
# Generating conclusions about a population from a noisy sample

# Probability
  # - Probability
  # - Probability density function

# Conditional Probability
  # - Conditional probability
  # - Bayes rule
  # - Independence

# Expected values
  # - Mean is a charaterization of the center
  # - The variance and standard deviation are how spread out it is

# Variability
  # - Variance
  # - Standard error of the mean

# Distribution
  # - Binomial distribution
  # - Normal distribution
  pnorm(1160, mean = 1020, sd = 5, lower.tail = FALSE)
  pnorm(2.8, lower.tail = FALSE)

  # - Poisson 
  
# Asymptotics and LLN (Law of Large Numbers)
  n <- 1000
  mean <- cumsum(rnorm(n))/(1:n)
  means <- cumsum(sample(0:1, n, replace = TRUE))/(1:n)
  # the mean converges
  # LLN states that the average of iid samples converge to the population means they are estimating

# Asymptotics and the CLT (Central Limit Theorem)
   # CLT states that averages are approximately normal, with distribution 
     # - centered at population mean
     # - with standard deviation equal to the standard error of the mean
     # - CLT gives no guarntee that n is large enough
  
# Asymptotics and confidence intervals
   # Taking the mean ad adding and substracting the relevant normal quantiles times the SE yields a confidence interval for the mean
     # - Adding and substracting 2 SEs works for 95% intervals
  

# T confidence intervals
  # The t interval technically assumes that the data are iid normal, though it is robust to this assumption
  # Use T index rather than Z index, wider than normal, the more data, the more closer T distribution ton normal distribution
  
  