### Programming in R 
### 12 January 2023
### GS

## Advantages of programming in R
    #interactive use
    # graphics, statistics
    # very active community of contributers
    # works on multiple platforms
## Disadvantages of programming in R
    # lazy evaluation
    # some packages are poorly documented
    # functions are hard to learn (steep learning curve)
    # unreliable packages
    # problems with big data (multiple GBs)
## Let's start with the basics:
  #Assignment operator: used to assign a new value to a variable 
    x <- 5
    print(x) #shows/prints what the variable x consists of
    x #does the same thing that print(x) does
    # another option is to just highlight x
    y <- 4
    y <- y + 1.1
    # can use command shift c to highlight a whole chunk and make it a hashtag comment   
    
  #Variables: used to store information (a containter)
    z <- 3 #single letter variables
    plantHeight <- 10 #camel case format, a preferred method
    plant_height <- 3.3 #snake case format. a preferred method
    plant.height <- 4.2 #don't recommend because some built in packages use a period in R
    . <- 5.5 #reserve for temporary variable. act as a placeholder. 
    
  #Funtions: blocks of code that perform a specific task. can use short command over again      instead of writing out the block of code multiple times. 
      #you can create your own function
    square <- function(x = NULL){
      x <- x^2
      print(x)
    }
    z <- 103
    square(x = z) #the argument name is x
    
    ## or there are built in functions
    sum(109, 3, 10) #look at package info using ?sum or going to Help panel
    
  #Vectors are homogenous and one-dimensional
  #Types
      #character strings 
      #integers (whole numbers)
      #double (real numbers, decimals)
      #both integers and doubles are numeric
      #logical(TRUE or False)
      #factor (categorizes, group variables)
    
      # c function (combine)
      z <- c(3.2,5,5,6)
      print(z) #prints
      class(z) #returns class 
      typeof(z) #returns type of variable
      is.numeric(z) #returns T/F
      
      # c() always "flattens" to a vector
      z <- c(c(3,4), c(5,6))
    
      #character vectors
      z <- c("perch", "bass", "trout")
      print(z)
      z <- c("This is only 'one' character string", "a second", "a third") 
      print(z)
      typeof(z)
      is.character(z) #is.functions tests whether it is certain data type
      ## Logical (Boolean), no quotes, all caps: TRUE and/or FALSE
      z <- c(TRUE, FALSE, T, F) #as.functions coerces data type
      z <- as.character(z)
      is.logical(z)
      
      #TYPE
      #is.numeric / as.character
      #typeof()
      
      #Length
      length(z)
      dim(z) #NULL(0) because vectors are one-dimensional
      
      #Names
      z <- runif(5) #gives you 5 random uniform numbers between 0 and 1
      names(z)
        # Add Names
        names(z) <- c("chow", "pug", "beegle", "greyhound", "akita")
        print(z)      
        names(z) #shows names now
        names(z) <- NULL 
        
      #NA values
      #missing data
        z <- c(3.2, 3.5, NA)
        typeof(z)
        sum(z)

      #check for NAs
        anyNA(z)
        is.na(z)        
        which(is.na(z)) #useful for exploring data and where NAs are, so you can remove them
        
    #Sub-setting vectors
        #vectors are indexed
        z <- c(3.1, 9.2, 1.3, 0.4, 7.5)
        z[4]  #use square brackets to subset by index
        z[c(4,5)] #need to use c for multiple indices
        z[-c(2,3)] #minus sign to exclude elements
        z[-1] #excludes 1
        z[z==7.5]  #double equal sign to get an exact match
        z[z<7.5] #use logical statements within square brackets to subset by conditions
        z[which(z < 7.5)] #same thing as above with the z with square brackets, just which          alone outputs indices
    
    #Creating a logical vector
        z < 7.5
    #Sub-setting characters(named elements)     
        names(z) <- c("a", "b", "c", "d", "e")
        print(z)       
        z[c("a","d")]
    #Subset
        subset(x=z, subset=z>1.5)

    #Randomly Sample
        #use sample function
        story_vec <- c("A", "Frog", "Jumped", "Here")
        sample(story_vec)
        #randomly select three elements from vector
        sample(story_vec, size = 3)
      
        story_vec <- c(story_vec[1], "Green", story_vec[2:4])
        story_vec[2] <- "Blue"
        print(story_vec)
        
    #Vector Function
        vec <- vector(mode = "numeric", length = 5)
        print(vec)

    #Rep and Seq Functions
        z <- rep(x=0, times=100)
        print(z)
        z <- rep(x=1:4, each=3)        
        
        z <- seq(from = 2, to=4, by=0.5)
        z <- runif(5)
             seq(from = 1, to=length(z))
        
        
        