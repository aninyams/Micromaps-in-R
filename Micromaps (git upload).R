# R script for a micromap I am using a lyme disease dataset from CDC for this project.  
#Install the micromapST and tidyverse packages if you don't already have them, then call them
library(tidyverse)
library(micromapST)

# read in the file into R
lyme <- read.csv(file="lyme.csv",header=T, as.is=TRUE, check.names = FALSE)

# looking to see the first 6 rowns in the dataset
head(lyme)

#use the na.omit function to ger rid of missing values.
newlyme <- na.omit(lyme)

head(newlyme)

# micromap syntax the "bar", "bar" means my micrompap will have three colunms, you can add
#these as needed (i.e.dependind on the number of columns you want to display).  You can also 
#use  "dot" instead of bar or use both on the same map

panelDesc <- data.frame(
  type=c("map","id","bar","bar","bar"),
  lab1=c("" ,"", "Total Number of","Number of","Probable"),
  lab2=c("" ,"" ,"Confirmed Cases","Confirmed Cases","Cases"),
  lab3=c("","","","Number of Reported Lyme Disease Cases",""),
  col1 = c(NA,NA,"2","3","4")
)

dev.new()

micromapST(lyme, panelDesc, rowNamesCol = "State",
           rowNames = 'full', plotNames = 'ab',
           sortVar = 'Total', ascend = FALSE,
           title = c("Total Number of Reported Lyme Disease Cases in 2016"),
           ignoreNoMatches = TRUE)



