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

Push Pull Practice
