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

