### VECTORS, DATA, MATRICES, SUBSETTING

# Creating a vector 'x'

x=c(2,7,5)

# Creating a 'sequence' vector 'y'

?seq

# (3 values, starting from the number 4, in steps of 3)

y=seq(from=4,length=3,by=3)

# Vector Operations (conducted in 'parallel' i.e. - element-wise)

x + y
x/y
x^y

# Subscripting - convention using square braces [ ]
# Subscript index begins at 1

x[2]

# Subscripting a 'range' in x (from element 2 to element 3)

x[2,3]

# Removing an element and returing the subsetted vector
# e.g. - x[-2] will return elements 1 and 3

x[-2]

# Modifying a collection of values uses the function c( ) 'concatenate'
# Collection removed can be arbitrary
# e.g. - x[-c(1,2)] will return only the remaining element 3

x[-c(1,2)]

# NOTE: There are no 'scalars' in R. Everything is a vector,
#       therefore, the scalar 5 would be interpreted as a 
#       vector of length 1

# Creating matrices (2-way arrays)
# mat = matrix(values,rows,col)

?matrix

# z=matrix(seq(1,12),4,3) will create a 4x3 matrix of sequential values
#       from 1:12 stored in column order (i.e. - top to bottom
#       left to right)

z=matrix(seq(1,12),4,3)

# Subsetting matrices
# e.g. to return the 3rd and 4th row, 2nd and 3rd columns:

z[3:4,2:3]

# Subsetting columns requires use of a 'colon' operator ','
#       e.g. - z[,1] will return only the 1st column of z
#         z[,2,3] will return only the 2nd and 3rd columns

z[,2:3]

# NOTE: Subsetting a 'single' column of a matrix will return a 'vector'
#       This will 'drop' the sequences matrix status
# e.g. - z[,1] will return matrix z column 1 as a vector

z[,1]

#       To maintain a sequences matrix status, the modifier 'drop'
#         is used where 'FALSE' maintains matrix status:

z[,1,drop=FALSE]

# Querying the dimensions of a matrix requires the 'dim' function and 
#       returns r c

dim(z)

# To return all data and values in the working directory use 'ls'

ls()

# To cleanup the working directory, use rm(element)

rm(y)

### GENERATING RANDOM DATA

# In statistics it is often useful to rn simulations 
#   to test routines/ideas. So it is important to be able to
#   generate data

# To create 50 random uniforms, 'runif(n)' is used

?runif

# Runif returns a uniform distribution from 0:1

x=runif(50)

# To create a normal(gaussian) distribution from 1:n, 'rnorm(n)' is used

y=rnorm(50)

### GENERATING GRAPHICS

# To generate simple plots using variables 'x' and 'y':

plot(x,y)

# Annotate a plot and change the plotting character
        # using various example parameters:

plot(x,y,xlab="Random Uniform",ylab="Random Normal",pch="*",col="blue")

# Where:
        # xlab = x-axis label
        # ylab = y-axis label
        # pch = plotting character
        # col = point color

# For more info on plot point parameters:

?points

### SETTING OR QUERYING GRAPHICAL PARAMETERS
# Further parameters can be used to modify plots using the 'par' command

?par

        # e.g. - To create a panel of plots with 2 rows and 1 column
          # use mfrow(r,c) -or- mfcol=(r,c) 
          # then plot each element

par(mfrow=c(2,1))
plot(x,y)
hist(y)

        # NOTE: These parameters will remain in place until they are
          # reset

par(mfrow=c(1,1))

### READING DATA
        # variable = read.csv("~PATH")

Auto=read.csv("~DamanisMacBook/Documents/Supplementary_Materials/ISLR/Labs/Lab01/Auto.csv")

# Querying a data frame

names(Auto)
dim(Auto)
class(Auto)
sumary(Auto)

# Plotting from a data frame

plot(Auto$cylinders,Auto$mpg)
plot(Auto$cyl,Auto$mpg)

# To eliminate the need to use '$' indexing of the dataframe, use 'attach()'
        # By attaching the data frame, you create a workspace with all the 
        # named variables as variables in your workspace

        # NOTE: search() will print all of the known variables in the Global
                # Environment available for direct use

attach(Auto)

plot(cylinders,mpg)

# Tip: To plot values as a 'box plot':

cylinders=as.factor(cylinders)
plot(cylinders,mpg)

        # NOTE: as.factor() converts quantitative variables into qualitative
                # variables.

# If the variable plotted on the x-axis is categorial, then boxplots will
# automatically be produced by the plot() function. As usual, a number
# of options can be specified in order to customize the plots.

plot(cylinders,mpg)
plot(cylinders,mpg,col ="red")
plot(cylinders,mpg,col="red",xlab="cylinders",ylab="MPG")

# To clear this designation, use rm()

rm(cylinders)
plot(cylinders,mpg)

# The hist() function can be used to plot a histogram. Note that col=2
        # histogram has the same effect as col="red".
hist(mpg)
hist(mpg ,col =2)
hist(mpg ,col =2, breaks =15)

# We can also produce scatterplots for just a subset of the variables.

pairs(Auto)
pairs(∼ mpg + displacement + horsepower + weight +
           acceleration , Auto)

# We will often want to save the output of an R plot. 
# The command depends on the file type that we would like to create:
  
pdf("plot_title.pdf")
jpeg("plot_title.jpeg")

# The function dev.off() indicates to R that we are done creating the plot.
# Alternatively, we can simply copy and paste the plot window.
# MUST be run in order to save the image to disk

dev.off("plot_title.extension")

# Contour plots: contour() produces a plot for representing three-dimensional 
# data (similar to a topographical map). The function takes 3 arguments:
  
# 1.	A vector of the x values (the first dimension)
# 2.	A vector of the y values (the second dimension)
# 3.	A matrix whose elements correspond to the z value (the third dimension) for each pair of (x,y) coordinates.


y = x
f = outer(x,y,function(x,y)cos(y)/(1+x^2))
contour(x,y,f)
contour(x,y,f,nlevels=45,add=T)
fa=(f-t(f))/r
contour(x,y,fa,nlevels=15)

# The image() function works the same way as contour(), however, 
# it produces a color-coded plot whose colors depend on the z value. 
# AKA – “heatmap”. 

# Alternatively, persp() can be used to produce a three-dimensional plot. 
# Arguments theta and phi control the angles at which the plot is viewed.

image(x,y,fa)
persp(x,y,fa)
perp(x,y,fa,theta=30)
persp(x,y,fa,theta=30,phi=20)
persp(x,y,fa,theta=30,phi=70)
persp(x,y,fa,theta=30,phi=40)

# identify() provides a useful interactive method for identifying the value 
# for a particular variable for points on a plot. We pass in three arguments 
# to identify(): the x-axis variable, the y-axis variable, and the variable 
# whose values we would like to see printed for each point. Then clicking on 
# a given point in the plot will cause R to print the value of the variable 
# of interest. Right-clicking on the plot will exit the identify() function 
# (control-click on a Mac). The numbers printed under the identify() function 
# correspond to the rows for the selected points.

plot(horsepower,mpg)
identify(horsepower,mpg,name)