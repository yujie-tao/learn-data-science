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
  

# T Confidence Intervals
  # The t interval technically assumes that the data are iid normal, though it is robust to this assumption
  # Use T index rather than Z index, wider than normal, the more data, the more closer T distribution ton normal distribution
  
# Hypotheosis Testing
  # Hypothesis testing is concerned with making decision using data
  # A null hypothesis is specified that represents the status quo, usually labeled as H0. The null hypothesis is assumed true.
  # Statistical evidence is required to reject H0 in favor of a research or alternative hypothesis, Ha
  # Type 1 error: truth H0, decide Ha
  # Type 2 error: truth Ha, decide H0
  
  # T Test
    library(UsingR); data(fater.son)
    t.test(fater.son$sheight - fater.son$fheight)
  # Two sided test
    # Suppose that we would reject the null hypothesis if in fact the mean is too large or too small
  
  # Two Group Testing

# P values
  # Most common measure of statistical significance
  # The P-value is the probability under the null hypothesis of obtaining evidence as extreme or more extreme than that obtained
    # If P-value is small. then either H0 is true, and we observed a rare event or Ha is false
    # P indicates that, given a normal rate, wheteher the existed rate, is extreme enough. When p is small, it means that the existing rate is rare and H0 is true.
    # E.g. Assume under 100 patients, 10 people get infected and if over 10 people get infected, we implement some regulation in response. But we also don't want to implement response by random number, like 20, we want to make sure 20 is truly bad infection sitution based on the scenario. We can calculate the P value here.

# Power
  # Power is the probability of rejecting the null hypothesis when it is false
  mu0 = 30
  mua = 32
  sigma = 4
  n = 16
  z <- qnorm(1-alpha)
  pnorm(mu0 + z*sigma/sqrt(n), mean = mu0, sd = sigma/sqrt(n), lower.tail = FALSE)
  
  pnorm(mu0 + z*sigma/sqrt(n), mean = mua, sd = sigma/sqrt(n), lower.tail = FALSE)
    
  
  