Null distributions exercises
================

``` r
library(dplyr)
```

Using the entire control population dataset

``` r
x <- read.csv("femaleControlsPopulation.csv")
x <- unlist(x)
```

1.  Set the seed at 1, then using a for-loop take a random sample of 5 mice 1,000 times. Save these averages. What proportion of these 1,000 averages are more than 1 gram away from the average of x ?

``` r
set.seed(1); 
n <- 1000
sample1averages <- vector("numeric",n)
for(i in 1:n){
  tmp <- sample(x, size=5)
  sample1averages[i] <- mean(tmp)
}

hist(sample1averages)
```

![](null_distro_exercises_files/figure-markdown_github/unnamed-chunk-3-1.png)

``` r
sum(abs(sample1averages - mean(x)) > 1)/n
```

    ## [1] 0.498

We are now going to increase the number of times we redo the sample from 1,000 to 10,000. Set the seed at 1, then using a for-loop take a random sample of 5 mice 10,000 times. Save these averages. What proportion of these 10,000 averages are more than 1 gram away from the average of x

``` r
set.seed(1); 
n <- 10000
sample2averages <- vector("numeric",n)
for(i in 1:n){
  tmp <- sample(x, size=5)
  sample2averages[i] <- mean(tmp)
}

hist(sample2averages)
```

![](null_distro_exercises_files/figure-markdown_github/unnamed-chunk-4-1.png)

``` r
sum(abs(sample2averages - mean(x)) > 1)/n
```

    ## [1] 0.4976

Note that the answers to 1 and 2 barely changed. This is expected. The way we think about the random value distributions is as the distribution of the list of values obtained if we repeated the experiment an infinite number of times. On a computer, we can't perform an infinite number of iterations so instead, for our examples, we consider 1,000 to be large enough, thus 10,000 is as well. Now if instead we change the sample size, then we change the random variable and thus its distribution. Set the seed at 1, then using a for-loop take a random sample of 50 mice 1,000 times. Save these averages. What proportion of these 1,000 averages are more than 1 gram away from the average of x ?

``` r
set.seed(1); 
n <- 1000
sample3averages <- vector("numeric",n)
for(i in 1:n){
  tmp <- sample(x, size=50)
  sample3averages[i] <- mean(tmp)
}

hist(sample3averages)
```

![](null_distro_exercises_files/figure-markdown_github/unnamed-chunk-5-1.png)

``` r
sum(abs(sample3averages - mean(x)) > 1)/n
```

    ## [1] 0.019
