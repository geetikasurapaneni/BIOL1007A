### Vectors, Matrices, Data Frames, and Lists
### 17 January 2023
### GS

### Vectors (cont'd)
### Properties

## Coercion
# All atomic vectors are of the same data type
# If you use c() to assemble different types, R coerces them 
# logical -> integer -> double -> character

a <- c(2, 2.2)
a # coerces to double

b <- c("purple", "green")
typeof (b)

d <- c(a,b)
typeof(d)

## comparison integers yield a logical result
a <- runif(10)
print(a)

a > 0.5 #conditional statement

## how many elements in the vector are > 0.5
sum(a > 0.5)
mean(a > 0.5) #what proportion of vector are greater than 0.5

## Vectorization 
# add a constant to a vector 

z <- c(10, 20, 30)
print(z)
z + 1

## what happens when vectors are added together? 
y <- c(1,2,3)
print(y)
 z + y #results in an "element by element" operation on the vector

##Recycling
 # what if vector lengths are not equal?
 
 z
 x <- c(1,2)
 print(x)
 z + x #warning is issued by calculation is still made,the shorter vector is always recycled
 
 ## Stimulating data: runif and rnorm()
 
 runif(n=5, min=5, max=10) # n is sample size, min = minimum value, max = maximum value
 
 set.seed(123) # set seed can any number, sets random number generator (is reproducible)
 runif(n=5, min=5, max=10)
 
 # rnorm: random normal values with mean 0 and sd 1
randomNormalNumbers <- rnorm(100)
mean(randomNormalNumbers) #use hist function shows distribution
 
 hist(runif(n=100, min=5, max=10))
 hist(rnorm(n=100, mean=100, sd=30))

## Matrix data structure
 # 2 dimensional (rows and columns)
 # homogeneous data type (numeric data types)
 
 # matrix is an atomic vector organized into rows and columns 
 my_vec <- 1:12
print(my_vec) 

m <- matrix(data = my_vec, nrow=4) 
m

m <- matrix(data = my_vec, ncol=3)  
m 

m <- matrix(data = my_vec, ncol=3, byrow=TRUE)
m

## Lists
# are atomic vectors BUT each element can hold different data types (and different sizes)

myList <- list(1:10, matrix(1:8, nrow=4, byrow=TRUE), letters[1:3], pi)
myList
class(myList)
str(myList)

#Subsetting Lists 
  #using one pair of square brackets gives you a single element BUT not the elements
myList[4]
myList[4]-3 #single bracket gives you only elements in slot which is always type list

# to grab object itself, [[]]
myList[[4]] #how we access contents
myList[[4]] - 3 

myList[[2]][4,1] # 2 dim subsetting -> first number is row index, second is column [4,1] gives 4th row, first column

c(myList[[1]], myList[[2]]) # to obtain multiple elements within the list

# name list items when they are created 
myList2 <- list(Testor = FALSE, littleM = matrix(1:9, nrow=3))
myList2
myList2$Testor #dollar sign accesses named elements

myList2$littleM[2,3] #extracts second row, third column of littleM

myList2$littleM[2,] #leave blank if you want all elements [2,] = second row, all columns

myList2$littleM[2] #gives second element

# unlist to string everything back to vector
unRolled <- unlist(myList2)
unRolled

data(iris)
head(iris)
plot(Sepal.Length ~ Petal.Length, data=iris)
model <-lm(Sepal.Length ~ Petal.Length, data=iris)
model
results <- summary(model)
results
class(results)
typeof(results)
str(results)

#use [] to extract Petal.Length pvalue
results$coefficients
results[[4]][2,4] #second row, fourth column

#different way: use unlist()
unlist(results)$coefficients8

## Data Frames
# (list of) equal-length vectors, each of which is a column

varA <- 1:12
varA
varB <- rep(c("Con", "LowN", "HighN"), each=4)
varB
varC <- runif(12)
varC

dframe <- data.frame(varA, varB, varC, 
stringsAsFactors = FALSE)
dframe

#add another row
newData <- list(varA=13, varB= "HighN", varC=0.668)
newData

#use rbind()
dframe <- rbind(dframe, newData)
dframe

#why cant we use c?
newData2 <- c(14, "HighN", 0.668)
#coerces to character
dFrame <- rbind(dframe, newData2) # all character data types now!

## add a column
newVar <- runif(14)
newVar

# use cbind() function to add column
dFrame <- cbind(dframe, newVar)
dFrame
head(dFrame)

## Data Frames vs. Matrices
zMat <- matrix(data=1:30, ncol=3, byrow=TRUE)
zMat
zDframe <- as.data.frame(zMat)
zDframe
str(zDframe)
str(zMat)

zMat[,3]
zDframe[,3]
zDframe$V3


zMat[3,]
zDframe[3,]

#Eliminating NAs
# complete.cases(), function
zD <- c(NA, rnorm(10), NA, rnorm(3))
complete.cases(zD) #gives logical output

#Clean Out NAs
zD[complete.cases(zD)]
which(!complete.cases(zD))
which(is.na(zD))

#Use with Matrix
m <- matrix(1:20, nrow=5)
m[1,1] <- NA
m[3,4] <- NA
complete.cases(m) #gives T/F as to whether whole row is 'complete' (no NAs)
m[complete.cases(m),]
