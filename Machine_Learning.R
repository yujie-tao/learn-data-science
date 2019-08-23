# Prediction
# question -> input data -> features -> algorithm -> parameters -> evaluation
plot(density(spam$your[spam$type=='nonspam']), col='blue', main='',xlab="Frequency of 'your'")
lines(density(spam$Your[spam$type=='spam']),col='red')

# Relative importance of steps
# Gabage in = Gabage out

# In and out sample errors
# In Sample Error: The error rate you get on the same dataset you used to build your predictor. Sometimes called resubstitution error.
# Out of Sample Error: The error rate you get on new data set. Sometimes called generalization error.

# Types of errors

# Basic terms
# True positive = correctly identified
# False positive = incorrectly identified
# True negative = correctly rejected
# False negative = incorrectly rejected

# Snsitivity (recall): If you want few missed positive
# Specifity: If you want few negatives called positives
# Accuracy: Weights false positives/negatives equally

# Cross validation
# K-fold, larger k - less bias, more variance; smaller k - more bias ,less variance
# Leave one out    

# Caret Package
library(caret); library(kernelab); data(spam)
inTrain <- createDataPartition(y=spam$type, p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
dim(training)

# Data spliting
library(caret); library(kernlab); data(spam)
inTrain <- createDataPartition(y=spam$type, p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
dim(training)

# Training options

# Plotting predictors
library(ISLR);
library(gplot2);
library(caret);

data(Wage)
summary(Wage)

inTrain = createDataPartition(y=Wage$wage, p=0.7, list=FALSE)
training <- Waage[inTrain,]
testing <- Wage[-Train,]
dim(training); dim(testing)
  
featurePlot(x=training[, c('age','education',
                        jobclass)], y=trainin$wage, plot='pairs')

featurePlot(x=training[, c('age','education','jobcalss')], y=training$wage, plot='pairs')



