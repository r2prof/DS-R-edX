#===============Chapter-03 Bais Programming======================

## Conditional expressions
a <- 5

if(a!=0){
  print(1/a)
} else{
  print("No reciprocal for 0.")
}

library(dslabs)
data(murders)
murder_rate <- murders$total / murders$population*100000
murder_rate

## Here is a very simple example that tells us which states, if any, have a 
## murder rate lower than 0.5 per 100,000. The if statement protects us from the
## case in which no state satisfies the condition.

ind <- which.min(murder_rate)
ind
murder_rate[ind]
if(murder_rate[ind] < 0.5){
  print(murders$state[ind]) 
} else{
  print("No state has murder rate that low")
}

## If we try it again with a rate of 0.25, we get a different answer:

if(murder_rate[ind] < 0.25){
  print(murders$state[ind]) 
} else{
  print("No state has a murder rate that low.")
}

## A related function that is very useful is ifelse. This function takes three 
## arguments: a logical and two possible answers. If the logical is TRUE, the 
## value in the second argument is returned and if FALSE, the value in the third 
## argument is returned. Here is an example:


a <- 0
ifelse(a > 0, 1/a, NA)


## The function is particularly useful because it works on vectors. It examines 
## each entry of the logical vector and returns elements from the vector provided 
## in the second argument, if the entry is TRUE, or elements from the vector 
## provided in the third argument, if the entry is FALSE.


a <- c(0, 1, 2, -4, 5)
a
result <- ifelse(a > 0, 1/a, NA)
result

## This function can be readily used to replace all the missing values in a 
## vector with zeros:

data(na_example)
data
no_nas <- ifelse(is.na(na_example), 0, na_example) 
sum(is.na(no_nas))

## Two other useful functions are any and all. The any function takes a vector 
## of logicals and returns TRUE if any of the entries is TRUE. The all function 
## takes a vector of logicals and returns TRUE if all of the entries are TRUE. 
## Here is an example:

z <- c(TRUE, TRUE, FALSE)
any(z)

all(z)

## Defining functions

avg <- function(x){
  s <- sum(x)
  n <- length(x)
  s/n
}

class(avg)

x <- 1:100
identical(mean(x), avg(x))

for(i in 1:5){
  print(i)
}


## Vectorization and functionals
x <- 1:10
x
sqrt(x)
y <- 1:10
x*y

## sapply function

## The function sapply permits us to perform element-wise operations on any 
## function. Here is how it works:
  
x <- 1:10
x
sapply(x, sqrt)

