dat <- read.csv("femaleMiceWeights.csv")
head(dat)
dat[12,2]
dat$Bodyweight[11]
length(dat$Bodyweight)
which(dat$Diet == "hf")
hfmice <- 13:24
mean(dat$Bodyweight[hfmice])
set.seed(1); dat$Bodyweight[sample(13:24,1)]
