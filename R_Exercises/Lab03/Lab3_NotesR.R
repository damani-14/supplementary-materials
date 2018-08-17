# SETTING UP THE EXERCISE
library(ISLR)

  #--initial exploration
names(Smarket)
cor(Smarket[,-9])
attach(Smarket)
plot(Volume)


# LOGISTIC REGRESSION - PART 1
#-----------------------------
  # The glm() function fits generalized linear models, a class of models that 
  # includes logistic regression
  # NOTE: The syntax is similar to that of lm(), however the argument
  # family=binomial must be used in order to run a logistic regression, rather
  # than some other type of generalized model.

  #--fitting the model
glm.fits=glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
             data=Smarket, family=binomial)
summary(glm.fits)

  #--retrieving the coefficients
coef(glm.fits)
  # -or-
summary(gml.fits)$coef
  
  #--retrieving the coefficient p-values
summary(glm.fits)$coef[,4]

  #--predictions
      # NOTE: the type="response" argument is used to output probabilities
            # rather than other information such as the logit
glm.probs=predict(glm.fits,type="response")

  #--viewing a small portion of the predicted responses
glm.probs[1:10]

      # to confirm that the values returned correspond to the probabilities
            # of the desired response, we can check the dummy variables using
            # contrasts() on the response variable
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
glm.pred=rep("Down",1250)
glm.pred[glm.probs > .5]="Up"

  #--producing a confusion matrix to determine how many observations were
    # correctly or incorrectly classified
table(glm.pred,Direction)
            # caclulating the % correctly predicted, where n=number of obs.
            # ([Up,Up]+[Down,Down]/n)
(507+145)/1250

  #--testing model accuracy using the mean() function 
    # This is used to compute the fraction for which the prediction
    # was correct (in regard to the actual observed response e.g. - in this
    # example, the response is "Direction" in the original data)
performance = mean(glm.pred==Direction)

      # NOTE: (1 - performance %) gives us the TRAINING ERROR as the model was 
            # trained and tested on the same dataset, this error rate is 
            # misleading as it tends to UNDERESTIMATE the test error


# LOGISTIC REGRESSION - PART 2
#-----------------------------

  #--PARTITIONING A DATASET into TRAINING and TEST sets

      # prepare a vector to be used for INDEXING into the original dataset
            # based on it's defined criteria

            # i.e. -This refers to a vector of n elements, corresponding to 
            # the obs in our dataset
            
            # NOTE: This creates a BOOLEAN VECTOR since the elements are either
            # true or false.

train=(Year < 2005)

      # Boolean vectors can be used to obtain a subset of the rows or columns
            # of a matrix by using the vector as an argument in an indexing 
            # expression for the original dataset. (e.g. Smarket[train,])
            # Using the ! symbol REVERSES the elements in the Boolean vector,
            # MEANING FALSE becomes TRUE and TRUE becomes FALSE.
            # In this case, this is useful as we are interested in creating a
            # submatrix containing only records for 2005. This will become our
            # test set.

Smarket.2005 = Smarket[!train,]
Direction.2005 = Direction[!train]

            # These steps have created 3 items total:
                # 1: a BOOLEAN VECTOR ("train") for parsing our original data
                        # when TRAINING them model
                # 2: a TEST dataset comprising a submatrix of the original
                        # created using the ! operator on the vector ("train")
                # 3: a subset of the RESPONSE from the original dataset to 
                        # compare our TEST predictions to at the end when
                        # assessing the model's accuracy

  #--TRAINING a logistic regression model using the subset() function
      # to fit the model to the training dataset (pre-2005)
glm.fits = glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
             data=Smarket, family=binomial, subset=train)

  #--TESTING a logistic regression model (created above), on the TEST dataset
      # created earlier using the Boolean Vector we created called "train"
      # (2005 only)
glm.probs = predict(glm.fits,Smarket.2005,type="response")

  #--converting the predicted probabilities to CLASS LABELS
      # (as we did in Part 1), along with a CONFUSION MATRIX using table()
glm.pred = rep("Down",252)
glm.pred[glm.probs > 0.5]="Up"
table(glm.pred, Direction.2005)

  #--testing MODEL ACCURACY by calculating the TEST ERROR RATE for which the 
      # model incorrectly predicted the response (when compared to the
      # actual response values stored in the variable "Direction.2005")

      # percent correct
mean(glm.pred == Direction.2005)

      # percent incorrect (i.e. the TEST SET ERROR RATE)
mean(glm.pred != Direction.2005)

  #--EXPERIMENT 1: Can we improve this model? Recall that the p-values for the 
      # logistic regression model were underwhelming (not very small). The two
      # "best" predictors were Lag1 (and Lag 2). We will now re-fit the model
      # using ONLY those two predictors, and evaluate its effectiveness.

      # TRAINING the model
glm.fits = glm(Direction~Lag1+Lag2, data=Smarket, family=binomial, subset=train)

      # TESTING the model
glm.probs = predict(glm.fits, Smarket.2005, type="response")

          # assigning the CLASS LABELS
glm.pred = rep("Down",252)
glm.pred[glm.probs > .5] = "Up"

    # assessing the MODEL ACCURACY
      
      # creating the confusion matrix
table(glm.pred, Direction.2005)

      # caclulating the percent correct
mean(glm.pred==Direction.2005)

106/(106+76)

    # NOTE: These results appear to be a little better 56 % CORRECT
    # compared to the earlier 48 %.

  #--EXPERIMENT 2: Suppose that we wish to predict the current days direction 
    # using particular values for Lag1 & Lag2 to generate expected market return.
    # This is accomplished using the predict() function

predict(glm.fits,newdata=data.frame( Lag1 = c(1.2,1.5), Lag2 = c(1.1,-0.8)),
        type="response")


# LINEAR DISCRIMINANT ANALYSIS
#-----------------------------
  # In R we use the lda() function for fitting LDA models, which is part of the
  # MASS library. Notice that the syntax is identical to lm(), and glm() except
  # for the absence of the "family" option (e.g. - family=binomial)

library(MASS)

  #--TRAINING the model
lda.fit = lda(Direction~Lag1+Lag2, data=Smarket, subset=train)
lda.fit

    # Interpreting the Output of the LDA model

      # "PRIOR PROBABILITIES"
        # Down | 0.491984 and Up | 0.508016 are your ^pi-sub-k values
        # i.e. - the probability that a given observation is associated with the
        # k-th category of the response variable Y
        #
        # For this exercise, these ^pi-sub-k values are interpreted as:
        # 49.2 % of the observed days (Y) in the TRAINING set were "Up" days

      # "GROUP MEANS"
        # These are the AVERAGE of each PREDICTOR within each CLASS
        # The lda() function used these as ESTIMATES of mu-sub-k
        #
        # For this exercise, these values suggest that there is a tendency for
        # the previous two days' returns to be positive on days when the market
        # decreases, and a tendency for the previous two days' returns to be 
        # negative when the market increases. (i.e. - 2 down days lead to 1 up)

      # "COEFFICIENTS OF LINEAR DISCRIMINANTS"
        # This output provides the LINEAR COMBINATION of Lag1 an Lag2 that are
        # used to form the LDA decision rule. (i.e. - these are the multipliers
        # of the elements of X = x) Eqn. 4.19
        #
        # For this exercise, if -0.642xLag1 - 0.514xLag2 is LARGE, then the LDA
        # classifier will PREDICT a market INCREASE, and if it is small, LDA 
        # predicts a market decrease.

  #--TESTING the model
lda.pred = predict(lda.fit, Smarket.2005)

  # Interpreting the Output of the Predict Function
names(lda.pred)
    # The predict function returns a list with three elements:
      # "CLASS" - contains the LDA's predicted response for Y (e.g. - Direction)
      # "POSTERIOR" - a matrix whose k-th column contains the POSTERIOR PROB.
          # that the corresponding observation belongs to the k-th class
          # (Eqn. 4.10)
      # "X" - contains the LINEAR DISCRIMINANTS described earlier.

  #--assessing MODEL ACCURACY
lda.class = lda.pred$class

    # creating a confusion matrix
table(lda.class, Direction.2005)
    # NOTE: the LDA and LOGISTIC RREGRESSION predictions are almost identical

  #--finding the total number of observations that fall into each class

    # for a threshold of 50 %
sum(lda.pred$posterior[,1] >= .5)
sum(lda.pred$posterior[,1] < 0.5)

  #--EXPERIMENT
    # Suppose we wished to use a threshold other than posterior prob. > or < 50%?
sum(lda.pred$posterior[,1] > .9)

      # NOTE: That we rceive a 0 for this threshold because no days in 2005 meet
      # that threshold.

    #--SUMMARY
      # The LDA model computes the posterior probabilities for the observations
      # passed to it. In this case, the posterior probs. correspond to the
      # probabilities that the market will decrease (e.g. - probability of 
      # whether each observation is likely to be a "Down" day), therefore, when 
      # we receive a posterior probability lower than our threshold, that 
      # specific observation should be classified as "Up". We can see that this 
      # is in fact the case by running the following two commands:
lda.pred$posterior[1:20,1]
lda.class[1:20]


# QUADRATIC DISCRIMINANT ANALYSIS
#--------------------------------
  # The qda() function is also a part of the MASS library
  # The syntax is identical to the lda() function
  # The output is also the same EXCEPT it does not print out the coefficients of
  # the lindear discriminants, because the QDA classifier involves a quadratic,
  # rather than a linear, function of the predictors.

  #--TRAINING
qda.fit = qda(Direction~Lag1+Lag2, data=Smarket, subset=train)
qda.fit

  #--TESTING
qda.class=predict(qda.fit, Smarket.2005)$class

  #--ACCURACY ASSESSMENT
    
    # confusion matrix
table(qda.class,Direction.2005)

    # percent correct
mean(qda.class==Direction.2005)

  # NOTE: Interestingly, the QDA predictions are accurate 60 % of the time
          # (even though the 2005 data was not used in training)


# K-NEAREST NEIGHBORS CLASSIFICATION - PART 1
#--------------------------------------------
  # The knn() function is part of the "class" library
library(class)
  # Note that this functions works differently from the other model fitting 
  # functions that we've encountered thus far. Rather than the two-step approach
  # we've used with the others, knn() makes predictions using one command.
  # The function knn() receives 4 inputs:
      # The data set is split into three groups <suggested naming>: 
        # 1. Training predictors <train.X>
        # 2. Test predictors <test.X>
        # 3. Training responses (their class labels) <train.Y> 
            # or <train."response name">
      # The value of K (k = number of nearest neighbors)

        # NOTE: cbind()--"column bind"--is used to bind the 2 predictors
        # to create a matrix. The cdbind() function is used separately to make
        # the training and test sets
train.X = cbind(Lag1, Lag2)[train,]
test.X = cbind(Lag1, Lag2)[!train,]
train.Y = Direction[train]

  # Finally, four inputs are passed to knn(): train.X, test.X, train.Y, and k
      # NOTE: WE SET A RANDOM SEED BEFORE WE APPLY knn() BECAUSE IF SEVERAL
      # OBSERVATIONS ARE TIED AS NEAREST NEIGHBORS, THEN R WILL RANDOMLY BREAK
      # THE TIE. THEREFORE, A SEED MUST BE SET IN ORDER TO ENSURE REPRODUCIBILITY
      # OF RESULTS.
set.seed(1)
knn.pred = knn(train.X, test.X, train.Y, k=1)

  # Assessing the model accuracy
table(knn.pred, Direction.2005)

(83 + 43) / 252

  # EXPERIMENT:
    # Notice that k=1 produces low quality results. Increasing k to 3 or above
    # only slightly improves them. Therefore, it appears that for this data set,
    # the QDA provides the best results of the methods we have examined SO FAR.
knn.pred = knn(train.X, test.X, train.Y, k=3)

  #--confusion matrix
table(knn.pred, Direction.2005)

  #--percent correct
mean(knn.pred==Direction.2005)


# K-NEAREST NEIGHBORS CLASSIFICATION - PART 2
#--------------------------------------------
