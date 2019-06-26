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





