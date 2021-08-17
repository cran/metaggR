#' Calculate the Weights that Minimize the Knowledge Gap
#'
#' This function computes the weighted used in the knowledge-weighted estimate of \emph{Palley & Satopää (2021):
#' Boosting the Wisdom of Crowds Within a Single Judgment Problem: Weighted Averaging Based on Peer Predictions}.
#' The current version of the paper is available at \url{https://papers.ssrn.com/sol3/Papers.cfm?abstract_id=3504286}
#' @param E Vector of \eqn{J \ge 5} estimates of the outcome.
#' @param P Vector of \eqn{J \ge 5} predictions of others. The values must be in the same order as the estimates in \code{E}.
#' Specifically, for all \eqn{j = 1, ..., J}, \code{E[j]} and \code{P[j]} give the \eqn{j}th judge's estimate and prediction of others, respectively.
#' @return \eqn{Jx1} vector of weights that minimizes the knowledge gap and lead to the knowledge-weighted estimate.
#' @examples
#' # Illustration on the Three Gorges Dam Example in Palley & Satopää (2021):
#'
#' # Judges' estimates:
#' E = c(50, 134, 206, 290, 326, 374)
#' # Judges' predictions of others
#' P = c(26, 92, 116, 218, 218, 206)
#'
#' # Weights used in the knowledge-weighted estimate:
#' alpha = knowledge_weights(E,P)
#'
#' # Knowledge-weighted estimate is 329.3266
#' t(alpha) %*% E
#' 
#' # Alternatively, the knowledge-weighted estimate can be calculated using 
#' # the knowledge_weighted_estimate() function. This returns 329.305, which
#' # is slightly different from the above result. The difference arises because
#' # knowledge_weighted_estimate() improves stability by standardizing the 
#' # judges' responses before aggregating them.
#' knowledge_weighted_estimate(E,P)
#' @export
knowledge_weights = function(E,P){
  # Check violations of conditions:
  if(!is.numeric(P) | !is.numeric(E)) stop(simpleError("All elements of E and/or P are not numbers."))
  if(!is.vector(P) | !is.vector(E)) stop(simpleError("E and/or P are not vectors."))
  J = length(E)
  if(J <= 4) stop(simpleError("The crowd must have 5 or more judges."))
  if(J != length(P)) stop(simpleError("The lengths of P and E differ."))
  if(any(is.na(E)) | any(is.na(P))) stop(simpleError("The inputs E and/or P contain NAs. Missing values must be handled outside the function call."))

  O = (1/J) * E + (J - 1)/J * P
  Ebar = mean(E)
  lin_mdl = stats::lm(P ~ E)
  r = stats::residuals(lin_mdl)
  sigmae2 = stats::deviance(lin_mdl)/stats::df.residual(lin_mdl)
  sigmaE2 = mean(E^2) - Ebar^2
  Q = (O - (J - 1)/J * r) %*% t(O - (J - 1)/J * r) + E %*%
    t(E) * (((J - 1)/J)^2 * (J - 2)/(J * (J - 4)) * sigmae2/sigmaE2)
  c = -2 * Ebar * (O - (J - 1)/J * r + (((J - 1)/J)^2 * (J - 2)/(J * (J - 4)) * sigmae2/sigmaE2) * E)
  
  V = MASS::ginv(Q %*% Q + matrix(0.25, J, J)) %*% Q
  R = 1 - Q %*% V %*% matrix(1, J, 1)
  L = (t(R) %*% R + 0.25 * sum(V)^2)[1, 1]
  alpha = (0.5 * (R %*% matrix(1, 1, J) - L * diag(J)) %*% t(V) %*% c + R)/L
  return(alpha)
}

