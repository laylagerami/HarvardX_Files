Central Limit Theorem
================

Central Limit Theorem and t-distribution
----------------------------------------

The Central Limit Theorem (CLT) and the t-distribution both help us to make important calculations related to probabilities. They are used in science to test statistical hypotheses. To use them, we have to make different assumptions from those for the CLT and t-distribution. However, if the assumptions are true, then we are able to calculate the exact probabilities of events through the use of mathematical formula.

### CLT

The CLT is one of the most frequently used mathematical results in science. It tells us that when the sample size is large, the average $\\bar{Y}$ of a random sample follows a *normal distribution* centered at the population average, *μ*<sub>*Y*</sub> and with standard deviation equal to the population standard deviation *σ*<sub>*Y*</sub>, divided by the square root of the sample size *N*. The standard deviation of the distribution of a random variable is referred to as the variable's *standard error*.

Note that if we subtract a constant from a random variable, the mean of the new random variable ALSO shifts by that constant. Mathematically speaking, if *X* is a random variable with mean *μ* and *a* is a constant, the mean of *X* − *a* is *μ* − *a*. Similarly for multiplication and the standard deviation (SD), if *X* is a random variable with mean *μ* and SD *σ*, and *a* is a constant, then the mean and SD of *a* \* *X* are *a* \* *μ* and ∣*a* ∣ \**σ* respectively.

To see this intuitively, imagine we subtract 10g from each of the mice weights. The average weight should also drop by that much. Also, if we change the units from g to mg (x1000) then the spread of the numbers becomes larger.

So if we take many samples of size *N*, then the quantity:
$\\frac{\\bar{Y} - \\mu}{\\sigma\_Y/\\sqrt{N}}$
is approximated with a normal distribution centered at 0, and with sd of 1.

Now lets look at the difference between two sample averages, mathematically. If we have two random variables *X* and *Y* with means *μ*<sub>*X*</sub> and *μ*<sub>*Y*</sub> and variance *σ*<sub>*X*</sub> and *σ*<sub>*Y*</sub> respectively, then the mean of the sum *Y* + *X* is the sum of the means *μ*<sub>*Y*</sub> + *μ*<sub>*X*</sub>.

Using one of the facts we mentioned earlier, this implies that the mean of *Y* − *X* = *Y* + *a**X* with *a* = −1 , which implies that the mean of *Y* − *X* is *μ*<sub>*Y*</sub> − *μ*<sub>*X*</sub>. This is intuitive. However, the next result is perhaps not as intuitive. If *X* and *Y* are independent of each other, as they are in our mouse example, then the variance (SD squared) of *Y* + *X* is the sum of the variances *σ*<sub>*Y*</sub><sup>2</sup> + *σ*<sub>*X*</sub><sup>2</sup>. This implies that variance of the difference *Y* − *X* is the variance of *Y* + *a**X* with *a* = −1 which is *σ*<sub>*Y*</sub><sup>2</sup> + *a*<sup>2</sup>*σ*<sub>*X*</sub><sup>2</sup> = *σ*<sub>*Y*</sub><sup>2</sup> + *σ*<sub>*X*</sub><sup>2</sup>. So the variance of the difference is also the sum of the variances. If this seems like a counterintuitive result, remember that if *X* and *Y* are independent of each other, the sign does not really matter. It can be considered random: if *X* is normal with certain variance, for example, so is −*X*. Finally, another useful result is that the sum of normal variables is again normal.
So in our mouse study, we have two sample averages (hf diet and normal diet) and are interested in the difference. As both are normal, the difference is normal too, and the variance (sd squared) is the sum of the two variances. Under the *null hypothesis* that there is NO difference between the population averages, the difference between the the sample averages $\\bar{Y}$ and $\\bar{X}$ (symbols represent the sample averages for the two diets) is approximated by a normal distribution centered at 0 (no difference) and with standard deviation $\\sqrt{\\sigma\_X^2 +\\sigma\_Y^2}/\\sqrt{N}$.

This suggests that the ratio:
$$\\frac{\\bar{Y}-\\bar{X}}{\\sqrt{\\frac{\\sigma\_X^2}{M} + \\frac{\\sigma\_Y^2}{N}}}$$
 is approximated by a normal distribution centered at 0 and standard deviation 1. Using this approximation makes computing p-values simple as we know the proportion of the distribution under any value. E.g. only 5% of these values are larger than 2 (in absolute value)

``` r
pnorm(-2) + (1-pnorm(2))
```

    ## [1] 0.04550026

However, we don't know the population standard deviations! These are unknown population parameters. We can instead use the sample standard deviations, call them *s*<sub>*X*</sub> and *s*<sub>*Y*</sub>. These are defined as:
$s\_X^2 = \\frac{1}{M-1} \\sum\_{i=1}^M (X\_i - \\bar{X})^2 \\mbox{ and } s\_Y^2 = \\frac{1}{N-1} \\sum\_{i=1}^N (Y\_i - \\bar{Y})^2$.

Note we divide by *M-1* and *N-1*. Think about the case when you have 2 numbers, the average distance to the mean is basically 1/2 the distance between the two numbers. So really you just have information from one number.

So, lets redefine our ratio!
$\\sqrt{N} \\frac{\\bar{Y}-\\bar{X}}{\\sqrt{s\_X^2 +s\_Y^2}}$
If M = N, or in general, $\\frac{\\bar{Y}-\\bar{X}}{\\sqrt{\\frac{s\_X^2}{M} + \\frac{s\_Y^2}{N}}}$

The CLT tells us that when M and N are large, this random variable is normally distributed with mean 0 and SD 1. Thus, we can compute p-values using the function *pnorm*.
