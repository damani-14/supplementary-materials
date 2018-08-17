# 8 

setwd('/Users/DamanisMacBook/Documents/Supplementary_Materials/ISLR/Labs/Lab02')

# NOTE: The AUTO dataset has missing values that must be removed before any analyses can be made on the data
Auto = read.csv("Auto.csv",header=TRUE,na.strings="?")
Auto=na.omit(Auto)

attach(Auto)

# Applying a SIMPLE LINEAR MODEL (Regressing 'mpg' on 'horsepower')
mpgLM=lm(mpg~horsepower)
summary(mpgLM)

# Call:
#  lm(formula = mpg ~ horsepower)

# Residuals:
#  Min       1Q   Median       3Q      Max 
#-13.5710  -3.2592  -0.3435   2.7630  16.9240 

# Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 39.935861   0.717499   55.66   <2e-16 ***
#   horsepower  -0.157845   0.006446  -24.49   <2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 4.906 on 390 degrees of freedom
# Multiple R-squared:  0.6059,	Adjusted R-squared:  0.6049 
# F-statistic: 599.7 on 1 and 390 DF,  p-value: < 2.2e-16

plot(horsepower,mpg)
abline(mpgLM,col="red",lwd=2)

# Attemping a PREDICTION

predict(mpgLM,data.frame(horsepower=c(98)))

# 95% Confidence Interval
predict(mpgLM,data.frame(horsepower=c(98)),interval="confidence")

# 95% Prediction Interval
predict(mpgLM,data.frame(horsepower=c(98)),interval="prediction")

# Plotting DIAGNOSTIC PLOTS

par(mfrow=c(2,2))
plot(mpgLM)

# NOTE: A strong trend in the residual plot vs the fitted values suggest
#         non-linearity of the data. The lack of a trend in the residuals
#         suggest linear data

# 9
# A
# Produce a scatterplot matrix which includes all the variables in the
#      dataset

pairs(Auto)

# B
# Compute the MATRIX OF CORRELATIONS (omit the "name" variable, 
#       since it is qualitative).This can be accomplished using 
#       the subset function.

cor(subset(Auto,select=-name))

# C
# Create a MULTIPLE LINEAR REGRESSION omitting the "name" variable

mpgMLR = lm(mpg~.-name,data=Auto)
summary(mpgMLR)

# i - There is a relationship between the predictors and the response, with some of the relationships being
#       statistically significant
# ii - The most significant relationships with "mpg" are with "displacement", "weight", and "year".
#
# iii - The coefficient for "year" (0.751) suggests that year of manufacture has the strongest relationship with 
#       fuel economy. For each year that passes, miles per gallon (on average) increases by 3/4 of a mile.

# D
par(mfrow=c(2,2))
plot(mpgMLR)

# There appears to be some trend in the residual plot suggesting that the data are in fact non-linear
# There also appears to be some outliers near fitted values near the higher end of the spectrum
# There appears to be one observation with considerably high leverage (0.5)


# E
# The following interaction terms appear to be statistically significant

# displacement*horsepower
summary(lm(mpg~displacement*horsepower,data=Auto))

# displacement*weight
summary(lm(mpg~displacement*weight,data=Auto))

# horsepower*weight
summary(lm(mpg~horsepower*weight,data=Auto))

# horsepower*acceleration
summary(lm(mpg~horsepower*acceleration,data=Auto))


# F
# Trying a few data transformations:

# LOG TRANSOFRMATION

summary(lm(mpg~log(displacement)*log(horsepower),data=Auto))

# SQUARE ROOT TRANSFORMATION

summary(lm(mpg~sqrt(horsepower)*sqrt(weight),data=Auto))

# POLYNOMIAL TRANSFORMATION

summary(lm(mpg~poly(horsepower,2),data=Auto))

# 10

# A
library(ISLR)
fix(Carseats)
attach(Carseats)

# Fit a MLR model to regress Sales on Price, Urban, and US:

salesMLR=lm(Sales~Price+Urban+US,data=Carseats)

summary(salesMLR)

# B
# Coefficient Summary

# Price (-0.054)
# Negative relationship

# Urban (-0.022)
# No relationship

# US    (1.200)
# Strong positive relationship


# C
# Write out the model in equation form, being careful to handle to qualitative variables properly

# Sales = 13.043 - 0.022Urban + 1.20US + E
# Urban 0: 13.043 + E
# Urban 1: 13.021 + E
# US    0: 13.043 + E
# US    1: 14.243 + E
# Urban 1 & US 1: 14.221 - 0.054Price + E

# D
# For which predictors can we reject the null hypothesis?
# Only for Price can the null hypotheses be rejected

# E

salesMLR1=lm(Sales~Price + US,data=Carseats)
summary(salesMLR1)

# F
# Model E is slightly better

# G
confint(salesMLR1)

# H
plot(predict(salesMLR1),rstudent(salesMLR1))

par(mfrow=c(2,2))
plot(salesMLR1)

#----------------------------------------------------------------
# 11 - Linear Regression with randomly generated values
#----------------------------------------------------------------

# In this problem we will investigate the t-statistic for the null hypothesis in a simple linear
#       regression WITHOUT AN INTERCEPT. To begin, we generate a predictor x and a response y as follows:

set.seed(1)
x=rnorm(100)
y=2*x+rnorm(100)

noINTyx=lm(y~x+0)
summary(noINTyx)

noINTxy=lm(x~y+0)
summary(noINTxy)

# The relationship of y regressed onto x and x regressed onto y is that they show the same relationship

(sqrt(length(x)-1) * sum(x*y)) / (sqrt(sum(x*x) * sum(y*y) - (sum(x*y))*(sum(x*y))))

# E
# If you swap t(x,y) for t(y,x) the result will be the same [ t(x,y) = t(y,x) ]

# F - SHow that the t-statistics for two LM (x~y and y~x) are the SAME when performed WITH an intercept

yesINTyx=lm(y~x)
summary(yesINTyx)

yesINTxy=lm(x~y)
summary(yesINTxy)


# 13
set.seed(1)
x = rnorm(100, mean=0, sd = 1)
eps = rnorm(100, mean=0, sd = 0.25)

y = -1 + 0.5*x + eps
length(y)
# The length of Y is: 100
# The intercept (B0) is -1 and the slope (B1) is 0.5

plot(x,y)

# The scatterplot displays a positive linear relationship betwen X and Y

ex13e = lm(y~x)
summary(ex13e)

# The linear model has parameters B0 = -1.009 and B1 = 0.499
# These prediction coefficients are extremely close to those 
# observed in the the actual data

par(mfrow=c(1,1))
plot(x,y)
pop = abline(-1, 0.5, lwd=2,col=4)
mod = abline(ex13e, lwd=2,col=3)
legend(-2,0, legend=c("Population", "Model Fit"),col=4:3,lwd=2)

# Now fit a polynomial regression model that predicts y using x and x^2
# Does this improve the model fit?
ex13g = lm(y~poly(x,2))

summary(ex13e)
summary(ex13g)

# The polynomial linear model does slightly improve the fit to the data

# H
# Repeat A-F but modify the data generation process in a way that 
# there is LESS noise (NOTE: This can be accomplished by reducing 
# the variance of the normal distribution used to create the error
# term 'eps')

par(mfrow=c(2,1))
set.seed(1)
x = rnorm(100, mean=0, sd = 1)
epsH = rnorm(100, mean=0, sd = 0.05)
y = -1 + 0.5*x + epsH
ex13h = lm(y~x)
plot(x,y)
pop = abline(-1, 0.5, lwd=2,col=4)
mod = abline(ex13h, lwd=2,col=3)
legend(-2,0, legend=c("H-Population", "H-Model Fit"),col=4:3,lwd=2)
print('Population')
summary(y)
print('Model')
summary(ex13h)

# I
# Repeat A-F but modify the data generation process in a way that 
# there is MORE noise

set.seed(1)
x = rnorm(100, mean=0, sd = 1)
epsI = rnorm(100, mean=0, sd = 0.75)
y = -1 + 0.5*x + epsI
ex13i = lm(y~x)
plot(x,y)
pop = abline(-1, 0.5, lwd=2,col=4)
mod = abline(ex13i, lwd=2,col=3)
legend(-2,0, legend=c("I-Population", "I-Model Fit"),col=4:3,lwd=2)
print('Population')
summary(y)
print('Model')
summary(ex13i)

# J
# Report the confidence intervals of all models

# Standard Model
confint(ex13e)

# High Noise Model
confint(ex13h)

# Low Noise Model
confint(ex13i)

# 14 - COLLINEARITY

# A
set.seed(1)

x1 = runif(100)

x2 = 0.5 * x1 + rnorm(100)/10

y = 2 + 2 * x1 + 0.3 * x2 + rnorm(100)

# FORM: Y = 2 + 2X1 + 0.3X2 + E
# B0 = 2; B1 = 2; B3 = 0.3

# B
# What is the correlation between x1 and x2? Produce a scatterplot
# displaying the relationship between the variables

cor(x1,x2)
plot(x1,x2)

# C
xmodel = lm(y~x1+x2)
summary(xmodel)

# The summary of "xmodel" shows that there is no relationship 
# between x2 and y, but that the relationship between x1 and y
# IS significant

# B0 = 2.23, B1 = 0.53, B2 = 2.51
# These values are similar to those from the model

# The null hypothesis cannot be rejected for the coefficient of X2
# However, the p-value for the coefficient of X1 is statistically
# significant, and the null hypothesis can be rejected

# D
x1model=lm(y~x1)
summary(x1model)
# The null hypothesis for regression on x1 can be rejected

# E
x2model=lm(y~x2)
summary(x2model)
# The null hypothesis for regression on x2 can be rejected

# F
# These results seem to contradict each other, but this is the result
# of x1 and x2 being collinear.

# G
# Add the following values to the vectors X1 and X2 and re-fit all
# three models from C-E.

x1=c(x1, 0.1)
x2=c(x2, 0.8)
y=c(y, 6)

xmodel = lm(y~x2+x1)
x1model=lm(y~x1)
x2model=lm(y~x2)
summary(xmodel)
summary(x1model)
summary(x2model)
plot(xmodel)
plot(x1model)
plot(x2model)

# In the x1model, the appended value is an outlier. In the x2model, the appended
# value is a high leverage point, and in the xmodel the appended value is also
# high leverage. Furthermore, x1 is shifted to insignificance (p-value) and x2 is 
# shifted to significance


# 15
# This problem involves the Boston data set, which we saw in the lab
# for this chapter. We will now try to predict per capita crime rate
# using the other variables in this data set. In other words, per capita
# crime rate is the response, and the other variables are the predictors.

library(MASS)
Boston=Boston

# A
names(Boston)

znMOD = lm(crim~zn,data=Boston)
indusMOD = lm(crim~indus,data=Boston)
chasMOD = lm(crim~chas,data=Boston)
noxMOD = lm(crim~nox,data=Boston)
rmMOD = lm(crim~rm,data=Boston)
ageMOD = lm(crim~age,data=Boston)
disMOD = lm(crim~dis,data=Boston)
radMOD = lm(crim~rad,data=Boston)
taxMOD = lm(crim~tax,data=Boston)
ptratioMOD = lm(crim~ptratio,data=Boston)
blackMOD = lm(crim~black,data=Boston)
lstatMOD = lm(crim~lstat,data=Boston)
medvMOD = lm(crim~medv,data=Boston)

print('znMOD'); summary.lm(znMOD)$coefficients[2,4]
print('indusMOD'); summary.lm(indusMOD)$coefficients[2,4]
print('chasMOD'); summary.lm(chasMOD)$coefficients[2,4]
print('noxMOD'); summary.lm(noxMOD)$coefficients[2,4]
print('rmMOD'); summary.lm(rmMOD)$coefficients[2,4]
print('ageMOD'); summary.lm(ageMOD)$coefficients[2,4]
print('disMOD'); summary.lm(disMOD)$coefficients[2,4]
print('radMOD'); summary.lm(radMOD)$coefficients[2,4]
print('taxMOD'); summary.lm(taxMOD)$coefficients[2,4]
print('ptratioMOD'); summary.lm(ptratioMOD)$coefficients[2,4]
print('blackMOD'); summary.lm(blackMOD)$coefficients[2,4]
print('lstatMOD'); summary.lm(lstatMOD)$coefficients[2,4]
print('medvMOD'); summary.lm(medvMOD)$coefficients[2,4]

# Age, Black, Dis, Lstat, and Medv appear to show the strongest 
# statistically significant relationships

par(mfrow=c(3,2))
plot(crim~age)
abline(ageMOD,lwd=2,col=3)
plot(crim~black)
abline(blackMOD,lwd=2,col=3)
plot(crim~dis)
abline(disMOD,lwd=2,col=3)
plot(crim~lstat)
abline(lstatMOD,lwd=2,col=3)
plot(crim~medv)
abline(medvMOD,lwd=2,col=3)

# B

fullMOD = lm(crim~.,data=Boston)
summary(fullMOD)

# We can reject the null hypothesis for: zn, dis, rad, black, and medv

# C

# The results from A differ slightly fromt he results from B:
# In A it was found that Age, Black, Dis, Lstat, and Medv were the most
# significant relationships. In B it was shown that the only statistically
# significant relationships with Crime are Zn, Dis, Rad, Black, and Medv.

x = summary.lm(znMOD)$coefficients[2,4]
x = c(x, summary.lm(indusMOD)$coefficients[2,4])
x = c(x, summary.lm(chasMOD)$coefficients[2,4])
x = c(x, summary.lm(noxMOD)$coefficients[2,4])
x = c(x, summary.lm(rmMOD)$coefficients[2,4])
x = c(x, summary.lm(ageMOD)$coefficients[2,4])
x = c(x, summary.lm(disMOD)$coefficients[2,4])
x = c(x, summary.lm(radMOD)$coefficients[2,4])
x = c(x, summary.lm(taxMOD)$coefficients[2,4])
x = c(x, summary.lm(ptratioMOD)$coefficients[2,4])
x = c(x, summary.lm(blackMOD)$coefficients[2,4])
x = c(x, summary.lm(lstatMOD)$coefficients[2,4])
x = c(x, summary.lm(medvMOD)$coefficients[2,4])

y = summary.lm(fullMOD)$coefficients[2:14,1]

par(mfrow=c(1,1))
plot(x,y)