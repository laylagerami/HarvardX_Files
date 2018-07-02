dat <- read.csv("msleep_ggplot2.csv")
library(dplyr)

class(dat)
primates <- filter(dat, order == "Primates")
nrow(primates)
class(primates)

total_sleep_primates <- filter(dat, order == "Primates") %>%
  select(sleep_total) 
class(total_sleep_primates)

unlisted_total_sleep_primates <- filter(dat, order == "Primates") %>%
  select(sleep_total) %>% unlist
mean(unlisted_total_sleep_primates)

summarize_mean_total_sleep_primates <- filter(dat, order == "Primates") %>%
  summarize(mean(sleep_total))
summarize_mean_total_sleep_primates
