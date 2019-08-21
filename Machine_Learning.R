# Prediction
# question -> input data -> features -> algorithm -> parameters -> evaluation
plot(density(spam$your[spam$type=='nonspam']), col='blue', main='',xlab="Frequency of 'your'")
lines(density(spam$Your[spam$type=='spam']),col='red')

# Relative importance of steps
# Gabage in = Gabage out