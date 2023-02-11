### Lecture 8: Loading in Data
### 26 January 2023
### GS

## Create and save a dataset
### write.table() 
  #write.table(x=varName, file="outputFileName.csv", header=TRUE, sep =",")


## Read in a data set:
  #read.table(file="path/to/data.csv", header = TRUE, sep = ",")
### read/csv()
  #read.csv(file-"data.csv", header=T)

## Use RDS objects when only working in R. helpful with large datasets
  #saveRDS(my_data, file="FileName.RDS")
  #readRDS("FileName.RDS")
  #p <- readRDS("FileName.RDS")

## Long vs. Wide data formats
# wide format = contains values that don't repeat in the ID column
# long format = contains values that DO repeat in the ID column

library(tidyverse)
glimpse(billboard)
billboard %>%
  pivot_longer(
    cols = starts_with("wk"), #specify which columns you want to make "longer"
    names_to = "Week", # name of new column which will contain header names
    values_to = "Rank", # name of new column which will contain the values
    values_drop_na = TRUE #removes any rows where the value = NA
  )

## pivot_wider
  #best for making occupany matrix
glimpse(fish_encounters)
view(fish_encounters)
fish_encounters %>%
  pivot_wider(names_from = station, # which column you want to turn into multiple columns
              values_from = seen, #which column contains the values for the new column cells
              values_fill = 0)  

### Dryad: makes research data freely reusable to everybody


dryadData <- read.table("Data/veysey-babbitt_data_amphibians.csv", header=TRUE, sep=",", stringsAsFactors = TRUE)

glimpse(dryadData)
head(dryadData)
table(dryadData$species) #allows you to see different groups of character column
summary(dryadData$mean.hydro)
