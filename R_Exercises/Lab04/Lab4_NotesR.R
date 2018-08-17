# Exploring Resampling Techniques
library(ISLR)

# THE VALIDATION SET APPROACH
#----------------------------

  # NOTE: It is GNERALLY A GOOD IDEA to set a random seed when performing analysis
  # such as cross-validation THAT CONTAINS AN ELEMENT OF RANDOMNESS for precise 
  # reproducibility.

set.seed(1)

  # The sample() function splits a set of observations into two halves bu selecting
  # a random subset of size n/2
train=sample(392,196)

lm.fit = lm(mpg~horsepower, data = Auto, subset = train)

  # We now use predict() to estimate the response for ALL 392 observations and the mean()
  # function to calculate the MSE of the 196 observations in the validation set
attach(Auto)
mean((mpg-predict(lm.fit,Auto))[-train]^2)

  # We can use the same approach to estimate the test error for quadratic and 
  # cubic regressions

  # quadratic regression
lm.fit2=lm(mpg~poly(horsepower,2),data=Auto,subset=train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)

  # cubic regression
lm.fit3=lm(mpg~poly(horsepower,3),data=Auto,subset=train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)


  # NOTE: If we choose a different training set instead, then we will obtain somwehat 
  # different errors on the validation set
set.seed(2)
train = sample(392,196)
lm.fit=lm(mpg~horsepower,subset=train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)

lm.fit2=lm(mpg~poly(horsepower,2),data=Auto,subset=train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)

lm.fit3=lm(mpg~poly(horsepower,3),data=Auto,subset=train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)

# LEAVE ONE OUT CROSS VALIDATION: PART 1
#---------------------------------------

  # NOTE: Performing a logistic regression WITHOUT passing the argument family="binomial"
  # to the glm() function produces a linear regression identical to lm() output

  # In order to use the cross-validation features in R on linear models, it is necessary to
  # fit the model using the glm() function rather than the lm() function

library(boot)

lm.fit = glm(mpg~horsepower,data=Auto)

  # The cv.glm() function produces a list with several componenets.
cv.err = cv.glm(Auto,lm.fit)

  # The two numbers in the "delta" vector contain the cross-validation results.
cv.err$delta

  # In this case, the numbers are identical and correspond to the LOOCV statistic
  # given in Eqn. 5.1. The first component is the raw cross validation estimate
  # of prediction error. The second component is the adjusted cross validation 
  # estimate. The adjustment is designed to compensate for the bias introduced by
  # not using LOOCV.


# LEAVE ONE OUT CROSS VALIDATION: PART 2
#---------------------------------------

  # Creating a for() loop to automate the cv for increasingly complex polynomial fits

  # initialize the vector
cv.error = rep(0,5)

for (i in 1:5){
  glm.fit = glm(mpg~poly(horsepower,i),data=Auto)
  cv.error[i]=cv.glm(Auto,glm.fit)$delta[1]
}
cv.error

  # NOTE: We observe a sharp drop in the estimated testMSE (cv.error values) between 
  # the linear and quadratic fits, but then no clear improvement from using higher-
  # order polynomials.


# k-FOLD CROSS-VALIDATION
#------------------------

  # We can calso use cv.glm() to implement k-Fold CV

  # Remember: k = 5 or k = 10

set.seed(17)
cv.error.10=rep(0,10)

for (i in 1:10){
  glm.fit=glm(mpg~poly(horsepower, i), data=Auto)
  cv.error.10[i] = cv.glm(Auto,glm.fit,K=10)$delta[1]
}
cv.error.10

# THE BOOTSTRAP
#--------------
  # NOTE: The "Portfolio" data is partof the ISLR package


  # Estimating the Accuracy of a STATISTIC OF INTEREST

    # Note: The bootstrap approach can be applied in almost all situations.
    # Fucntion summary p. 194

alpha.fn=function (data ,index){
  X=data$X [index]
  Y=data$Y [index]
  return ((var(Y)-cov (X,Y))/(var(X)+var(Y) -2* cov(X,Y))) # <- ALPHA
}

    # To estimate alpha for all 100 obs
alpha.fn(Portfolio ,1:100)

   # To randomly select 100 observations from the range 1:100 with replacement
alpha.fn(Portfolio ,1:100)

    # FOR AUTOMATED BOOTSTRAP ANALYSIS, RECORDING ALL CORRESPONDING ALPHA ESTIMATES,
    # AND COMPUTING THE RESULTING STANDARD ERRORS: 
boot(Portfolio ,alpha.fn,R=1000)

  # Estimating the Accuracy of a LINEAR REGRESSION MODEL

    # Comparing the bootsrap method of assessing variability to the SE formulas for
    # B0 and B1 from chapter 3.

