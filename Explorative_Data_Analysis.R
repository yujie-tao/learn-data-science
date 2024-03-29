# Basic Plotting System

# simple base graphics: Histogram
library(datasets)
hist(airquality$Ozone)

# simple base graphics: Scatterplot
library(datasets)
with(airquality, plot(Wind, Ozone))

# simple base graphics: Boxplot
library(datasets)
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")

# base plot with annotation
with(airquality, plot(Wind, Ozone, main = 'Ozone and Wind in New York City'))
with(subset(airquality, Month == 5 ), points(Wind, Ozone, col = 'blue'))

with(airquality, plot(Wind, Ozone, main = 'Ozone and Wind in New York City'), type = 'n')
# type = n means not plotting anything, just setup the plot, preapring for the subset
with(subset(airquality, Month == 5 ), points(Wind, Ozone, col = 'blue'))
with(subset(airquality, Month != 5 ), points(Wind, Ozone, col = 'red'))
legend('topright', pch = 1, col=c('blue', 'red'), legend=c('May', 'Other Months'))

# base plot with regression line
with(airquality, plot(Wind, Ozone, main = 'Ozone and Wind in New York City'), pch = 10)
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)

# multiple base plots
par(mfrow = c(1,2))
with (airquality, {
  plot(Wind, Ozone, main = 'Ozone and wind')
  plot(Solar.R, Ozone, main = 'Ozone and Solar radiation')
})


par(mfrow = c(1,3), mar = c(4,4,2,1), oma = c(0,0,2,0))
with (airquality, {
  plot(Wind, Ozone, main = 'Ozone and wind')
  plot(Solar.R, Ozone, main = 'Ozone and Solar radiation')
  plot(Tmp, Ozone, main = 'Ozone and Temperature')
  mtext('Ozone and weather in New York City', outer = TRUE)
})


# Base plotting demonstration
x <- rnorm(100)
hist(x)
y <- rnorm(100)
plot(x, y)
par(mar = c(2, 2, 2, 2))
plot(x, y)
plot(x, y, pch = 20) # pch is plot symbols
example(points) # give a lists of plot symbols
title('Scatterplot')
text(-2, -2, 'label')
legend('topleft', legend = 'Data', pch = 20)
abline(fit)
abline(fit, lwd = 3) # lwd = 3 make the line thicker
abline(fit, lwd = 3, col = 'blue')
plot(x, y, xlab = 'Weight', ylab = 'Height', main = 'Scatterplot', pch = 20)
legend('topright', legend = 'Data', pch = 20)
fit <- lm(y ~ x)
abline(fit, lwd = 3, col= 'red')
z <- rpois(200, 2)
par(mfrow = c(2,1))
plot(x, y , pch = 20)
plot(x, y , pch = 10)
par('mar')

plot(x, y, type = 'n')
points(x[g == 'Male'], y[g == 'Male'], col = 'green')
points(x[g == 'Female'], y[g == 'Female'], col = 'blue')


# Graphical Device

library(datasets)
with(faithful, plot(eruptions, waiting))
title(main = 'Old Faithful Geyser data')

pdf(file = 'myplot.pdf')
with(faithful, plot(eruptions, waiting))
title(main = 'Old Faithful Geyser data')
dev.off()

# Copying plots
library(datasets)
with(fiathful, plot(eruptions, waiting))
title(main = 'Old Faithful Geyser data')
dev.copy(png, file= 'greyserplot.png')
dev.off()


# Lattice plotting system
# usually for plotting high dimension data

library(lattice)
library(datasets)
xplot(Ozone ~ Wind, data = airquality)

# Simple lattice plot
library(datasets)
library(lattice)
airquality <- transform(airquality, Month = factor(Month))
xplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f + x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c('Group1', 'Group2'))
xplot(y ~ x | f, layout = c(2,1))

# ggplot2
# grammar of graphics, abstraction of graphics and ideas 
library(ggplot2)
qplot(displ, hwy, data = mpg)
qplot(displ, hwy, data = mpg, facets = ~drv)
qplot(hwy, data = mpg, facets = drv~, binwidth = 2)
qlot(log(eno), data = maacs, fill = mopos)

g <- ggplot(maac, aes(logpm25, NocturnalSympt))
g + geom_point(alpha = 1/3)
g + facet_wrap(bmicat ~ no2dec, nrow = 2, ncol = 4)
g + geom_smooeth(method = 'lm', se = FALSE, col = 'steelblue')
g + theme_bw(base_family = 'Avenir', base_size = 10)
g + labs(x = expression('log'*PM[2.5]))
g + labs(y = 'Nocturnal Symptons')
g + labs(title = 'MAACS Cohort')

# Hierarchial Clustering
# an agglomerative approach: find closest two things, put them together and find next closest
set.seed(1234) 
par(mar = c(0, 0, 0, 0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
plot(x, y, col = 'blue', pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

dataFrame <- data.frame(x = x, y = y)
dist(dataFrame)

dataFrame <- data.frame(x = x, y = y)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
plot(hClustering)

dataFrame <- data.farme(x = x, y = y)
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
heatmap(dataMatrix)

# K-means clustering
set.seed(1234)
par(mar = c(0, 0, 0, 0))
x <- rnorm (12, mean = rep(1:3, each = 4), sd = 0.2)
plot(x, y, col ='blue', pch = 19, cex = 2)
text(x+0.05, y+0.05, labels = as.character(1:12))

dataFrame <- data.frame(x,y)
kmeansObj <- kmeans(dataFrame, centers = 3)
names(kmeansObj)
  
kmeansObj$cluster
par(mar = rep(0.2, 4))
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2)
points(kmeansObj$center, col = 1:3, pch = 3, cex = 3, lwd = 3)

set.seed(1234)
dataMatrix <- as.matrix(dataFrame)[sample(1:12)]
kmeansObjc2 <- kmeans(datamatrix, center = 3)
par(mrow = c(1,2), mar = c(2, 4, 0.1, 0.1))
image(t(dataMatrix[, nrow(dataMatrix):1], yaxt = 'n'))
image(t(dataMatrix[, order(kmeansObj$cluster)], yaxt = 'n'))

# Dimension reduction
# principal components analysis and singular value decomposition
set.seed(12345)
par(mar = rep(0.2, 4))
dataMatrix <- matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])
pr(mar = rep(0.2, 4))
heatmaap(dataMatrix)

# patterns in rows and columns

# components of SVD
svd1 <- svd(scale(dataMatrixOrdered))
par(mrow = c(1,3))
image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])
plot(svd$u[,1], 40:1,xlab = 'Row', ylab = 'First left singular vector', pch = 19)
plot(svd$v[,1], xlab = 'Column', ylab='First right singular vector', pch = 19)

par(mfrow = c(1,2))
plot(svd1$d, xlab = 'Column', ylab = 'Singular value', pch = 19)
plot(svd$d^2/sum(svd$d^2), xlab = 'Column', ylab = 'Prop. of variance explained', pch = 19)
abline(c(0,1))

# pattenrs of variance in rows
svd2 <- svd(scale(dataMatrixOrdered))
par(mfrow = c(1,3))
image(t(dataMatirxOrdered)[, nrow(datamatrixOrdered): 1])
plot(svd2$v[ ,2], pch = 19, xlab = 'Column', ylab = 'First right singular vector')
plot(svd$v[, 2], pch = 19, xlab = 'Column', ylab = 'Seconde right singular vector')





