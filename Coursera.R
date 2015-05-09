#Set Working Directory
setwd("C:/Users/KGH/OneDrive/Coursera/R")

#Write a simple function
myfunction <- function(){
  x <- rnorm(100)
  mean(x)
}

#Print contents of working directory
dir()

#List contents of WD
ls()

#Write another simple function
second <- function(x) {
  x + rnorm(length(x))
}

#Load/read .R code from a file or connetion 
#source("Coursera_R.R") #Really for R not RStudio

##Practice from Data Types R Lecture
#Creating vectors with c - concatenation

x <- c(0.5, 0.6) 
y <- c(TRUE,FALSE)
y2 <- c(T,F)
z <- c("a", "b", "c")
w <- 9:29
w1 <- c(1+0i, 2+4i)
t <- c("a",T)

#Explicit coerscion
k <- 0:6
class(k)
as.numeric(k)
as.logical(k)
as.character(k)
as.numeric(z)
as.logical(z)
as.complex(z)

#Lists
a <- list (1,"a",T, 1+4i)

##Practice from Matrices R Lection

m <- matrix (nrow = 2, ncol = 3)
dim(m)
attributes(m)

m <- matrix (1:6,nrow = 2, ncol = 3)

m <- 1:10
dim(m) <- c(2,5) # 2 rows and 5 columns

#Column and row binding
x <- 1:3
y <- 10:12
cbind(x, y)
rbind(x,y)

##Practice from Factors R Lecture
x <- factor (c("yes", "yes", "no", "yes", "no"))
table(x)
unclass(x)
x <- factor (c("yes", "yes", "no", "yes", "no"),
             levels = c("yes", "no"))

##Practice from Missing Values R Lecture
x <- c(1,2,NA,10,3,NaN)
is.na(x)
is.nan(x)

##Pracrtice from Data Frames R Lecture
x <- data.frame(foo = 1:4, bar = c(T,T,F,F))
nrow(x)
ncol(x)

##Pracrtice from Names Atributes R Lecture
x <- 1:3
names(x)
names(x) <- c("foo", "bar", "norf")
names(x)

x <- list(a = 1, b = 2, c = 3)
x

m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m

##Practice from Reading Tabular Data R Lecture
data <- read.table("practice.txt", head = T, sep = ",")
data1 <- read.csv("practice.txt")

##Practice from Reading Large Tables R Lecture
?read.table
initial <- read.table("practice.txt", nrows = 3, head = T, sep = ",")
classes <- sapply(initial,class)
tabALL <- read.table("practice.txt", nrows = 3, head = T, sep = ",", colClasses = classes)


##Practice from Textual Data Formats R Lecture
y <- data.frame(a = 1, b = "a")
dput(y)
dput(y, file = "y.R")
new.y <- dget("y.R")
new.y

x <- "foo"
y <- data.frame(a = 1, b = "a")
dump(c("x","y"), file = "data.R")
rm(x,y) #Removed x and y
source("data.R") 

####Practice from Interfaces to the Outside World R Lecture
str(file)
con <- file("practice.txt", "r")
data <- read.csv(con)
close(con)

con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)
head(x)

##Practice from Subsetting Basics R Lecture
x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[1:4]
x[x >"a"]
u <- x > "a"
u
x[u]

##Practice from Subsetting Lists R Lecture
x <- list(foo = 1:4, bar = 0.6)
x[1]#Return a list
x[2]
x[[1]]#Returns elements of the list
x$bar
x[["bar"]]#Same as above
x["bar"]#Single bracket always return a list

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1,3)]

name <- "foo"
x[[name]]#coputed index for 'foo'
x$name#element 'name' doesn't exist
x$foo#element 'foo' does exist

x <- list(a = list(10,12,14), b = c(3.14,2.81))
x[[c(1,3)]]#3rd lement of the 1st element
x[[1]][[3]]#Same as above
x[[c(2,1)]]#1st element of the 2nd element

##Practice from Subsetting a Matrix R Lecture
x <- matrix (1:6, 2, 3)#2 rows 3 columns
x[1,2]#1st row 2nd column
x[2,1]#2nd row 1st column
x[1,]#1st row all elements
x[,2]#2nd column all rows
x[1, 2, drop = FALSE]#Preserve the dimension of the object resulting in a 1x1 matrix
x[1,]
x[1, , drop = FALSE]

##Practice from Subsetting - Partial Matching R Lecture
x <- list(aardvark = 1:5)
x$a #Picking up the first letter of list aaedvark as an 'a'
x[["a"]]
x[["a", exact = FALSE]]

##Practice from Subsetting - Removing NA R Lecture
x <- c(1,2,NA,4,NA,6)
bad <- is.na(x) #New logical vector named 'bad' identifying NA
x[!bad] #X without 'bad' or NAs
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x,y)
x[good]
y[good]

airquality[1:6,] #First 6 rows all columns of built in airqualty dataset
good <- complete.cases(airquality) #Logical vector identifying which rows are complete
airquality[good,][1:6,] #From airquality dataset only the good rows and only the first 6

##Practice from Vectorized Operations R Lecture
x <- 1:4; y <- 6:9
x + y
x > 2 #Logical vector x greater than 2
x >= 2 #Logical vector x greater than or equal to 2
y == 8 #Logical vector if y is equal to 8
x * y
x / y

x <- matrix (1:4,2,2); y <- matrix(rep(10,4),2,2)
x * y #Element-wise multiplication
x / y
x %*% y #True matrix multiplication

#For quiz 1 
x <- 4
class(x)
x <- c(4, "a", TRUE)
class(x)
x <- c(1,3,5); y <- c(3,2,10)
rbind(x,y)
x <- list(2, "a", "b", TRUE)
x[[1]]
class(x[[1]])
x <- 1:4; y <- 2:3
x + y
class(x + y)
x <- c(17, 14, 4, 5, 13, 12, 10)
x[x >= 11] <- 4 #Changed each element that is greater than 10 to a 4

x <- read.csv("hw1_data.csv") #Create data,frame from given .csv
colnames(x) #Column names of data.frame
x[1:2,] # First 2 rows of data.frame
nrow(x) #Number of observations / rows
x[152:153,] #Extract last 2 rows
x[47,1] #Value of ozone in 47th row
bad <- is.na(x[,1]) #Logical identifying all NAs
sum(bad) #Count of the number of NAs
mean(x[!bad,][,1]) #Mean of the Ozone column exclusing and row with an NA in the ozone column
x[, c(1,4)] #Subset of only Ozone and Temp columns
good <- complete.cases(x[,c(1,4)])
x[good,c(1,4)][x$"Ozone" > 31,][x$"Temp" > 90,]

removeNA <- subset(x, !is.na(x$"Ozone" & x$"Temp"))
highOzTem <- subset(removeNA, removeNA$"Ozone" > 31 & 
                      removeNA$"Temp" > 90)
highOzTem[1:10,]
mean(highOzTem[,2])

removeNA <- subset(x, !is.na(x$"Temp"))
mon6 <- subset(removeNA, removeNA$Month == 6)
mean(mon6[,4])
mon5 <- subset(x, x$Month == 5)
max(mon5[,1], na.rm = TRUE)
