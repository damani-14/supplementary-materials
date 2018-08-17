###----------------------------------------------------
### (8) - This exercise relates to the COLLEGE data set
###----------------------------------------------------

college = read.csv("College.csv")

# rownames() retrieves or sets the row or column names of a matrix-like object
# in this case, we have set the first column to be the row names
# now, each row is associated with a specific university
rownames(college)=college[,1]

# fix() will open an editor window with the data in table form. The data set can be editied in this window and saved.
fix(college)

# although R will not try to do calculations on the 1st column now that it's set to row.names, we should still get
# rid of it
college=college[,-1]
fix(college)

attach(college)

# summarizing the data
summary(college)

# produce a SCATTERPLOT MATRIX of the first 10 columns using the pairs() function
pairs(college[,1:10])

# use the plot function to produce side-by-side boxplots of Outstate vs Private
# when plotting quantitative data (y) vs qualitative (x), as factor can be used to properly plot your
# qualitative data (in this case, x = Private: Yes or No)
private=as.factor(Private)
plot(Private,Outstate,xlab="Private Institution",ylab="Tuition")

# create a new qualitative variable, called "Elite", by binning the Top10perc variable.
### we are going to divide universities into two groups based on whether or not the 
###proportion of students coming from the top 10% of their high school 
### classes exceeds 50%

# 1st, create a new vector called "Elite"
# rep() replicates the values in x. here, we are repeating 'x', n times into the vector Elite
# i.e. - "No" 777 times into vector Elite
Elite=rep("No",nrow(college))

# to calculate percentage of student body who came from the top 10% of their high school
# and populate those instances with "Yes" in the new "Elite" vector:
Elite[college$Top10perc >50]="Yes"

# convert this new variable to a categorical/qualitative type
Elite=as.factor(Elite)

# create a new data frame by appending the vector "Elite" to our original 
# data frame, "college"
college=data.frame(college,Elite)

# print a summary to see how many schools now fall into the Elite category
summary(college)

# use the hist() function to produce some histograms with differing numbers of bins 
# for a few of the quantitative variables.
# use par(mfrow=c(2,2)) to divide the figure window into 4 panels.

par(mfrow=c(2,2))
hist(S.F.Ratio, breaks=25)
hist(Top25perc, breaks=20)
hist(Enroll, 30)
hist(Accept, 25)

###----------------------------------------------------
### (9) - This exercise relates to the AUTO data set
###----------------------------------------------------

# The file "Auto" contains some missing values (demarcated by question marks "?")
# in order to remove these values for computations, the na.strings parameter is passed
# to the read.tabll() function in order to populate the "?" cells with na:

auto = read.table("Auto.data",header=TRUE,na.strings="?")
fix(auto)

# now the rows with missing values (n=5) are removed using the na.omit() function:

auto=na.omit(auto)
dim(auto)

# (A) - which of the predictors are quantitative and whic are qualitative?
# Qualitative: Name, Origin
# Quantitative: mpg, cylinders, displacement, 
              # horsepower, weight, acceleration, year

# (B) - what is the range of all the variables? use the range() function:
attach(auto)
range(mpg)
# [1]  9.0 46.6
range(cylinders)
# [1] 3 8
range(displacement)
# [1]  68 455
range(horsepower)
# [1]  46 230
range(weight)
# [1] 1613 5140
range(acceleration)
# [1]  8.0 24.8
range(year)
# [1] 70 82

## Alternately, sapply() can be used to apply a function to a number of predictors:
sapply(auto[, 1:7], range)
#       mpg cylinders displacement horsepower weight acceleration year
# [1,]  9.0         3           68         46   1613          8.0   70
# [2,] 46.6         8          455        230   5140         24.8   82

# (C) - find the mean and standard deviation of each quantitative variable:
sd(mpg)
# [1] 7.805007
sd(cylinders)
# [1] 1.705783
sd(displacement)
# [1] 104.644
sd(horsepower)
# [1] 38.49116
sd(weight)
# [1] 849.4026
sd(acceleration)
# [1] 2.758864
sd(year)
# [1] 3.683737


## -or-


sapply(auto[, 1:7], mean)
#         mpg    cylinders displacement   horsepower       weight acceleration 
#   23.445918     5.471939   194.411990   104.469388  2977.584184    15.541327 
#        year 
#   75.979592

sapply(auto[, 1:7], sd)
#         mpg    cylinders displacement   horsepower       weight acceleration 
#    7.805007     1.705783   104.644004    38.491160   849.402560     2.758864 
#        year 
#    3.683737


# (D) - now remove the 10th through 85th observations. what is the range, mean, and 
# standard deviation of each predictor in the new subset of the data that remains?

asub1=auto[1:9,,drop=F]
asub2=auto[86:392,,drop=F]
subset=rbind(asub1,asub2)

rm(asub1,asub2)
fix(subset)


# -or-


subset = auto[-(10:85)]
sapply(subset[,1:7], range)
sapply(subset[,1:7], mean)
sapply(subset[,1:7], sd)

# (E) - using the full data set, investigate the predictors GRAPHICALLY, using scatterplots or other
# tools of your choice. Create some plots highlighting the relationships among the predictors.
# coment on your findings

pairs(auto[,1:7])

# STRONG NEGATIVE CORRELATION (displacement v mpg)
plot(displacement,mpg,xlab="Displacement",ylab="Miles Per Gallon")

# STRONG POSITIVE CORRELATION (weight v horsepower)
plot(weight,horsepower,xlab="Weight",ylab="Horsepower")

# (F) - SUppose we wish to predict gas mileage (mpg) on the basis of other variables. DO your plots
# suggest that any of the other variables might be useful in predicting mpg? Justify your answer

# Yes. Displacement, horsepower, and weight all show strong negative correlations vs mileage.

###----------------------------------------------------
### (10) - This exercise relates to the BOSTON data set
###----------------------------------------------------

# (A) - The Boston data set is part of the MSS library in R:
library(MASS)

    # Read about the data set
?Boston

    # Add the Boston data to your working environment if desired
boston = Boston
attach(boston)

    # r = 506; c = 14
    # The rows represents neighborhoods of Boston and each column measures various statistics about the
    # population and structural features of each area

# (B) - make some pairwise scatterplots of the predictors.
# describe your findings
pairs(boston)

# STRONG POSITIVE medv v rm
      # Suggests that increased home value is correlated with greater number of rooms
# INVERSE CORRELATION medv v lstat
      # Suggests that increased home value is correlated to areas lower percent lowest population
# INVERSE CORRELATION dis v nox
      # Suggests that increased distance from from major employment areas is correlated with lower nitrogen oxides in ppm

# (C) - Are any of the predictors associated with per capita crime rate? If so,
# explain the relationship.
par(mfrow=c(4,4))
plot(crim,zn,ylab="zn")
plot(crim,indus,ylab="industry")
plot(crim,chas,ylab="chas")
plot(crim,nox,ylab="Nitro")
plot(crim,rm,ylab="Rooms")
plot(crim,age,ylab="Age")
plot(crim,dis,ylab="Dist. Emp")
plot(crim,rad,ylab="Hwy. Radius")
plot(crim,tax,ylab="Tax Rate")
plot(crim,ptratio,ylab="Pupil to Teacher Ratio")
plot(crim,black,ylab="Black")
plot(crim,lstat,ylab="L. Status")
plot(crim,medv,ylab="Med. Home Val.")

# Weak positive relation with Number of Rooms
# Higher crime rates in areas with higher average age
# Strong relationship with closer proximity to employment
# Strong relationship with proportion black
# Moderate positive relation between % lower status & higher crime
# Strong relationship between lower median home value and higher crime
# Strong corelation between greater percentage retail space and higher crime rate

# (D) - There appears to be fewer suburbs with high crime rates than areas closer to employment centers
        range(dis)
        # [1]  1.1296 12.1265
        # There is a significant spike in the crime rate for areas taxed between $600:700 per $10,000
        range(tax)
        # [1] 187 711
        # There is a strong correlation between higher pupil to teacher ratio and increased crime rate
        range(ptratio)
        # [1] 12.6 22.0


# (E) - How many of the suburbs in this data set bound the Charles River?

nearRiver = subset(boston, chas == 1)
dim(nearRiver)
# n = 35

# (F) - What is the median pupil-teacher ratio among the towns in this data set?
summary(ptratio)
# Median = 19.05

# (G) - Which suburb of Boston has the lowest median value of owner-occcupied homes?
        # What are the values of the other predictors for that suburb, and how do those values compare to the 
                # overall ranges for those predictors? Comment on your findings.
lowest = subset(boston,medv == min(medv))
# Suburbs 399 and 406
t(lowest)
# 399      406
# crim     38.3518  67.9208
# zn        0.0000   0.0000
# indus    18.1000  18.1000
# chas      0.0000   0.0000
# nox       0.6930   0.6930
# rm        5.4530   5.6830
# age     100.0000 100.0000
# dis       1.4896   1.4254
# rad      24.0000  24.0000
# tax     666.0000 666.0000
# ptratio  20.2000  20.2000
# black   396.9000 384.9700
# lstat    30.5900  22.9800
# medv      5.0000   5.0000

# (H) - In this data set, how many of the suburbs average more than 7 rooms per dwelling? 
        # More than 8?
        # Comment on the suburbs that average more than eight rooms per dwelling.

rm7=subset(boston,rm > 7)
rm8=subset(boston,rm > 8)

summary(rm7)
summary(rm8)
pairs(rm7)
pairs(rm8)