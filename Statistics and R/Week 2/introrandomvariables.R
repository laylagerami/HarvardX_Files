library(dplyr)
dat <- read.csv("femaleMiceWeights.csv")

control <- filter(dat, Diet=="chow") %>%
  select(Bodyweight) %>% unlist

treatment <- filter(dat, Diet=="hf") %>%
  select(Bodyweight) %>% unlist

mean(treatment) - mean(control)

#loading in entire population of control mice
population <- read.csv("femaleControlsPopulation.csv")

#data frame to numeric variable
population <- unlist(population)

#taking mean of random sample, which fluctuates
mean(sample(population, 12))
