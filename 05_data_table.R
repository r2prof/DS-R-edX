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

# Row-wise subsetting

# With dplyr, we filtered like this:
filter(murders, rate <= 0.7)

# With data.table, we again use an approach similar to subsetting matrices, 
# except like dplyr, data.table knows that rate refers to a column name and 
# not an object in the R environment:
murders_dt[rate <= 0.7]

# Summarizing data

# As an example, we will use the heights dataset:
heights_dt <- as.data.table(heights)

# In data.table, we can call functions inside .() and they will be 
# applied to columns So the equivalent of:
s <- heights |> summarize(avg = mean(height), sd = sd(height))
s

# in dplyr is the following in data.table:
s <- heights_dt[, .(avg = mean(height), sd = sd(height))]

# Multiple summaries
# We defined the following function to permit multiple column summaries 
# in dplyr:

median_min_max <- function(x){
    qs <- quantile(x, c(0.5, 0, 1))
    data.frame(median = qs[1], minimum = qs[2], maximum = qs[3])
  }

# In data.table we place a function call within .() to obtain the 
# three number summary:
heights_dt[, .(median_min_max(height))]

# We can order rows using the same approach we use for filter. 
# Here are the states ordered by murder rate:
murders_dt[order(population)]

# To sort the table in descending order, we can order by the negative of 
# population or use the decreasing argument:
murders_dt[order(population, decreasing = TRUE)] 

# Nested sorting
# Similarly, we can perform nested ordering by including more than one 
# variable in order:
murders_dt[order(region, rate)] 







