#' Data: Grocery Prices
#'
#' Palley and Soll (2019) recruited volunteers passing through the student union to estimate the total 
#' price of 10 different bundles of nonperishable grocery items. 
#' Examples of items include a bottle of 190 Lil Critters Gummy Vites Sour 
#' Complete multivitamins ($10.93), a 5-oz. can of Wild Planet wild albacore tuna in 
#' extra virgin olive oil ($4.19), and an 11 oz. bag of Stauffer's Animal Crackers ($1.00).
#' 
#' @source Asa Palley and Jack Soll. "Extracting the Wisdom of Crowds When Information Is Shared."
#'  \doi{10.1287/mnsc.2018.3047}
#' @name Grocery_Prices
NULL
#> NULL


#' @format 
#' \describe{
#' \item{\code{E_GROCERIES}}{is a list of the judges' estimates of the prices in each of the 10 bundles of groceries.
#' Specifically, the \eqn{j}th element is a vector of the judges' estimates of the price of the \eqn{j}th bundle.}
#' }
#' @rdname Grocery_Prices
"E_GROCERIES"

#' @format 
#' \describe{
#' \item{\code{P_GROCERIES}}{is a list of the judges' predictions of others.
#' Specifically, the \eqn{j}th element is a vector of the judges' predictions of other judges' average
#' estimate of the price of the \eqn{j}th bundle.}
#' }
#' @rdname Grocery_Prices
"P_GROCERIES"


#' @format 
#' \describe{
#' \item{\code{THETA_GROCERIES}}{is a vector of the prices of the 10 bundles of groceries.
#' Specifically, the \eqn{j}th element is the actual price of the \eqn{j}th bundle.}
#' }
#' @rdname Grocery_Prices
"THETA_GROCERIES"

#' @format 
#' \describe{
#' \item{\code{ID_GROCERIES}}{is a list of the judges' identification numbers in the judgment tasks.
#' Specifically, the \eqn{j}th element is a vector of identification numbers of judges' who participated in
#' estimating the price of the \eqn{j}th bundle. These values make it possible to track a judge across judgment tasks.}
#' \item{\emph{Remark.}}{The elements of each list correspond to the same judgment task. Specifically, the \eqn{j}th elements of 
#' \code{THETA_GROCERIES}, \code{E_GROCERIES}, \code{P_GROCERIES}, and \code{ID_GROCERIES}
#'  represent the true price, estimates, the predictions of others, and identification
#'  numbers associated with the \eqn{j}th bundle.}
#' }
#' @rdname Grocery_Prices
"ID_GROCERIES"


