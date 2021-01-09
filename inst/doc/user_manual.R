## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(metaggR)

## -----------------------------------------------------------------------------
# Judges' estimates:
E = c(50, 134, 206, 290, 326, 374)
# Judges' predictions of others:
P = c(26, 92, 116, 218, 218, 206)
# Knowledge-weighted estimate:
knowledge_weighted_estimate(E,P)

## -----------------------------------------------------------------------------
library(metaggR)
data(calories)

## -----------------------------------------------------------------------------
meal = 1
# True number of calories in the first meal:
(theta = calories$true_calories[meal])
# Judges' initial estimates of the number of calories in the first meal:
(E1 = calories$estimates_initial[[meal]])
# Judges' final estimates of the number of calories in the first meal:
(E2 = calories$estimates_final[[meal]])
# Judges' predictions of others' average estimate of the number of calories in the first meal:
(P = calories$predictions_of_others[[meal]])

## -----------------------------------------------------------------------------
# RMSE of the initial estimates:
sqrt(mean((E1-theta)^2))
# RMSE of the final estimates:
sqrt(mean((E2-theta)^2))

# RMSE of the knowledge-weighted estimate based on judges' initial estimates:
(KWE1 =  knowledge_weighted_estimate(E1, P))
sqrt((KWE1 - theta)^2)
# RMSE of the knowledge-weighted estimate based on judges' final estimates:
(KWE2 =  knowledge_weighted_estimate(E2, P))
sqrt((KWE2 - theta)^2)


