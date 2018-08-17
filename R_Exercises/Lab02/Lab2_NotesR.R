# Loading Libraries into R: library()

# For this exercise, we will need to load the MASS and ISLR libraries

library(MASS)

# To install a missing library: install.packages()

install.packages("ISLR")
library(ISLR)

# For this exercise, we will use the BOSTON dataset (MASS Library) to attempt to predict 'medv' (median hoe value)
#       using 13 predictors contained in the dataset

fix(Boston)
names(Boston)

# To fit a SIMPLE LINEAR REGRESSION model: lm(<response>,<predictor>)

# Begin by regressing 'medv' onto 'lstat'

# NOTE: Remember to first ATTACH the daataset to the environment for manupulation: attach()

attach(Boston)
lm.fit=lm(medv~lstat)

# Calling the object will display dome basic information about the model's output:

lm.fit

# For MORE information, we can use the summary() fuction:

summary(lm.fit)

# We can use the names() function to show what other pieces of information are stored in lm.fit:

names(lm.fit)

# Although we can extract these quantities by name e.g. - lm.fit$coefficients, it is safer to use the "extractor" 
#       functions, such as coef()

coef(lm.fit)

# In order to obtain a CONFIDENCE INTERVAL for the coefficient estimates, we use the confint() commans:

confint(lm.fit)

# The predict() function can be used to produce CONFIDENCE INTERVALS AND PREDICTION INTERVALS
#       for the prediction of 'medv' for a given value of 'lstat':

predict(lm.fit,data.frame(lstat=c(5,10,15)),
        interval="confidence")

predict(lm.fit,data.frame(lstat=c(5,10,15)),
        interval="prediction")

# NOTE: INTERPRETING THIS OUTPUT: The 95% confidence interval associated with an lstat value of 10 is (24.47, 25.63)
#       and the 95% prediction interval is(12.826, 37.28). As expected, the confidence and prediction intervals are 
#       centered around the same point (a predicted value of 25.05 for medv when lstat = 10), but the latter are 
#       substantially wider (due to the prediction interval taking the standard error into account)


# To plot the data along with the REGRESSION LINE, we use the plot() and abline() functions:

plot(lstat,medv)
abline(lm.fit)

# Notice thise plot is difficult to see due to the color scheme. We can change a few parameters of the plot()
#       and abline() functions, along with the 'pch' option, which can be used to create different plotting symbols:

plot(lstat,medv)
abline(lm.fit, lwd=2, col="red")

abline(lm.fit,lwd=3)
abline(lm.fit,lwd=3,col="red")
plot(lstat,medv,col="red")
plot(lstat,medv,pch=20)
plot(lstat,medv,pch="+")
plot(1:20,1:20,pch=1:20)

# Best Parameters

plot(lstat,medv,pch=20)
abline(lm.fit, lwd=2, col="red")

# By default, four diagnostic plots are automatically produced by applying the plot() function directly to the
#       output from lm()

plot(lm.fit)

# For better viewing, it is desirable to split the display:

par(mfrow=c(2,2))
plot(lm.fit)

# When finished, we can reset the display to show one figure in the window at a time.

par(mfrow=c(1,1))

# Alternatively we can compute the RESIDUALS from a linear regression using the residuals() function
#       Additionally, the function rstudent() will return the studentized residuals, which we can also
#       plot against the fitted values.

plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))

# To plot the LEVERAGE associated with each fitted point, we can use the function hatvalues():

plot(hatvalues(lm.fit))

# We can use the which.max() function to find the largest element of a vector. In this case, we are looking for the
#       INDEX of the observation which has the largest leverage statistic:

which.max(hatvalues(lm.fit))

#----------------------------------------------------------------------------------------------------------------------
# MULTIPLE LINEAR REGRESSION
#----------------------------------------------------------------------------------------------------------------------

# In order to fit a multiple linear regression model (using least squares), we again use the lm() function
# The basic syntax is as follows:   lm( y ~ x1 + x2 + x3 + ... + xn)

lm.fit=lm(medv~lstat+age,data=Boston)

summary(lm.fit)

# In order to fit a MLR with all variables in Boston, we can use the shorthand:

lm.fit=lm(medv~. ,data=Boston)

summary(lm.fit)

lm(formula = medv ~ . , data = Boston)

# We can access individual compoents of a summary object by name
# e.g - 

summary(lm.fit)$r.squared

# will print the R-squared value. For a list of all components available:

?summmary(lm.fit)


# What if we want to perform a regression using all of the variables but one?

lm.fit1=lm(medv~.-age,data=Boston)
summary(lm.fit1)

# We can accomplish the same task using update() function:

lm.fit1=update(lm.fit,~.-age)
summary(lm.fit1)

#----------------------------------------------------------------------------------------------------------------------
# INTERACTION TERMS
#----------------------------------------------------------------------------------------------------------------------

# Suppose we want to include an INTERACTION TERM in our regression. We can accomplish this using the
#       lm() function and the syntax X1:X2 in the argument passed to tell R to include an interaction
#       term between X1 and X2


# NOTE: The syntax X1*X2 simultaneously includes X1, X2, and the interaction term X1*X2

# e.g. - 

summary(lm(medv~lstat*age,data=Boston))

# is equivalent to

summary(lm(medv~lstat+age+lstat:age,data=Boston))

#----------------------------------------------------------------------------------------------------------------------
# NON-LINEAR TRANSFORMATIONS
#----------------------------------------------------------------------------------------------------------------------

# The lm() and I() function can calso accomodate non-linear transformations of the predictors
# NOTE: The I() function is needed since the ^ has a special meaning in a formula. Wrapping in this way
#       allows the standard usage in R, which is to raise X to the power 2

lm.fit2=lm(medv~lstat+I(lstat^2))
summary(lm.fit2)

# In this instance, the quadratic term lead to an improved model.

# To COMPARE the fit of two functions, we can use the ANOVA function in R:

lm.fit=lm(medv~lstat)
anova(lm.fit,lm.fit2)

# For a large F-statistic and very low p-value for the F-statistic, we can conclude that the quadratic 
#       transformation of 'lstat' provided a better fit to the data

par(mfrow=c(2,2))
plot(lm.fit2)

# To increase the degree polynomial, rather than changing I(X^n), we can use the poly() function within lm():

lm.fit5=lm(medv~poly(lstat,5))
summary(lm.fit5)

# LOG TRANSFORMATION

summary(lm(medv~log(rm),data=Boston))

#----------------------------------------------------------------------------------------------------------------------
# QUALITATIVE PREDICTORS
#----------------------------------------------------------------------------------------------------------------------

# For this exercise, we will use the Carseats data (part of the ISLR library), to attempt to 
#       predict Sales (child car seat sales) in 400 locations based on a number of predictors

fix(Carseats)
attach(Carseats)

# To view all predictors in Carseats:

names(Carseats)

# This dataset contains QUALITATIVE variables such as the quality of product placement in the store aka 'ShelveLoc'
#       which takes on three possible values: Bad, Medium, and Good.
#       Given a qualitative variable such as Shelveloc, R generates dummy variables automatically.

# Here we attempt to fit a multiple regression that includes some interaction terms:

lm.fit = lm(Sales~.+Income:Advertising + Price:Age, data=Carseats)
summary(lm.fit)

# NOTE: to view the coding that R uses for the dummy variables, use contrasts():

contrasts(ShelveLoc)

# The Output Is:

#        Good Medium
# Bad       0      0
# Good      1      0
# Medium    0      1

# INTERPRETATION: By using the contrasts() function, we have asked R to create ShelveLocGood and ShelveLocMedium
#       dummy variables. SLG = 1 if the shelving location is good and 0 otherwise, while SLM = 1 if the location
#       is meidum and 0 otherwise.

#----------------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------------
# WRITING FUNCTIONS ---------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------------

# NOTE: The + symbols are printed by R and should not be typed in:

LoadLibraries=function(){
  library(ISLR)
  library(MASS)
  print("The libraries have been loaded.")
}

# If we simply type LoadLibraries, it will show us what is in the function:

LoadLibraries

# To call the dunction, ass parentheses:

LoadLibraries()
