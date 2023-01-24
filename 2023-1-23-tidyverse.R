### TidyVerse
### 23 January 2023
### GS

## operators: symbols that tell R to perform different operations (between variables, functions, etc.)

## arithmetic operators: + - * / ^ ~
## assignment operators: <-
## logical operators: ! % |
## relational operators: ==, !=, >, <, >=, <=
## miscellaneous operators: %>% (forward pipe operator) %in%

## only need to install packages once
library(tidyverse) # library function to load in new functions

#dplyr: new(er) packages provides a set of tools for manipulating data sets 
#


#### The core verbs
# filter()
# arrange()
# select()
# group_by() and summarize()
# mutate() 

## built in dataset
data("starwars")
class(starwars)

## Tibble: ,modern take on data frames
# keeps great aspects of data frames and drops frustrating ones (change variables)

## filter: picks/subsets observations (ROWS) by their values
 filter(starwars, gender == "masculine" & height < 180)
 
 select(starwars, contains("color")) #others include: ends_with(), starts_with(), num_range()

 #select can also rename columns
 select(starwars, haircolor = hair_color)
 
 