### Functions (Finishing up Matrices and Data Frames)
### 19 January 2023
### GS

m <- matrix(data = 1:12, nrow=3)
m

# sub-setting based on elements
m[1:2, ] #only specified rows
m[,3:4 ] #only specified columns

# subset with logical (conditional) statements
# select all columns for which totals are >15

colSums(m) > 15
m[, colSums(m) > 15]

# rows sums now
# select rows that sum up to 22
m[rowSums(m)==22,] #everything that equals 22

m[rowSums(m)!=22,] #everything that does not equal 22

#logical operators: == != > <
#subsetting to a vector changes the data type
z <- m[1, ]
z
str(z)

z2 <- m[1, , drop=FALSE ]
z2

# stimulate new matrix
m2 <- matrix(data = runif(9), nrow=3)
m2

# use the assignment operator to substitute values
m2[m2 < 0.6] <- NA
m2

data <- iris
head(data)
data[3,2] #numbered indices still work

dataSub <- data[,c("Species", "Petal.Length")]
dataSub 
str(dataSub)

# sort a data frame by values
orderedIris <- iris[order(iris$Petal.Length),]
orderedIris
head(orderedIris)

##### FUNCTIONS IN R
# everything in R is a function
sum(3,2) #sum
3 + 2 # +sign is a function
sd

### user-defined functions

#functionName <- function(argX=defaultX, argY=defaultY){
  #curly bracket starts the body of the function
  #lines of R code ### and notes
  #create local variables (only 'visible to R within the function)
  #always end with return(z), different than print(z). 
#}

myFunc <- function(a=3, b=4){
  z <- a + b
  return(z)
}
myFunc()#runs defaults
z <- myFunc()
print(z)

myFunc <- function(a=NULL, b=NULL){  #when you dont want any number and just the function
  z <- a + b
  return(z)
}

#### Multiple Return Statements
############################################################################
# Function: HardyWeinberg
# input: all allele frequency
# output: p and the frequencies of 3 genotypes AA AB BB
#---------------------------------------------------------------------------
HardyWeinberg <- function(p = runif(1)){
  if(p>1.0|p<0){
    return("Function failure: p must be between 0 and 1")
  }
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vec0ut <- signif(c(p=p, AA=fAA, AB=fAB, BB=fBB), digits=3)
  return(vec0ut)
}
HardyWeinberg()
freqs <- HardyWeinberg()
freqs
HardyWeinberg(p=3)

#create a complex default value
###########################################################################
#FUNCTION: fitLinear2
#fits simple regression line
#input: numeric vector (p) or predictor (x) and response (y)
#outputs: slope and p-valie

fitLinear2 <- function(p=NULL){
  if(is.null(p)){
    p <- list(x=runif(20), y=runif(20))
  }
  myMod <- lm(p$x~p$y)
  myOut <- c(slope= summary(myMod)$coefficients[2,1],
             pValue = summary(myMod
                              )$coefficients[2,4])
  plot(x=p$x, y=p$y) #quick plot to check out put
  return(my0ut)
}
fitLinear2()
myPars <- list(x=1:10, y=runif(10))
fitLinear2(p=myPars)




