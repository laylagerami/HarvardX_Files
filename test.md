---
title: "Central Limit Theorem"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

##Central Limit Theorem and t-distribution

The Central Limit Theorem (CLT) and the t-distribution both help us to make important calculations related to probabilities. They are used in science to test statistical hypotheses. To use them, we have to make different assumptions from those for the CLT and t-distribution. However, if the assumptions are true, then we are able to calculate the exact probabilities of events through the use of mathematical formula.

###CLT
The CLT is one of the most frequently used mathematical results in science. It tells us that when the sample size is large, the average ![equation](http://latex.codecogs.com/svg.latex?%24%5Cbar%7BY%7D%24) of a random sample follows a *normal distribution* centered at the population average, ![equation](http://latex.codecogs.com/svg.latex?%24%5Cmu_Y%24) and with standard deviation equal to the population standard deviation ![equation](http://latex.codecogs.com/svg.latex?%24%5Csigma_Y%24), divided by the square root of the sample size $N$. The standard deviation of the distribution of a random variable is referred to as the variable's *standard error*.  

Note that if we subtract a constant from a random variable, the mean of the new random variable ALSO shifts by that constant. Mathematically speaking, if ![equation](http://latex.codecogs.com/svg.latex?%24X%24) is a random variable with mean ![equation](http://latex.codecogs.com/svg.latex?%24%5Cmu%24) and ![equation](http://latex.codecogs.com/svg.latex?%24a%24) is a constant, the mean of ![equation](http://latex.codecogs.com/svg.latex?%24X%20-%20a%24) is ![equation](http://latex.codecogs.com/svg.latex?%24%5Cmu-a%24). Similarly for multiplication and the standard deviation (SD), if ![equation](http://latex.codecogs.com/svg.latex?%24X%24%20)is a random variable with mean ![equation](http://latex.codecogs.com/svg.latex?%24%5Cmu%24) and SD ![equation](http://latex.codecogs.com/svg.latex?%24%5Csigma%24), and  is a constant, then the mean and SD of ![equation](http://latex.codecogs.com/svg.latex?%24a%2AX%24%20are%20%24a%2A%20%5Cmu%24) and ![equation](http://latex.codecogs.com/svg.latex?%24%5Cmid%20a%20%5Cmid%20%2A%5Csigma%24) respectively.  

To see this intuitively, imagine we subtract 10g from each of the mice weights. The average weight should also drop by that much. Also, if we change the units from g to mg (x1000) then the spread of the numbers becomes larger.  

So if we take many samples of size $N$, then the quantity:  
$\frac{\bar{Y} - \mu}{\sigma_Y/\sqrt{N}}$  
is approximated with a normal distribution centered at 0, and with sd of 1.  

Now lets look at the difference between two sample averages, mathematically. If we have two random variables $X$ and $Y$ with means $\mu_X$ and $\mu_Y$ and variance $\sigma_X$ and $\sigma_Y$ respectively, then the mean of the sum $Y + X$ is the sum of the means $\mu_Y + \mu_X$.  

Using one of the facts we mentioned earlier, this implies that the mean of $Y - X = Y + aX$ with $a = -1$ , which implies that the mean of $Y - X$ is $\mu_Y - \mu_X$. This is intuitive. However, the next result is perhaps not as intuitive. If $X$ and $Y$ are independent of each other, as they are in our mouse example, then the variance (SD squared) of $Y + X$ is the sum of the variances $\sigma_Y^2 + \sigma_X^2$. This implies that variance of the difference $Y - X$ is the variance of $Y + aX$ with $a = -1$ which is $\sigma^2_Y + a^2 \sigma_X^2 = \sigma^2_Y + \sigma_X^2$. So the variance of the difference is also the sum of the variances. If this seems like a counterintuitive result, remember that if $X$ and $Y$ are independent of each other, the sign does not really matter. It can be considered random: if $X$ is normal with certain variance, for example, so is $-X$. Finally, another useful result is that the sum of normal variables is again normal.  
So in our mouse study, we have two sample averages (hf diet and normal diet) and are interested in the difference. As both are normal, the difference is normal too, and the variance (sd squared) is the sum of the two variances. Under the *null hypothesis* that there is NO difference between the population averages, the difference between the the sample averages $\bar{Y}$ and $\bar{X}$ (symbols represent the sample averages for the two diets) is approximated by a normal distribution centered at 0 (no difference) and with standard deviation $\sqrt{\sigma_X^2 +\sigma_Y^2}/\sqrt{N}$.  

This suggests that the ratio:
$$\frac{\bar{Y}-\bar{X}}{\sqrt{\frac{\sigma_X^2}{M} + \frac{\sigma_Y^2}{N}}}$$
is approximated by a normal distribution centered at 0 and standard deviation 1. Using this approximation makes computing p-values simple as we know the proportion of the distribution under any value. E.g. only 5% of these values are larger than 2 (in absolute value)
```{r}
pnorm(-2) + (1-pnorm(2))
```
However, we don't know the population standard deviations! These are unknown population parameters. We can instead use the sample standard deviations, call them $s_X$ and $s_Y$. These are defined as:  
$s_X^2 = \frac{1}{M-1} \sum_{i=1}^M (X_i - \bar{X})^2 \mbox{ and } s_Y^2 = \frac{1}{N-1} \sum_{i=1}^N (Y_i - \bar{Y})^2$. 

Note we divide by *M-1* and *N-1*. Think about the case when you have 2 numbers, the average distance to the mean is basically 1/2 the distance between the two numbers. So really you just have information from one number.  

So, lets redefine our ratio!  
$\sqrt{N} \frac{\bar{Y}-\bar{X}}{\sqrt{s_X^2 +s_Y^2}}$  
If M = N, or in general,
![equation](http://latex.codecogs.com/svg.latex?%24%5Cfrac%7B%5Cbar%7BY%7D-%5Cbar%7BX%7D%7D%7B%5Csqrt%7B%5Cfrac%7Bs_X%5E2%7D%7BM%7D%20%2B%20%5Cfrac%7Bs_Y%5E2%7D%7BN%7D%7D%7D%24%20%20)

The CLT tells us that when M and N are large, this random variable is normally distributed with mean 0 and SD 1. Thus, we can compute p-values using the function *pnorm*.








