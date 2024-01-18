# CH-06
#------------

## How to extract data from a package into the working directory of R

filename <- "murders.csv"
dir <- system.file("extdata", package = "dslabs") 
fullpath <- file.path(dir, filename)
file.copy(fullpath, "murders.csv")


library(tidyverse)
dat <- read_csv("murders.csv")

system.file(package = "dslabs")

## The strings separated by slashes are the directory names. The first slash 
## represents the root directory and we know this is a full path because it 
## starts with a slash. If the first directory name appears without a slash in 
## front, then the path is assumed to be relative. We can use the function 
## list.files to see examples of relative paths.


dir <- system.file(package = "dslabs")
list.files(path = dir)

wd <- getwd()
wd


## Generating path names
## Another example of obtaining a full path without writing out explicitly was 
## given above when we created the object fullpath like this:
  
filename <- "murders.csv"
dir <- system.file("extdata", package = "dslabs") 
fullpath <- file.path(dir, filename)
fullpath


## The function system.file provides the full path of the folder containing all 
## the files and directories relevant to the package specified by the package 
## argument. By exploring the directories in dir we find that the extdata 
## contains the file we want:

dir <- system.file(package = "dslabs")
dir
filename %in% list.files(file.path(dir, "extdata"))


## The system.file function permits us to provide a subdirectory as a first 
## argument, so we can obtain the fullpath of the extdata directory like this:

dir <- system.file("extdata", package = "dslabs") 
dir

## The function file.path is used to combine directory names to produce the full 
## path of the file we want to import.


fullpath <- file.path(dir, filename)
fullpath


## Copying files using paths
## The final line of code we used to copy the file into our home directory used
## the function file.copy. This function takes two arguments: the file to copy 
## and the name to give it in the new directory.


file.copy(fullpath, "murders.csv")

## If a file is copied successfully, the file.copy function returns TRUE. Note 
## that we are giving the file the same name, murders.csv, but we could have 
## named it anything. Also note that by not starting the string with a slash, 
## R assumes this is a relative path and copies the file to the working directory.

## You should be able to see the file in your working directory and can check 
## by using:
  
list.files()

## The readr and readxl packages
## In this section we introduce the main tidyverse data importing functions. 
## We will use the murders.csv file provided by the dslabs package as an example. 
## To simplify the illustration we will copy the file to our working directory 
## using the following code:
  
  
filename <- "murders.csv"
dir <- system.file("extdata", package = "dslabs") 
fullpath <- file.path(dir, filename)
file.copy(fullpath, "murders.csv")

## readr
## The readr library includes functions for reading data stored in text file 
## spreadsheets into R. readr is part of the tidyverse package, or you can load 
## it directly:
  
library(readr)
read_lines("murders.csv", n_max = 3)

dat <- read_csv("murders.csv")
dat
View(dat)

## Finally, note that we can also use the full path for the file:
  
dat <- read_csv(fullpath)
dat

## readxl
## You can load the readxl package using

library(readxl)

## Downloading files
## Another common place for data to reside is on the internet. When these data 
## are in files, we can download them and then import them or even read them 
## directly from the web. For example, we note that because our dslabs package 
## is on GitHub, the file we downloaded with the package has a url:
  
url <- "https://raw.githubusercontent.com/rafalab/dslabs/master/inst/
extdata/murders.csv"
url

## The read_csv file can read these files directly:

dat <- read_csv(url)

## If you want to have a local copy of the file, you can use the download.file 
## function:
download.file(url, "murders1.csv")

## This will download the file and save it on your system with the name 
## murders.csv. You can use any name here, not necessarily murders.csv. 
## Note that when using download.file you should be careful as it will overwrite 
## existing files without warning.

## Two functions that are sometimes useful when downloading data from the 
## internet are tempdir and tempfile. The first creates a directory with a 
## random name that is very likely to be unique. Similarly, tempfile creates a 
## character string, not a file, that is likely to be a unique filename. So you 
## can run a command like this which erases the temporary file once it imports 
## the data:
  
tmp_filename <- tempfile()
download.file(url, tmp_filename)
dat <- read_csv(tmp_filename)
file.remove(tmp_filename)

##  R-base importing functions
## R-base also provides import functions. These have similar names to those in 
## the tidyverse, for example read.table, read.csv and read.delim. However, 
## there are a couple of important differences. To show this we read-in the data 
## with an R-base function:
  
dat2 <- read.csv("murders.csv")
class(dat2)

## An important difference is that the characters are converted to factors:

class(dat2$abb)

class(dat2$region)

## This can be avoided by setting the argument stringsAsFactors to FALSE

dat <- read.csv("murders.csv", stringsAsFactors = FALSE)
dat

class(dat)

## In our experience this can be a cause for confusion since a variable that was 
## saved as characters in file is converted to factors regardless of what the 
## variable represents. In fact, we highly recommend setting stringsAsFactors=FALSE 
## to be your default approach when using the R-base parsers. You can easily 
## convert the desired columns to factors after importing data.

## scan
## When reading in spreadsheets many things can go wrong. The file might have a 
## multiline header, be missing cells, or it might use an unexpected encoding

## With experience you will learn how to deal with different challenges. 
## Carefully reading the help files for the functions discussed here will be 
## useful. With scan you can read-in each cell of a file. Here is an example:

path <- system.file("extdata", package = "dslabs")
filename <- "murders.csv"
x <- scan(file.path(path, filename), sep=",", what = "c")
x[1:10]

## Note that the tidyverse provides read_lines, a similarly useful function.















