  # In this example, we wish to predict a baseball player's Salary using various
  # statistics related to player performance from the previous year

  # NOTE: The Salary variable is missing for some of the players.

library(ISLR)
fix(Hitters)
names(Hitters)

  # Check the data frame size
dim(Hitters)

  # To find out how many values are missing from each vector, we use is.na() which
  # returns a vector containing TRUE for missing elements and FALSE for non-missing 
  # elements. 
is.na(Hitters$Salary)

  # to find the total vals missing, we can apply the sum() function
sum(is.na(Hitters$Salary))
  
  # To Remove All ROWS That Have Missing Values, we use the na.omit() function:
Hitters = na.omit(Hitters)

#----------------------
# Best Subset Selection
#----------------------

  # To perform best subset selection, we use regsubsets()  (of the 'leaps' library)
  # This function identifies the best model that contains a given number of predictors
  # where BEST is quantified using RSS.

  # Note that the syntax for regsubsets() is the same as that for lm()
library(leaps)

regfit.full = regsubsets(Salary~.,Hitters)

  # The summary() command outputs the best set of variables for each model size
summary(regfit.full)

  # An asterisk indicates that a given variable is included in the corresponding model. 
  # For instance, this output indicates that the best two-variable model contains 
  # only Hits and CRBI.

  # NOTE: regsubsets() be default only returns the best eight-variable model. By passing the
  # "nvmax" argument to the regsubsets() function, we can define the maximum number of
  # allowable predictors
regfit.full = regsubsets(Salary~.,data=Hitters, nvmax=19)

  # Storing the summary data into a variable
reg.summary = summary(regfit.full)

  # The values stored in the variable are:
names(reg.summary)

  # We can examine these values ( R-squared, RSS, adjusted R-squares, Cp, and BIC), to try
  # to select the BEST overall model.

  # To view (for example) the R-squared ("rsq") values for each model
reg.summary$rsq

  # We can visualize these outputs to help us decide which model to select.
par(mfrow=c(2,2))
plot(reg.summary$rss,xlab="Number of Variables",ylab="RSS", type="l")
plot(reg.summary$adjr2,xlab="Number of Variables",ylab="Adjusted RSq", type="l")

  # Here, we will use points() to PUT POINTS ON A PLOT THAT HAS ALREADY BEEN CREATED instead 
  # of creating a new plot.

  # For this exercise, we will use which.max() to identify the location of the maximum point
  # of a vector. Then, we will use points() to plot a red dot to indicate the model with the
  # largest adjusted R-squared statistic
which.max(reg.summary$adjr2)
points(11, reg.summary$adjr2[11], col="red",cex=2,pch=20)


  # In a similar way, we can plot MINIMUMS of the Cp and BIC statistics for the Hitter models
plot(reg.summary$cp,xlab="Number of Variables",ylab="Cp",type="l")
which.min(reg.summary$cp)
  # NOTE: which.min() or which.max() can be passed DIRECTLY to plot() or points()
points(which.min(reg.summary$cp),reg.summary$cp[which.min(reg.summary$cp)],
       col="red",cex=2,pch=20)

plot(reg.summary$bic,xlab="Number of Variables",ylab="BIC",type="l")
points(which.min(reg.summary$bic),reg.summary$bic[which.min(reg.summary$bic)],
       col="red",cex=2,pch=20)

  # NOTE: the regsubsets() function has a built in plot function which can be used to 
  # display the selected variables for the best model with a given number of predictors, 
 # RANKED according to the BIC, CP, adjR2, or AIC.
plot(regfit.full,scale="r2")
plot(regfit.full,scale="adjr2")
plot(regfit.full,scale="Cp")
plot(regfit.full,scale="bic")

  # The TOP ROW of each plot contains a black square for each variable selected according to
  # the optimal model associated with that statistic.

  # We can use coeff() to see the coefficient estimates with a model of any subset evaluated
  # For instance, looking at the bic chart, we can se that several models share a BIC close
  # to -150. However, the model with the lowest BIC is the six-variable (6) model that 
  # contains only AtBat, Hits, Walks, CRBI, DivisionW, and PutOuts.

  # We can view this particular six-variable model's coefficients using coeff():
coef(regfit.full,6)

  # for more information on the plot capabilities built-in to regsubsets():
?plot.regsubsets


#----------------------------------------
# Forward and Backward Stepwise Selection
#----------------------------------------
  # To perform forward and backward stepwise selection we also use regsubsets() by passing
  # the arguments method="forward" and method="backward", respectively

regfit.fwd=regsubsets(Salary~.,data=Hitters,nvmax=19,method="forward")
summary(regfit.fwd)
regfit.bwd=regsubsets(Salary~.,data=Hitters,nvmax=19,method="backward")
summary(regfit.bwd)

  # In this exercise, we see that using forward selection, the best one-variable model 
  # contains only CRBI, and the best two-variable model additionaly includes Hits. For this
  # data set, the best 1-6 varbaible models are each IDENTICAL for best subset and foward
  # selection. However, the best seven-variable models for best subset, foward, and backward
  # selection are all different.

coeff(regfit.full,7)
coeff(regfit.fwd,7)
coeff(regfit.bwd,7)

#-----------------------------------------------------------------------------
# Choosing Among Models Using the Validation Set Approach and Cross-Validation
#-----------------------------------------------------------------------------

