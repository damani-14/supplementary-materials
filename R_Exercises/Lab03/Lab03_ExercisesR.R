# Exercise 10
  # This dataset (weekly) is similar to Smarket except that it contains 1,089 observations of
  # weeky returns for 21 years from 1990 to 2010

library(ISLR)
Weekly = Weekly

  # A - Generate numerical and graphical summaries. Look for trends.
names(Weekly)
summary(Weekly)
cor(Weekly[-9])

  # Similarly to Smarket, the strongest correlation observed is between Volume and Year (0.84194. 
  # The next strongest is between Lag5 and Lag4 (-0.07567)


  # B - Use the full dataset to LogReg Direction on Lag1:Lag5 as well as Volume
attach(Weekly)
glm.fits = glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
              data = Weekly, family = binomial)
summary(glm.fits)

  # The only observed predictor with a low p-value is Lag2 (p = 0.0296)

  # C - Compute the confusion matrix and overall fraction correct. Interpret.

glm.probs=predict(glm.fits,type="response")

  #--viewing a small portion of the predicted responses
glm.probs[1:10]

contrasts(Direction)

  #--converting the predicted probabilities to class labels:
    # The following two commands create a vector of class predictions based
    # on whether the predicted probability (of the response) is
    # greater than or less than 0.5 by FIRST using the rep() function
    # to create a vector of length == nrow(Smarket) with the string "Down"
    # in every cell and SECOND, modifying the new class labels vector by
    # replacing the elements of vector that correspond to row numbers in the 
    # probabilities vector (glm.probs) with "Up" for any element meeting 
    # the criteria >.5
    # ?rep()
    # rep(x) replicates (repeats) the values in x.
glm.pred=rep("Down",length(Weekly[,1]))
glm.pred[glm.probs > .5]="Up"

  #--producing a confusion matrix

table(glm.pred,Direction)

    # caclulating the % correctly predicted, where n=number of obs.
    # ([Up,Up]+[Down,Down]/n)
(550+54)/1089

      #--testing model accuracy using the mean() function 
        # This is used to compute the fraction for which the prediction
        # was correct (in regard to the actual observed response e.g. - in this
        # example, the response is "Direction" in the original data)
performance = mean(glm.pred==Direction)
        # NOTE: (1 - performance %) gives us the TRAINING ERROR as the model was 
        # trained and tested on the same dataset, this error rate is 
        # misleading as it tends to UNDERESTIMATE the test error
  
  # D - Create a training set of Year 1990 to 2008, and LogReg 
    # Direction on Lag2 only. Compute the confusion matrix and overall
    # fraction correct for predicting on the test set (2009 - 2010).
  
train = Year < 2009
test.x = Weekly[!train,]
test.y = Weekly$Direction[!train]

glm.train = glm(Direction~Lag2, data=Weekly, family=binomial, subset=train)
glm.test = predict(glm.train,test.x, type="response")

glm.pred = rep("Down", length(test.y))
glm.pred[glm.test > .5]="Up"

table(glm.pred,test.y)
(56 + 9)/104


  # E - Repeat D using LDA

lda.fit = lda(Direction~Lag2, data=Weekly, subset=train)
lda.fit

lda.test = predict(lda.fit,test.x)
lda.class = lda.test$class
table(lda.class,test.y)
(56 + 9)/104

  # F - Repeat D using QDA

qda.fit = qda(Direction~Lag2, data=Weekly, subset=train)
qda.fit

qda.test = predict(qda.fit, test.x)
qda.class = qda.test$class
    # or equivalently, for creating the class labels
      #>_ qda.class=predict(qda.fit, Smarket.2005)$class
table(qda.class,test.y)

    # calculating the percent correct
mean(qda.class==test.y)

  # G - Repeat D using KNN with K = 1
    # NOTE  the use of as.matrix() to ensure that the dimensions of the
    # training and test sets are not different (i.e. that test.X has the 
    # same dimensions as train.Y)

train.X = as.matrix(Lag2[train])
test.X = as.matrix(Lag2[!train])
train.Y = Direction[train]

set.seed(1)
knn.pred = knn(train.X,test.X,
               train.Y,
               k=1)

table(knn.pred,test.y)
mean(knn.pred==test.y)

  # H - Which of these methods provides the best results on this data?

    # LogReg
mean(glm.pred==test.y)
    # LDA
mean(lda.class==test.y)
    # QDA
mean(qda.class==test.y)
    # KNN
mean(knn.pred==test.y)

    # Linear Discriminant Analysis and Logistic Regression appear to 
    # perform the best on the data.

# Exercise 11
  # This exercise uses the Auto data set
  # The file "Auto" contains some missing values (demarcated by question marks "?")
  # in order to remove these values for computations, the na.strings parameter is passed
  # to the read.tabll() function in order to populate the "?" cells with na:
Auto = read.table("Auto.data",header=TRUE,na.strings="?")
fix(Auto)
  # now the rows with missing values (n=5) are removed using the na.omit() function:
Auto=na.omit(Auto)
attach(Auto)

  # A - create a binary variable mpg01 where 1 = mpg > median and 0 if mpg < median
  # create a new data frame containing mpg01 and the other Auto variables

mpg01 = rep(0, length(mpg))
mpg01[mpg > median(mpg)] = 1
Auto = data.frame(Auto, mpg01)

  # B - Explore the data graphically. Which other features seem useful in predicting mpg01?
pairs(auto)
par(mfrow=c(1,3))
boxplot(auto$horsepower~auto$mpg01)
boxplot(auto$weight~auto$mpg01)
boxplot(auto$acceleration~auto$mpg01)
boxplot(auto$displacement~auto$mpg01)
boxplot(auto$cylinders~auto$mpg01)
names(auto)
  # C - Split the data into training and test sets
#train.x = data.frame(auto[1:200,c(4,5,6)])
#test.x = data.frame(auto[201:392,c(4,5,6)])
#train.y = data.frame(auto$mpg01[1:200])
#test.y = data.frame(auto[201:392,10])

train = (year%%2 == 0)  # if the year is even
test = !train
train.x = Auto[train, ]
test.x = Auto[test, ]
test.y = mpg01[test]
train.y = mpg01[train]

  # D - Perform LDA. What is the test error?
lda.fit = lda(mpg01~horsepower + weight + displacement + cylinders,
              data = Auto, subset = train)
lda.pred = predict(lda.fit,test.x)
mean(lda.pred$class != test.y)

  # E - Perform QDA. What is the test error?
qda.fit = qda(mpg01~horsepower + weight + displacement + cylinders,
              data = Auto, subset = train)
qda.pred = predict(qda.fit, test.x)
mean(qda.pred$class != test.y)

  # F - Perform Logistic Regression. What is the test error?
glm.fit = glm(mpg01~horsepower + weight + displacement + cylinders,
              data = Auto, subset = train)
glm.probs = predict(glm.fit, test.x, data = Auto, type = "response")
glm.pred = rep(0, length(glm.probs))
glm.pred[glm.probs > 0.5] = 1
mean(glm.pred != test.y)

  # G - Perform KNN with several values of K. What test errors do you obtain?
        # Which value of K performs the best?
train.X = cbind(cylinders, weight, displacement, horsepower)[train,]
test.X = cbind(cylinders, weight, displacement, horsepower)[test,]
train.Y = mpg01[train]
set.seed(1)

# K = 1
knn.pred = knn(train.X, test.X, train.Y, k = 1)
mean(knn.pred != test.y)

# K = 10
knn.pred = knn(train.X, test.X, train.Y, k = 10)
mean(knn.pred != test.y)

# K = 100 (Works the best for this data)
knn.pred = knn(train.X, test.X, train.Y, k = 100)
mean(knn.pred != test.y)

# Exercise 12 - This problem involves writing functions

  # A-C: Write a function, Power(), the prints out the result of raising 2 to the 3rd power

Power = function(x,a){
  print(x^a)
}

Power(10,3)
Power(8,17)
Power(131,3)

  # D: Re-write the function to return an object containing the result

Power2 = function(x,a){
  result = x^a
  return(result)
}

  # E - Using Power2(), create a plot of f(x) = x^2
x = 1:10
plot(log="x",Power2(x,2), xlab = "X", ylab = "Power2()", main = "Plot of X^2")

  # F - Create a function PlotPower, that allows you to plot x against x^a

PlotPower=function(x,a){
  y = x^a
  plot(x,y)
}