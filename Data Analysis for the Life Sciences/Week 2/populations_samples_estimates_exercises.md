Population, samples and estimates exercises
================

``` r
library(dplyr)
```

    ## Warning: package 'dplyr' was built under R version 3.4.4

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
dat <- read.csv("mice_pheno.csv")
dat <- na.omit(dat) 
```

1.  Load in mice pheno data and remove lines containing missing values. Use dplyr to create a vector x with the body weight of all males on the control (chow) diet. What is this populations average?

``` r
x <- filter(dat, Sex == "M" & Diet == "chow") %>% 
      select(Bodyweight) %>% unlist
```

    ## Warning: package 'bindrcpp' was built under R version 3.4.4

``` r
mean(x)
```

    ## [1] 30.96381

1.  Now use the rafalib package and use the popsd function to compute the population standard deviation.

``` r
library(rafalib)
popsd(x)
```

    ## [1] 4.420501

1.  Set the seed at 1. Take a random sample of size 25 from x. What is the sample average?

``` r
set.seed(1);
X <- mean(sample(x,size=25))
X
```

    ## [1] 32.0956

1.  Use dplyr to create a vector y with the body weight of all males on the high fat hf) diet. What is this population's average?

``` r
y <- filter(dat, Sex == "M" & Diet == "hf") %>% 
      select(Bodyweight) %>% unlist
mean(y)
```

    ## [1] 34.84793

1.  Now use the rafalib package and use the popsd function to compute the population standard deviation.

``` r
popsd(y)
```

    ## [1] 5.574609

1.  Set the seed at 1. Take a random sample of size 25 from y. What is the sample average?

``` r
set.seed(1);
Y <- mean(sample(y,size=25))
Y
```

    ## [1] 34.768

1.  What is the difference in absolute value between mean values of (y-x) and mean values of (Y-X)

``` r
popdiff <- mean(y)-mean(x)
samplediff <- mean(Y)-mean(X)
abs(popdiff-samplediff)
```

    ## [1] 1.211716

1.  Repeat the above for females, then find absolute value differnce between mean values of (y-x) and mean values of (Y-X)

``` r
x <- filter(dat, Sex == "F" & Diet == "chow") %>% 
      select(Bodyweight) %>% unlist

set.seed(1);
X <- mean(sample(x,size=25))

y <- filter(dat, Sex == "F" & Diet == "hf") %>% 
      select(Bodyweight) %>% unlist

set.seed(1);
Y <- mean(sample(y,size=25))

popdiff <- mean(y)-mean(x)
samplediff <- mean(Y)-mean(X)
abs(popdiff-samplediff)
```

    ## [1] 0.7364828

1.  For the females, our sample estimates were closer to the population difference than with males. What is a possible explanation for this? The population variance of the females is smaller than that of the males; thus, the sample variable has less variability.
