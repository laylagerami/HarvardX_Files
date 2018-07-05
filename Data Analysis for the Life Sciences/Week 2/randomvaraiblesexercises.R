library(dplyr)
population <- read.csv("femaleControlsPopulation.csv")

x <- unlist(population)

#average of the weights
meanweight <- mean(x)

#random sample of size 5, 
#absolute value of difference between average
# of sample and average of all values
set.seed(1); sample <- sample(x,5)
abs((mean(sample))-meanweight)

#random sample of size 5 with diff. seed
set.seed(5); sample2 <- sample(x,5)
abs((mean(sample2))-meanweight)
