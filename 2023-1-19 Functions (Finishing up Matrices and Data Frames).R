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
