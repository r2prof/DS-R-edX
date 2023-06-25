# CH-02
#---------------
a <- 1
b <- 1
c <- -1
(-b + sqrt(b^2 - 4*a*c) ) / ( 2*a )
log(8)

data()

library(dslabs)

data(murders)

murders

(class(murders))

# The function str is useful for finding out more about the structure of an object:
str(murders)

head(murders)

tail(murders)

murders$population

murders$region

# We can quickly access the variable names using:
names(murders)

# Try typing murders$p then hitting the tab key on your keyboard
murders$population


pop <- murders$population

length(pop)

class(pop)

class(murders$state)

z <- 3 == 2
z
class(z)

## Factors
class(murders$region)

## Factors are useful for storing categorical data. We can see that 
## there are only 4 regions by using the levels function:

levels(murders$region)

## In the background, R stores these levels as integers and keeps a map to 
## keep track  of the labels. This is more memory efficient than storing 
## all the characters

## Suppose we want the levels of the region by the total number of murders 
## rather than alphabetical order. If there are values associated with each 
## level, we can use the reorder and specify a data summary to determine 
## the order. The following code takes the sum of the total murders in 
## each region, and reorders the factor following these sums.

region <- murders$region
region
value <- murders$total
value
region <- reorder(region, value, FUN = sum)
levels(region)

## The new order is in agreement with the fact that the Northeast has the 
## least murders and the South has the most.

## Lists: Data frames are a special case of lists. Lists are useful because 
## you can store any combination of different types.

record <- list(name = "Muhammad Raza",
               student_id = 1234,
               grades = c(95, 92, 91, 97, 93),
               final_grade = "A")
record
# same-------
record$student_id
record[["student_id"]]
#------------
record$name
record$grades
record$grades

record2 <- list("John Doe", 1234)

record2

## If a list does not have names, you cannot extract the elements with $, 
## but you can still use the brackets method and instead of providing the 
## variable name, you provide the list index, like this:

record2[[1]]

## Matrices

## Matrices have a major advantage over data frames: we can perform matrix 
## algebra operations, a powerful type of mathematical technique

mat <- matrix(1:12, 4, 3)
mat

## You can access specific entries in a matrix using square brackets ([). 
## If you want the second row, third column, you use:

mat[2, 3]

## If you want the entire second row, you leave the column spot empty:

mat[2, ]

## If you want the entire third column, you leave the row spot empty:

mat[, 3]

## This is also a vector, not a matrix.

## You can access more than one column or more than one row if you like. 
## his will give you a new matrix.

mat[, 2:3]

## You can subset both rows and columns:

mat[1:2, 2:3]

## We can convert matrices into data frames using the function as.data.frame:

df = as.data.frame(mat)
df

## You can also use single square brackets ([) to access rows and columns 
## of a data frame:

data("murders")
murders
murders[25, 1]

murders[2:3, ]


## Creating vectors
## We can create vectors using the function c, which stands for concatenate. 
## We use c to concatenate entries in the following way:
codes <- c(380, 124, 818)
codes

## We can also create character vectors. We use the quotes to denote that 
## the entries are characters rather than variable names.
country <- c("italy", "canada", "egypt")
country

## In R you can also use single quotes:
country <- c('italy', 'canada', 'egypt')
country

## Names
## Sometimes it is useful to name the entries of a vector. For example, 
## when defining a vector of country codes, we can use the names to connect 
## the two:
  
codes <- c(italy = 380, canada = 124, egypt = 818)
codes

class(codes)
names(codes)

## If the use of strings without quotes looks confusing, know that you can 
## use the quotes as well:

codes <- c("italy" = 380, "canada" = 124, "egypt" = 818)
codes

## Sequences
## Another useful function for creating vectors generates sequences:
seq(1, 10)
seq(1, 10, 2)
1:10
class(1:10)
seq(1, 10, 0.5)
class(seq(1, 10, 0.5))

## Subsetting
## We use square brackets to access specific elements of a vector. 
## For the vector codes we defined above, we can access the second element using:

codes[2]
codes[c(1,3)]

## The sequences defined above are particularly useful if we want to access, 
## say, the first two elements:

codes[1:2]

## If the elements have names, we can also access the entries using these names. 
## Below are two examples.

codes["canada"]

codes[c("egypt","italy")]


## Coercion
## In general, coercion is an attempt by R to be flexible with data types. When 
## an entry does not match the expected, some of the prebuilt R functions try 
## to guess what was meant before throwing an error. This can also lead to 
##confusion. Failing to understand coercion can drive programmers crazy when 
## attempting to code in R since it behaves quite differently from most other 
## languages in this regard

## So if we try to combine, say, numbers and characters, you might expect an 
## error:
x <- c(1, "canada", 3)
x

## But we don't get one, not even a warning! What happened? Look at x 
## and its class:
class(x)

## R coerced the data into characters

## R also offers functions to change from one type to another. For example, you 
## can turn numbers into characters with:

x <- 1:5
y <- as.character(x)
y

## You can turn it back with as.numeric:

y = as.numeric(y)
class(y)

## Not availables (NA)
## When a function tries to coerce one type to another and encounters an 
## impossible case, it usually gives us a warning and turns the entry into a 
## special value called an NA for "not available". For example:
x <- c("1", "b", "3")
as.numeric(x)

## Sorting
## Now that we have mastered some basic R knowledge, let's try to gain some 
## insights into the safety of different states in the context of gun murders.

## The function sort sorts a vector in increasing order. We can therefore see 
## the largest number of gun murders by typing:
library(dslabs)
data(murders)
sort(murders$total)

## However, this does not give us information about which states have which murder 
## totals. For example, we don't know which state had 1257.

## Order
## The function order is closer to what we want. It takes a vector as input and 
## returns the vector of indexes that sorts the input vector. This may sound 
## confusing so let's look at a simple example. We can create a vector and sort it:
  
x <- c(31, 4, 15, 92, 65)
sort(x)

## Rather than sort the input vector, the function order returns the index that 
## sorts input vector:
index <- order(x)
x[index]

murders$state[1:6]
murders$abb[1:6]

ind <- order(murders$total) 
murders$state[ind]
murders$abb[ind]

## According to the above, California had the most murders


## max and which.max
## If we are only interested in the entry with the largest value, we can use max
## for the value:

max(murders$total)

i_max <- which.max(murders$total)
murders$state[i_max]

## For the minimum, we can use min and which.min in the same way.

## Rank
## Although not as frequently used as order and sort, the function rank is 
## also related to order and can be useful. For any given vector it returns a 
## vector with the rank of the first entry, second entry, etc., of the input 
## vector. Here is a simple example:

x <- c(31, 4, 15, 92, 65)
rank(x)

# Beware of recycling
x <- c(1,2,3)
y <- c(10, 20, 30, 40, 50, 60, 70)
x+y

# Vector arithmetics

library(dslabs)
data("murders")
View(murders)

## California had the most murders, but does this mean it is the most dangerous 
## state? What if it just has many more people than any other state? We can  
## quickly confirm that California indeed has the largest population:

murders$state[which.max(murders$population)]
murders$population

## It is therefore unfair to compare the totals if we are interested in learning
## how safe the state is. What we really should be computing is the murders per 
## capita. The reports we describe in the motivating section used murders per 
## 100,000 as the unit. To compute this quantity, the powerful vector arithmetic
## capabilities of R come in handy.

## In R, arithmetic operations on vectors occur element-wise. For a quick example, 
## suppose we have height in inches:


inches <- c(69, 62, 66, 70, 70, 73, 67, 73, 67, 70)
inches * 2.54

inches - 69

murder_rate <- murders$total / murders$population * 100000
murder_rate

murders$abb[order(murder_rate)]

## Indexing
## Subsetting with logicals
murder_rate <- murders$total / murders$population * 100000 


## Another powerful feature of R is that we can use logicals to index vectors. 
## If we compare a vector to a single number, it actually performs the test for 
## each entry. The following is an example related to the question above:

ind <- murder_rate < 0.71
ind


## Note that we get back a logical vector with TRUE for each entry smaller than 
## or equal to 0.71. To see which states these are, we can leverage the fact that
## vectors can be indexed with logicals.


murders$state[ind]

## In order to count how many are TRUE, the function sum returns the sum of the 
## entries of a vector and logical vectors get coerced to numeric with TRUE coded 
## as 1 and FALSE as 0. Thus we can count the states using:

sum(ind)

## Logical operators

TRUE & TRUE

TRUE & FALSE

FALSE & FALSE

west <- murders$region == "West"
safe <- murder_rate <= 1

ind <- safe & west
murders$state[ind]

## which
## Suppose we want to look up California's murder rate. For this type of 
## operation, it is convenient to convert vectors of logicals into indexes instead 
## of keeping long vectors of logicals. The function which tells us which entries 
## of a logical vector are TRUE. So we can type:

ind <- which(murders$state == "California")
murder_rate[ind]

## match
## If instead of just one state we want to find out the murder rates for several 
## states, say New York, Florida, and Texas, we can use the function match. This 
## function tells us which indexes of a second vector match each of the entries 
## of a first vector:

ind <- match(c("New York", "Florida", "Texas"), murders$state)
ind

murder_rate[ind]

## %in%
## If rather than an index we want a logical that tells us whether or not each 
## element of a first vector is in a second, we can use the function %in%. Let's 
## imagine you are not sure if Boston, Dakota, and Washington are states. You can 
## find out like this:
c("Boston", "Dakota", "Washington") %in% murders$state

## There is a connection between match and %in% through which. To see this, notice 
## that the following two lines produce the same index (although in different order):

match(c("New York", "Florida", "Texas"), murders$state)

which(murders$state%in%c("New York", "Florida", "Texas"))

## Basic plots
## The plot function can be used to make scatterplots. Here is a plot of total 
## murders versus population.

x <- murders$population / 10^6
y <- murders$total
plot(x, y)

## For a quick plot that avoids accessing variables twice, we can use the with function:

with(murders, plot(population, total))

x <- with(murders, total / population * 100000)
hist(x)

murders$state[which.max(x)]

murders$rate <- with(murders, total / population * 100000)
boxplot(rate~region, data = murders)

x <- matrix(1:120, 12, 10)
image(x)
