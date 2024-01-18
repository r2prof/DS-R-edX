# CH-06 
# Data Table
#---
library(dplyr)
library(dslabs)
library(data.table)

# The first step when using data.table is to convert the 
# data frame into a data.table object using the as.data.table function:
murders_dt <- as.data.table(murders)

# Column-wise subsetting

# Selecting with data.table is done in a similar way to subsetting matrices. 
# While with dplyr we write

select(murders, state, region)

# in data.table we use

murders_dt[, c("state", "region")] 

# We can also use the .() data.table notation to alert R that variables 
# inside the parenthesis are column names, not objects in the R environment. 

# So the above can also be written like this:

murders_dt[, .(state, region)]

# Adding or transformin variables

# We learned to use the dplyr mutate function with this example:
  
murders <- mutate(murders, rate = total / population * 100000)

# data.table uses an approach that avoids a new assignment 
# (update by reference). 

# This can help with large datasets that take up most of your computer’s memory. 
# The data.table := function permits us to do this:

murders_dt[, rate := total / population * 100000]

murders_dt

# This adds a new column, rate, to the table. Notice that, as in dplyr, 
# we used total and population without quotes.

# To define new multiple columns, we can use the := function with multiple 
# arguments:
  
murders_dt[, ":="(rate = total / population * 100000, rank = rank(population))]

# Reference versus copy

# The data.table package is designed to avoid wasting memory. So if you make 
# a copy of a table, like this:
x <- data.table(a = 1)
x
y <- x
y

# y is actually referencing x, it is not an new object: y just another name for x. Until you change y, a new object will not be made. However, the := function changes by reference so if you change x, a new object is not made and y continues to be just another name for x:

# You can also change x like this:
y[,a := 1]
x






















