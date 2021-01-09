
<!-- README.md is generated from README.Rmd. Please edit that file -->

# metaggR

<!-- badges: start -->

<!-- badges: end -->

The goal of `metaggR` is to provide easy access to the
knowledge-weighted estimate proposed in [Palley and Satopää
(2020)](https://papers.ssrn.com/sol3/Papers.cfm?abstract_id=3504286).

## Installation

You can install the released version of `metaggR` from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("metaggR")
```

## Three Gorges Dam Example

This section illustrates `metaggR` on the Three Gorges Dam example in
[Palley and Satopää
(2020)](https://papers.ssrn.com/sol3/Papers.cfm?abstract_id=3504286).

``` r
library(metaggR)
# Judges' estimates:
E = c(50, 134, 206, 290, 326, 374)
# Judges' predictions of others:
P = c(26, 92, 116, 218, 218, 206)
# Knowledge-weighted estimate:
knowledge_weighted_estimate(E,P)
#> [1] 329.3266
```

Therefore the final knowledge-weighted estimate is 329.3266.
