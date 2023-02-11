### ggplot2
### 24 January 2023
### GS

library(ggplot2)
library(ggthemes)
library(patchwork)

# Template for ggplot code 
# ggplot(data=<DATA>. mapping = aes(x = xVar, y = yVAR)) + 
# <GEOM FUNCTION> ##+ geom_boxplot()
# print(p1)

# Load in a built-in data set
data(mpg)
d <- mpg
str(mpg)

library(dplyr)
glimpse(d)

# qplot: quick, plotting
qplot(x=d$hwy)

#histogram
qplot(x=d$hwy, fill = I("darkblue"), color = I("black"))

#scatterplot
qplot(x=d$displ, y=d$hwy, geom=c('smooth', 'point'))

#boxplot
qplot(x=d$displ, y=d$hwy, geom=c('smooth', 'point'))

#barplot
qplot(x=d$fl, geom="bar", fill=I("forestgreen"))

#Create some data (specified counts)
x_trt <- c("Control", "Low", "High")
y_res <- c(12, 2.5, 22.9)
qplot(x=x_trt)

library(viridis)

