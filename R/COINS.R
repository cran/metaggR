#' Data: Coin Flips
#'
#' Palley and Soll (2019) recruited individuals on Amazon Mechanical Turk and asked them
#' to estimate the proportion of heads in 100 flips of a biased two-sided coin. The probability
#' of heads was unknown to the participants, who were told that it could be anywhere between
#' 1\% and 99\%. Before responding, each judge was shown a sample of flips that all judges saw
#' (shared information) and another sample of flips that was only seen by that individual or by
#' a subset of judges (private information). Three information structures were considered: 
#'  \enumerate{
#'     \item \strong{Symmetric:} All judges saw their own unique sample of flips.
#'     There are a total of 72 judgment tasks under this condition.
#'     \item \strong{Nested:} Some judges saw only the shared sample while others saw an 
#'     additional common sample.
#'     There are a total of 24 judgment tasks  under this condition.
#'     \item \strong{Nested-Symmetric:} Some judges saw only the shared sample while others
#'      saw their own additional sample of flips.
#'     There are a total of 24 judgment tasks  under this condition.
#' }
#' 
#' @source Asa Palley and Jack Soll. "Extracting the Wisdom of Crowds When Information Is Shared."
#'  \doi{10.1287/mnsc.2018.3047}
#' @name Coin_Flips
NULL
#> NULL


#' @format 
#' \describe{
#' \item{\code{E_COINS_SYMMETRIC}}{is a list of the judges' estimates of the proportion of 
#' heads in 100 flips of a biased two-sided coin under the Symmetric condition.
#' Specifically, the \eqn{j}th element is a vector of the judges' estimated proportions in  the \eqn{j}th task.}
#' }
#' @rdname Coin_Flips
"E_COINS_SYMMETRIC"

#' @format 
#' \describe{
#' \item{\code{E_COINS_NESTED}}{is a list of the judges' estimates of the proportion of 
#' heads in 100 flips of a biased two-sided coin under the Nested condition.
#' Specifically, the \eqn{j}th element is a vector of the judges' estimated proportions in  the \eqn{j}th task.}
#' }
#' @rdname Coin_Flips
"E_COINS_NESTED"

#' @format 
#' \describe{
#' \item{\code{E_COINS_NESTED_SYMMETRIC}}{is a list of the judges' estimates of the proportion of 
#' heads in 100 flips of a biased two-sided coin under the Nested-Symmetric condition.
#' Specifically, the \eqn{j}th element is a vector of the judges' estimated proportions in  the \eqn{j}th task.}
#' }
#' @rdname Coin_Flips
"E_COINS_NESTED_SYMMETRIC"



#' @format 
#' \describe{
#' \item{\code{P_COINS_SYMMETRIC}}{is a list of the judges' predictions of other judges' average estimate
#'  of the proportion of heads in 100 flips of a biased two-sided coin under the Symmetric condition.
#' Specifically, the \eqn{j}th element is a vector of the judges' predictions of others in  the \eqn{j}th task.}
#' }
#' @rdname Coin_Flips
"P_COINS_SYMMETRIC"

#' @format 
#' \describe{
#' \item{\code{P_COINS_NESTED}}{is a list of the judges' predictions of other judges' average estimate
#'  of the proportion of 
#' heads in 100 flips of a biased two-sided coin under the Nested condition.
#' Specifically, the \eqn{j}th element is a vector of the judges' predictions of others in  the \eqn{j}th task.}
#' }
#' @rdname Coin_Flips
"P_COINS_NESTED"

#' @format 
#' \describe{
#' \item{\code{P_COINS_NESTED_SYMMETRIC}}{is a list of the judges' predictions of other judges' average estimate
#'  of the proportion of  
#' heads in 100 flips of a biased two-sided coin under the Nested-Symmetric condition.
#' Specifically, the \eqn{j}th element is a vector of the judges' predictions of others in  the \eqn{j}th task.}
#' }
#' @rdname Coin_Flips
"P_COINS_NESTED_SYMMETRIC"


#' @format 
#' \describe{
#' \item{\code{THETA_COINS_SYMMETRIC}}{is a vector of the actual proportions of heads under the Symmetric condition.
#' Specifically, the \eqn{j}th element is the actual proportion of heads in the \eqn{j}th task.}
#' }
#' @rdname Coin_Flips
"THETA_COINS_SYMMETRIC"

#' @format 
#' \describe{
#' \item{\code{THETA_COINS_NESTED}}{is a vector of the actual proportions of heads under the Nested condition.
#' Specifically, the \eqn{j}th element is the actual proportion of heads in the \eqn{j}th task.}
#' }
#' @rdname Coin_Flips
"THETA_COINS_NESTED"

#' @format 
#' \describe{
#' \item{\code{THETA_COINS_NESTED_SYMMETRIC}}{is a vector of the actual proportions of heads
#'  under the Nested-Symmetric condition.
#' Specifically, the \eqn{j}th element is the actual proportion of heads in the \eqn{j}th task.}
#' }
#' @rdname Coin_Flips
"THETA_COINS_NESTED_SYMMETRIC"


#' @format 
#' \describe{
#' \item{\code{ID_COINS_SYMMETRIC}}{is a list of the judges' identification numbers in the judgment tasks
#' under the Symmetric condition.
#' Specifically, the \eqn{j}th element is a vector of identification numbers of judges' who participated in
#' estimating the proportion of heads in the \eqn{j}th task.
#' These values make it possible to track a judge across judgment tasks.}
#' }
#' @rdname Coin_Flips
"ID_COINS_SYMMETRIC"

#' @format 
#' \describe{
#' \item{\code{ID_COINS_NESTED}}{is a list of the judges' identification numbers in the judgment tasks
#' under the Nested condition.
#' Specifically, the \eqn{j}th element is a vector of identification numbers of judges' who participated in
#' estimating the proportion of heads in the \eqn{j}th task.
#' These values make it possible to track a judge across judgment tasks.}
#' }
#' @rdname Coin_Flips
"ID_COINS_NESTED"


#' @format 
#' \describe{
#' \item{\code{ID_COINS_NESTED_SYMMETRIC}}{is a list of the judges' identification numbers in the judgment tasks
#' under the Nested-Symmetric condition.
#' Specifically, the \eqn{j}th element is a vector of identification numbers of judges' who participated in
#' estimating the proportion of heads in the \eqn{j}th task.
#' These values make it possible to track a judge across judgment tasks.}
#' \item{\emph{Remark.}}{The elements of each list correspond to the same meal. For instance, the \eqn{j}th elements of 
#' \code{THETA_COINS_SYMMETRIC}, \code{E_COINS_SYMMETRIC}, \code{P_COINS_SYMMETRIC}, and \code{ID_COINS_SYMMETRIC}
#'  represent the true proportion, estimates, the predictions of others, and identification
#'  numbers associated with the \eqn{j}th task under the Symmetric condition.}
#' }
#' @rdname Coin_Flips
"ID_COINS_NESTED_SYMMETRIC"


