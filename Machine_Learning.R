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


# Basic processing

# Preprocessing
library(caret); library(kerlab); data(spam)
inTrain <-cerateDatatPartition(y=spam$type, p=0.75, list=FALSE)
training <- spam[inTrian,]
testing <- spam[inTrian,]
hist(triaining$capitalAve, main='',xlab='ave. capital run length')

# Standardizing
trainCaAve <- training$capitalAve
testCapAveS <- (testCapAve = mean(trainCapAve))/sd(trainCapAve)
mean(testCapAveS)

preObj <- preProcess(training[,-58], method=c('center', 'scale'))
trainCapAveS <- predict(preObj, training[-58])$capitalAve
mean(trainCapAveS)
sd(trainCapAveS)

testCapAveS <- predict(preObj, testing[,-58])$capitalAve
mean(testCapAveS)
sd(testCapAveS)

set.seed(32343)
modelFit <- train(type ~.,data=training, preProcess=c('center', 'scale'), method='glm')

# Covariate creation

# Preprocessig with PCA
library(caret); library(kernlab); data(spam)
inTrain <- createDatPartition(y=spam$type, p=0.75, list = FALSE)
training <- spam[inTrian,]
testing <- spam[-inTrian,]

M <- abs(cor(training[,-58]))
diag(M) <- 0
which(M > 0.8, arr.ind = T)

preProc <- preProcess(log10(spam[,-58]+1), method='pca',pcaComp=2)
spamPC <- predict(preProc, log10(spam[,-58]+1))
plot(spamPC[,1],spamPC[,2],col=typeColor)


# Predicting with regression
lm1 <- lm(eruptions ~ waiting, data=trainFaith)
summary(lm1)

plot(trainFaith$waiting, trainFaith$eruptions, pch=19, col='blue', xlab='Waiting', ylab='Duration') 
lines(trainFaith$waiting, lm1$fitted, lwd=3)

coef(lm1)[1]+coef(lm1)[2]*80
newdata <- data.frame(waiting=80)
predict(lm1, newdata)

sqrt(sum(lm1$fitted-trainFaith$eruption)^2)
sqrt(sum(predict(lm1, newdata=testFaith)-testFaith$eruptions)^2)

modFit <- train(eruptions ~ waiting, data=trainFaith, method='lm')
summary(modFit$finalModel)

# Predicting with regression multiple
library(ISLR); library(ggplot); library(caret);
data(Wage); Wage <- subset(Wage, select=-c(logwage))
summary(Wage)

inTrain <- createDataPartition(y=Wage$wage, p=0.7, list=FALSE)
training <- Wage[inTrain,]; testing <- Wage[-inTrain,]
dim(training); dim(testing)

featurePlot(x=training[,c('age','education','jobclass')], y=training$wage, plot='pairs')
qplot(age, wage, colour=jobclass, data=training)
qplot(age, wage, colour=education, data=training)

modFit <- train(wage~age + jobclass+education, method='lm', data=training)
finMod <- modFit$finalModel
print(modFit)

plot(finMod, pch=19, cex=0.5, col='#0000010')
plot(finMod$residuals, pch=19)

pred = predict(modFit, testing)
qplot(wage, pred, colour=year, data=testing)

modFitAll <- train(wage~., data=training, method='lm')
pred <- predict(modFitAll, tesitng)
qplot(wage, pred, data=testing)

# Predicting with trees
# - Iteratively split variables into groups
# - Evaluate homogenity within eachgroup
# Split again if necessary

# Pros
# - Easy to interpret
# - Better performance in nonlinear setting

# Cons
# - Without pruning/cross-validation can lead to overfitting
# - Harder to estimate uncertainty
# - Results may be variable

library(caret)
modFit <- train(Species ~.method='repart', data=training)
print(modFit$finalModel)

plot(modFit$finalModel, uniform=TRUE, main='Classification Tree')
text(modFit$finalModel, use.n=TRUE, all=TRUE, cex=.8)

# Bagging
# - Resample cases and recalculate predictions
# - Average or majority vote
# - Similar bias
# - Reduced variance
# - More useful for on-linear functions

library(ElemStatLearn); data(ozone, package='EleStatLearn')
ozone <- ozone[order(ozone$ozone),]
head(ozone)
li <- matrix(NA, nrow, ncol=155)
for(i in 10){
  ss <- sample(1:dim(ozone)[1], replace=T)
  ozone0 <- ozone[ss,]; oznoe0 <- ozone0[order(ozone$ozone),]
  loess0 <- loess(temperature ~ ozone, data=ozone0, span=0.2)
  li[i,] <- predict(loss0, newdata=data.frame(ozone=1:555))
}

plot(ozone$ozone, ozone$temperature, pch=19, cex=0.5)
for(i in i:10){lines(1:155, li[i,], col='grey', lwd=2)}
lines(1:155, apply(ll,2,mean),col='red', lwd=2)

# Random forests
# - Bootstrap samples
# - At each split, bootstrap variables
# - Grow multiple trees and vote

library(caret)
modFit <- train(Species~., data=training, method='rf', prox=TRUE)
modFit

# Boosting
# - Take lots of weak predictors
# - Weigh them and add them up
# - Give a stronger predictor

# Model based prediction
# Assume the data follow a probablistic model

# Pro
# - Can take advantage of structure of the data
# - May be computionally convenient
# - Are reasonably accurate on real problem

# Cons
# - Make additional assumptions about the data
# - When the model is incorrect you may get reduced accuracy

# Regularized regression
# - Fit a regression model
# - Polarize (or shrink) large coefficient

# Pros:
# - Can help with bias/variance tradeoff
# - Can help with model selection

# Cons:
# - May be computationally demanding on alrge data sets
# - Does not perform as well as random forest and boosting

# Combining predictors

# Forecasting

# Unsupervised prediction



