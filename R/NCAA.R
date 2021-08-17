#' Data: NCAA Basketball
#'
#' Palley and Soll (2019)  recruited participants through ClearVoice Research and 
#' Amazon Mechanical Turk to estimate the probability that one team or the other would win 
#' various games in the 2014, 2015, and 2016 NCAA Division I Men’s Basketball Tournaments. 
#' The responses for the Round of 64 games and Round of 16 games are treated separately 
#' because the Round of 64 games happen at the start of the tournament and often involve 
#' heavily mismatched teams (e.g., a 1 seed versus a 16 seed) while Round of 16 games typically 
#' involve more evenly matched teams, with implied betting market probabilities closer to 50\%.
#' 
#' @source Asa Palley and Jack Soll. "Extracting the Wisdom of Crowds When Information Is Shared."
#'  \doi{10.1287/mnsc.2018.3047}
#' @name NCAA_Basketball
NULL
#> NULL


#' @format 
#' \describe{
#' \item{\code{E_NCAA_R64}}{is a list of the judges' estimates of the probability that
#' the given team wins in Round of 64.
#' Specifically, the \eqn{j}th element is a vector of the judges' estimated probability in  the \eqn{j}th game.}
#' }
#' @rdname NCAA_Basketball
"E_NCAA_R64"

#' @format 
#' \describe{
#' \item{\code{E_NCAA_R16}}{is a list of the judges' estimates of the probability that
#' the given team wins in Round of 16.
#' Specifically, the \eqn{j}th element is a vector of the judges' estimated probability in  the \eqn{j}th game.}
#' }
#' @rdname NCAA_Basketball
"E_NCAA_R16"



#' @format 
#' \describe{
#' \item{\code{P_NCAA_R64}}{is a list of the judges' predictions of other judges' average probability that
#' the given team wins in Round of 64.
#' Specifically, the \eqn{j}th element is a vector of the judges' predictions of the other judges' average probabilities in  the \eqn{j}th game.}
#' }
#' @rdname NCAA_Basketball
"P_NCAA_R64"

#' @format 
#' \describe{
#' \item{\code{P_NCAA_R16}}{is a list of the judges' predictions of other judges' average probability that
#' the given team wins in Round of 16.
#' Specifically, the \eqn{j}th element is a vector of the judges' predictions of the other judges' average probabilities in  the \eqn{j}th game.}
#' }
#' @rdname NCAA_Basketball
"P_NCAA_R16"



#' @format 
#' \describe{
#' \item{\code{THETA_NCAA_R64}}{is a vector of the actual outcomes of the games in the Round of 64.
#' Specifically, the \eqn{j}th element is the actual outcome of \eqn{j}th game in Round of 64.}
#' }
#' @rdname NCAA_Basketball
"THETA_NCAA_R64"

#' @format 
#' \describe{
#' \item{\code{THETA_NCAA_R16}}{is a vector of the actual outcomes of the games in the Round of 16.
#' Specifically, the \eqn{j}th element is the actual outcome of \eqn{j}th game in Round of 16.}
#' }
#' @rdname NCAA_Basketball
"THETA_NCAA_R16"


#' @format 
#' \describe{
#' \item{\code{ID_NCAA_R64}}{is a list of the judges' identification numbers in the judgment tasks
#' associated with the Round of 64 games.
#' Specifically, the \eqn{j}th element is a vector of identification numbers of judges' who participated in
#' estimating the probability of a given team winning the \eqn{j}th game of Round of 64.
#' These values make it possible to track a judge across judgment tasks.}
#' }
#' @rdname NCAA_Basketball
"ID_NCAA_R64"

#' @format 
#' \describe{
#' \item{\code{ID_NCAA_R16}}{is a list of the judges' identification numbers in the judgment tasks
#' associated with the Round of 16 games.
#' Specifically, the \eqn{j}th element is a vector of identification numbers of judges' who participated in
#' estimating the probability of a given team winning the \eqn{j}th game of Round of 16.
#' These values make it possible to track a judge across judgment tasks.}
#' \item{\emph{Remark.}}{The elements of each list correspond to the same game. Specifically, the \eqn{j}th elements of 
#' \code{THETA_NCAA_R16}, \code{E_NCAA_R16}, \code{P_NCAA_R16}, and \code{ID_NCAA_R16}
#'  represent the true outcome, estimates, the predictions of others, and identification
#'  numbers associated with the \eqn{j}th game in the Round of 16.}
#' }
#' @rdname NCAA_Basketball
"ID_NCAA_R16"

