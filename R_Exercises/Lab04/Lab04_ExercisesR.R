library(MASS)
attach(Default)
Default=Default

# Exercise 5
#-----------

set.seed(1)

# A
glm.fit = glm(default~income+balance, data=Default, family=binomial)

# B

FiveB = function(){
  train = sample(10000, 5000)
        # or similarly >_ train = sample(dim(Default)[1], dim(Default)[2])

  glm.fit = glm(default~income+balance,data=Default,family=binomial, subset=train)

  glm.probs = predict(glm.fit,Default[-train],data=Default,type="response")

  glm.pred=rep("No", 5000)
  glm.pred[glm.probs[-train] > 0.5] = "Yes"

  table(glm.pred,default[-train])

  return(mean(glm.pred != default[-train]))
}

# C

FiveB()
# [1] 0.0236

FiveB()
# [1] 0.028

FiveB()
# [1] 0.0268

# D

FiveD = function(){
  train = sample(10000, 5000)
  # or similarly >_ train = sample(dim(Default)[1], dim(Default)[2])
  
  glm.fit = glm(default~income+balance+student,
                data=Default,family=binomial, subset=train)
  
  glm.probs = predict(glm.fit,Default[-train],data=Default,type="response")
  
  glm.pred=rep("No", 5000)
  glm.pred[glm.probs[-train] > 0.5] = "Yes"
  
  table(glm.pred,default[-train])
  
  return(mean(glm.pred != default[-train]))
}

FiveB()
FiveD()

  # The test errors are similar, therefore, adding the qualitative Student variable does
  # not appear to change the error rate when using the validation set approach

# Exercise 6
#-----------

# Compute estimates for the standard errors of the LogReg coefficients(default~inc.+bal.)
# using 1) the BOOTSTRAP and 2) THE STANDARD FORMULA

# A

train = sample(10000, 5000)

glm.fit = glm(default~income+balance,
              data=Default,family=binomial, subset=train)

glm.probs = predict(glm.fit,Default[-train],data=Default,type="response")

glm.pred=rep("No", 5000)
glm.pred[glm.probs[-train] > 0.5] = "Yes"

summary(glm.fit)
  # Coefficients:
  #  Estimate Std. Error z value Pr(>|z|)    
  #(Intercept) -1.145e+01  6.158e-01 -18.596  < 2e-16 ***
  #  income       2.146e-05  7.222e-06   2.971  0.00297 ** 
  #  balance      5.532e-03  3.125e-04  17.700  < 2e-16 ***
  #  ---

# B

boot.fn=function (dataset, index){
  return(coef(glm(default~income+balance,
                   data=dataset,family=binomial, subset=index)))
}


# C
boot(Default, boot.fn, R=50)

# Exercise 7
#-----------
weekly = Weekly
names(Weekly)

# A
glm.fit1 = glm(Direction~Lag1+Lag2, data=weekly, family=binomial)

# B
glm.fit2 = glm(Direction~Lag1+Lag2, data=weekly, family=binomial, subset=2:1089,)

# C
glm.prob = predict(glm.fit2,weekly[1,2:3], type="response")
glm.pred = "Down"
glm.pred[glm.prob > 0.5] = "Up"

glm.pred == weekly[1,9]

# Prediction == Actual = FALSE. No, the model was not correctly classified.

# D
n = length(weekly[,1])
misclass = 0

for (i in 1:1089){
  glm.fit = glm(Direction~Lag1+Lag2, data=weekly[-i,], family=binomial)
  glm.prob = predict(glm.fit,weekly[i,2:3], type="response")
  glm.pred = "Down"
  glm.pred[glm.prob > 0.5] = "Up"
  
  misclass = misclass + (glm.pred != weekly[i,9])
}

# E
misclass/n

# Exercise 8
#-----------

# A
set.seed(1)

x=rnorm(100)
y=x-2*x^2+rnorm(100)

# B
plot(x,y)

# C

?cv.glm

EightC = data.frame(cbind(y,x))
set.seed(1)

# i.
glm.fit = glm(y ~ x)
cv.glm(EightC, glm.fit)$delta


# ii.
glm.fit = glm(y ~ poly(x, 2))
cv.glm(EightC, glm.fit)$delta


# iii.
glm.fit = glm(y ~ poly(x, 3))
cv.glm(EightC, glm.fit)$delta


# iv.
glm.fit = glm(y ~ poly(x, 4))
cv.glm(EightC, glm.fit)$delta


# D
set.seed(10)

# i.
glm.fit = glm(y ~ x)
cv.glm(EightC, glm.fit)$delta


# ii.
glm.fit = glm(y ~ poly(x, 2))
cv.glm(EightC, glm.fit)$delta


# iii.
glm.fit = glm(y ~ poly(x, 3))
cv.glm(EightC, glm.fit)$delta


# iv.
glm.fit = glm(y ~ poly(x, 4))
cv.glm(EightC, glm.fit)$delta
