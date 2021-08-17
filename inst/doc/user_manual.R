## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(metaggR)

## -----------------------------------------------------------------------------
# Judges' estimates:
E1 = c(50, 134, 206, 290, 326, 374)
# Judges' predictions of others:
P1 = c(26, 92, 116, 218, 218, 206)
# Knowledge-weighted estimate:
knowledge_weighted_estimate(E1,P1)

## -----------------------------------------------------------------------------
library(metaggR)
data("E_CALORIES_INITIAL")
data("E_CALORIES_FINAL")
data("P_CALORIES")
data("THETA_CALORIES")

## -----------------------------------------------------------------------------
meal = 1
# True number of calories in the first meal:
(theta = THETA_CALORIES[meal])
# Judges' initial estimates of the number of calories in the first meal:
(E_initial = E_CALORIES_INITIAL[[meal]])
# Judges' final estimates of the number of calories in the first meal:
(E_final = E_CALORIES_FINAL[[meal]])
# Judges' predictions of others' average estimate of the number of calories in the first meal:
(P = P_CALORIES[[meal]])

## -----------------------------------------------------------------------------
# RMSE of the initial estimates:
sqrt(mean((E_initial-theta)^2))
# RMSE of the final estimates:
sqrt(mean((E_final-theta)^2))

# RMSE of the knowledge-weighted estimate based on judges' initial estimates:
(KWE1 =  knowledge_weighted_estimate(E_initial, P, no_inf_check = TRUE))
sqrt((KWE1 - theta)^2)
# RMSE of the knowledge-weighted estimate based on judges' final estimates:
(KWE2 =  knowledge_weighted_estimate(E_final, P, no_inf_check = TRUE))
sqrt((KWE2 - theta)^2)


