#' Judges' Estimates of Calorie Counts
#'
#' This dataset contains the responses collected in an experiment in Palley and Satopää (2020).
#' In this experiment participants were presented with 36 different pictures of food from different restaurants
#' and were asked to estimate the total number of calories in these dishes.
#' Each response involves three steps:
#' \enumerate{
#'     \item \strong{Initial Estimates:} On the first screen the participant was presented with a picture of a meal
#' and asked \emph{How many calories do you think are in this meal?}
#'     \item \strong{Predictions of Others:} On the second screen the participant saw the same
#' picture, was reminded of their previous estimate, and given the statement:
#' \emph{We will be showing this picture to other participants as well. Just as we did with
#' you, we will ask them how many calories they believe are in this meal.}
#' The participant was then asked to predict \emph{How many calories do you think that others
#' will guess on average?}
#'     \item \strong{Final Estimates:} On the third screen the participant saw the same picture again
#'     and was asked \emph{After having reflected on others, what is
#'  your own final best estimate of the number of calories in this meal?}
#' }
#'
#' @format A list with 4 elements:
#' \describe{
#'   \item{true_calories}{A vector of true calorie counts of each 36 meals.}
#'   \item{estimates_initial}{A list of the judges' initial estimates of the calorie counts in each of the 36 meals.}
#'   \item{estimates_final}{A list of the judges' final estimates of the calorie counts in each of the 36 meals.}
#'   \item{predictions_of_others}{A list of the judges' predictions of the others' average estimate of the calorie counts in each of the 36 meals.}
#' }
#' The elements of each list correspond to the same meal. Specifically, the \eqn{j}th elements
#' of \code{true_calories}, \code{estimates_initial}, \code{estimates_final}, and \code{predictions_of_others} represent
#' the true calories, initial estimates, final estimates, and the predictions of others of
#' the \eqn{j}th meal.
#' @source Asa Palley and Ville Satopää. "Boosting the Wisdom of Crowds Within a Single Judgment Problem:
#' Selective Averaging Based on Peer Predictions." \url{https://papers.ssrn.com/sol3/Papers.cfm?abstract_id=3504286}
"calories"
