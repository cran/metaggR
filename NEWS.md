## metaggR v0.2.0 (Release date: 2022-04-25)
* Updated the dependency on the specific version of R to R(>= 4.1). 

## metaggR v0.2.0 (Release date: 2021-08-17)
* Several datasets have been added: NCAA_Basketball, Coin_Flips, General_Knowledge, and Grocery_Prices.
* New Functions:
- knowledge_weights() calculates the knowledge weights used in the knowledge-weighted estimate.
- knowledge_gap() calculates the knowledge gap for given weights.
- KWE() is a helper function and considered internal to the package. 
- get_influence_scores() calculates and plots the influence scores for all judges.
* knowledge_weighted_estimate() has been extended to involve an outlier-robust version of the estimate.
* README now includes an illustration of the outlier-robust version of the knowledge-weighted estimate.

## metaggR v0.1.0 (Release date: 2020-12-29)
* This is the initial submission