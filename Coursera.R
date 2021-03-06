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

###Practice for Coursera R Course Week 1
##Practice from Data Types R Lecture####
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

##Practice from Matrices R Lection####

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

##Practice from Factors R Lecture####
x <- factor (c("yes", "yes", "no", "yes", "no"))
table(x)
unclass(x)
x <- factor (c("yes", "yes", "no", "yes", "no"),
             levels = c("yes", "no"))

##Practice from Missing Values R Lecture####
x <- c(1,2,NA,10,3,NaN)
is.na(x)
is.nan(x)

##Pracrtice from Data Frames R Lecture####
x <- data.frame(foo = 1:4, bar = c(T,T,F,F))
nrow(x)
ncol(x)

##Pracrtice from Names Atributes R Lecture####
x <- 1:3
names(x)
names(x) <- c("foo", "bar", "norf")
names(x)

x <- list(a = 1, b = 2, c = 3)
x

m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m

##Practice from Reading Tabular Data R Lecture####
data <- read.table("practice.txt", head = T, sep = ",")
data1 <- read.csv("practice.txt")

##Practice from Reading Large Tables R Lecture####
?read.table
initial <- read.table("practice.txt", nrows = 3, head = T, sep = ",")
classes <- sapply(initial,class)
tabALL <- read.table("practice.txt", nrows = 3, head = T, sep = ",", colClasses = classes)

##Practice from Textual Data Formats R Lecture####
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

##Practice from Interfaces to the Outside World R Lecture####
str(file)
con <- file("practice.txt", "r")
data <- read.csv(con)
close(con)

con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)
head(x)

##Practice from Subsetting Basics R Lecture####
x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[1:4]
x[x >"a"]
u <- x > "a"
u
x[u]

##Practice from Subsetting Lists R Lecture####
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

##Practice from Subsetting a Matrix R Lecture####
x <- matrix (1:6, 2, 3)#2 rows 3 columns
x[1,2]#1st row 2nd column
x[2,1]#2nd row 1st column
x[1,]#1st row all elements
x[,2]#2nd column all rows
x[1, 2, drop = FALSE]#Preserve the dimension of the object resulting in a 1x1 matrix
x[1,]
x[1, , drop = FALSE]

##Practice from Subsetting - Partial Matching R Lecture####
x <- list(aardvark = 1:5)
x$a #Picking up the first letter of list aaedvark as an 'a'
x[["a"]]
x[["a", exact = FALSE]]

##Practice from Subsetting - Removing NA R Lecture####
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

##Practice from Vectorized Operations R Lecture####
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

##For quiz 1#### 
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

###Practice for Coursera R Course Week 2####
##Practice from Control Structures R Lectures
#Practice with if / else structures####
if(x > 3) {
    y <- 10
} else {
    y <-0
}
#Again
y <- if(x > 3) {
    10
} else {
    0
} # Same as above, but may be easier to read
#Practice with For loops####
for(i in 1:10) {
    print(1)
}
#Example of equivalent for loops
x <- c("a","b", "c", "d")

for(i in 1:4) {
    print(x[i])
}

for(i in seq_along(x)) {
    print(x[i])
}

for(letter in x) {
    print(letter)
}

for(i in 1:4) print(x[i]) #If only one expression don't need curly loops

x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) {
    for(j in seq_len(ncol(x))) {
        print(x[i, j])
    }
} #Carful with nesting beyond 2-3 levels as it gets difficult to understand/read
#Practice with While Loops####
count <- 0
while(count < 10) {
    print(count)
    Count <- count + 1
} #Carful with while loops as they are infinite until condition

z <- 5
while(z >= 3 && z <= 10) {
    print(z)
    coin <- rbinom(1, 1, 0.5) #Random generate a binomial (1 or 0) with length 1 and probablity of 0.5
    if(coin == 1) {##Random walk
        z <- z + 1
    } else {
        z <- z - 1
    }
}
#Practice with Repeat, Next, Break####
x0 <- 1
tol <- 1e-8
repeat {
    x1 <- computeEstimate() #Not a real function, just an example
    if(abs(x1 - x0) < tol) {
        break
    } else {
        x0 <- x1
    }
} #Dangerous because there's no guarantee it will stop, might be better to use for loop with hard limit

for(i in 1:100) {
    if(i <= 20) { #Skip the first 20 iterations
        next  
    }
    #Do something here
}

##Practice from First R Function R Lecture####
add2 <- function(x, y) {
    x + y
}

above10 <- function(x) {
    use <- x > 10
    x[use]
}

above <- function(x, n = 10) { #specify default to 10 unless given otherwise
    use <- x > n
    x[use]
}
x <- 1:20
above(x)
above(x, 12) #Specify explicitly numbers above 12

#Example of function with for loop
columnmean <- function(y, removeNA = TRUE) {#default will be to remove NAs
    nc <- ncol(y)
    means <- numeric(nc)
    for(i in 1:nc) {
        means[i] <- mean(y[,i], na.rm = removeNA)
    }
    means
}
columnmean(airquality)
columnmean(airquality, FALSE)

##Practice with Functions R Lecture####
# Lecture Part 1####
mydata <- rnorm(100)
sd(mydata)
sd(x = mydata)
sd(x = mydata, na.rm = FALSE)
sd(na.rm = FALSE, x = mydata) #Order of arguments doesn't matter if arguements are named 
sd(na.rm = FALSE, mydata) #Can lead to errors or confusion
args(lm)
lm(data = mydata, y ~ x, model = FALSE, 1:100) #Doesn't work
lm(y ~ x, mydata, 1:100, model = FALSE) #NEither does this
#Lecture Part 2####
f <- function(a, b = 1, c = 2, d = NULL){
    
}
f <- function(a,b) {
    a^2
} #Can function without second arguement because it is not in the function

f <- function(a,b) {
    print(a)
    print(b)
} #Cannot function without second arguement since it is in the function

myplot <- function(x, y, type = "l", ...) { #Maybe want to tweak the default plot function to tweak some charcteristics
    plot(x, y, type = type, ...)
}

args(paste) #Paste has the `...` as the first arguements
args(cat) #Same here, so all following arguements must be explicitly matched, no partial matching
paste("a", "b", sep = ":")
paste("a", "b", se = ";")

##Practice with Scoping Rules R Lecture####
#Examples of lexical scoping
search() #Shows Packages Currently Installed, global env is local R env
f <- function(x, y) {
    x^2 + y /z #Free variable z not define, R searches in the environement in whch the functin was created
}
make.power <- function(n) {
    pow <- function(x) {
        x^n
    }
    pow
}
cube <- make.power(3) #Assign a new function based on previous function
square <- make.power(2) #Same
ls(environment(cube)) #Shows there is a variable `n` inside cube
get("n", environment(cube)) #Shows that `n` has a value of three inside `cube`
#Comparison to Dynamic Scoping
y <- 10
f <- function(x) {
    y <- 2 #Free - not define in function
    y^2 + g(x) #Same
}
g <- function(x) {
    x*y
}

##Practice with Optimization R Lecture####
make.NegLogLik <- function(data, fixed = c(FALSE, FALSE)) {
    params <- fixed
    function(p) {
        params[!fixed] <- p
        mu <- params[1]
        sigma <- params [2]
        a <- -0.5*length(data)*log(2*pi*sigma^2)
        b <- -0.5*sum((data-mu)^2) / (sigma^2)
        -(a + b)
    }
}
set.seed(1); normals <- rnorm(100, 1, 2)
nLL <- make.NegLogLik(normals)
nLL
ls(environment(nLL))
optim(c(mu = 0, sigma = 1), nLL)$par
nLL <- make.NegLogLik(normals, c(FALSE,2))
optimize(nLL, c(-1, 3))$minimum #Lots more options and examples, not rerally sure what the point is..

##Practice with Code STandards R Lecture####
#Recommend use text editor (RStudio text editor), indent at least 4 - 8 spaces, limit to 87 charcter width,
#simple/logical functions that break code into digestible portions

##Practice with Dates abd Times R Lecture####
#Special class Date and POSIXct or the POSIXlt
#Stored as the number of days or seconds since a 1970-01-01
x <- as.Date("1970-01-01")
unclass(x)
#generic functions for date/time
weekdays()
months()
quarters()
x <- Sys.time()
p <- as.POSIXlt(x)
names(unclass(p))
p$sec
unclass(x)
x$sec
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
class(x)
x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x - y
x <- as.POSIXlt(x)
x <- as.Date("2012-03-01") 
y <- as.Date("2012-02-28")
x - y
x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y - x

##Practice from Derek Franks tutorial####
setwd("C:/Users/KGH/OneDrive/Coursera/R/Assignments")
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")

#List Files
list.files("diet_data")
#Open one and see what it is
andy <- read.csv("diet_data/Andy.csv")
head(andy)
length(andy$Day) #Number of rows
dim(andy) #Dimensions 30 rows 4 columns
#Other ways to inspect a new file
str(andy)
summary(andy)
names(andy)
#First row of weight column
andy[1, "Weight"]
#Final row of weight column
andy[30, "Weight"]
#Could create a subset of the weight column for day 30
andy[which(andy$Day == 30), "Weight"]
andy[which(andy[,"Day"] == 30), "Weight"]
subset(andy$Weight, andy$Day==30)
#Assign Andy's starting and ending weight to vectors:
andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]
#How much weight he lost by subtracting the vectors:
andy_loss <- andy_start - andy_end
andy_loss
#Take the output of  list.files()  and store it:
files <- list.files("diet_data")
files
#'files' is now a list of the contents of 'diet_data' in alphabetical order, we can call a specific file by subsetting it:
files[1]
files[2]
files[3:5]
#Take a quick look at John.csv:
head(read.csv(files[3])) #Didn't work
files_full <- list.files("diet_data", full.names=TRUE)
files_full
head(read.csv(files_full[3])) #This works since we used the full.names
#Bind by Andy data  to David data by rows
andy_david <- rbind(andy, read.csv(files_full[2]))
head(andy_david)
tail(andy_david)
#subset of the data frame that shows us just the 25th day for Andy and David
day_25 <- andy_david[which(andy_david$Day == 25), ]
day_25
#Make a loop 
for (i in 1:5) {
    dat <- rbind(dat, read.csv(files_full[i]))
}
#Make an empty dataframe firast
dat <- data.frame()
for (i in 1:5) {
    dat <- rbind(dat, read.csv(files_full[i]))
}
str(dat)
#If we put the dat <- data.fram assignment in the looop
for (i in 1:5) {
    dat2 <- data.frame()
    dat2 <- rbind(dat2, read.csv(files_full[i]))
}
str(dat2)
head(dat2)
#Sumarize values
median(dat$Weight) #Doesn't work because of NAs
median(dat$Weight, na.rm=TRUE)
#Function for doing this will start out something like
weightmedian <- function(directory, day) { # content of the function }
    #More explicitly
    weightmedian <- function(directory, day)  {
        files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
        dat <- data.frame()                             #creates an empty data frame
        for (i in 1:5) {                                
            #loops through the files, rbinding them together 
            dat <- rbind(dat, read.csv(files_list[i]))
        }
        dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
        median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
        #while stripping out the NAs
    }
    #Test
    weightmedian(directory = "diet_data", day = 20)
    weightmedian("diet_data", 4)
    weightmedian("diet_data", 17)
    #More streamlined approach
    summary(files_full)
    tmp <- vector(mode = "list", length = length(files_full))
    summary(tmp)
    for (i in seq_along(files_full)) {
        tmp[[i]] <- read.csv(files_full[[i]])
    }
    str(tmp)
    str(lapply(files_full, read.csv)) #Even more compact
    str(tmp[[1]]) #Can manipulate in this form
    head(tmp[[1]][,"Day"])
    output <- do.call(rbind, tmp) #Better to combine into a single dataframe
    str(output)

###Practice for Coursera R Course Week 3####
##Practice with lapply R Lecture####
#lapply - loop over a list and apply a function to each element
x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean) #What results is always a list
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20,1),
          d = rnorm(100,5))
lapply(x, mean)
x <- 1:4
lapply(x, runif) #Runif creates vectors of random uniform variables between 0 - 1
lapply(x, runif, min =0, max = 10) #Use runif with larger range of unifrom variables
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
lapply(x, function(elt) elt[,1]) #Create an anonymous function with argument elt that extracts just the first column
#sapply is like lapply but will simplify outputs such as lists to vector
sapply(x, mean)
