#' Calculate the Knowledge Gap
#'
#' This function computes the knowledge gap described in \emph{Palley & Satopää (2021):
#' Boosting the Wisdom of Crowds Within a Single Judgment Problem: Weighted Averaging Based on Peer Predictions}.
#' The current version of the paper is available at \url{https://papers.ssrn.com/sol3/Papers.cfm?abstract_id=3504286}
#' @param E Vector of \eqn{J \ge 5} estimates of the outcome.
#' @param P Vector of \eqn{J \ge 5} predictions of others. The values must be in the same order as the estimates in \code{E}.
#' Specifically, for all \eqn{j = 1, ..., J}, \code{E[j]} and \code{P[j]} give the \eqn{j}th judge's estimate and prediction of others, respectively.
#' @param alpha Vector of \eqn{J \ge 5} weights. The \code{alpha[j]} element is the weight assigned to \code{E[j]}. 
#' The weights can be any values in the real line as long as they sum to 1.
#' @return A singular value representing the knowledge gap. This represents the expected distance between the
#' weighted combination of the judges' estimates, 
#' where the weights have been given by \code{alpha}, and the optimal aggregate estimate called the Global Posterior Expectation (GPE).
#' @examples
#' # Illustration on the Three Gorges Dam Example in Palley & Satopää (2021):
#'
#' # Judges' estimates:
#' E = c(50, 134, 206, 290, 326, 374)
#' # Judges' predictions of others
#' P = c(26, 92, 116, 218, 218, 206)
#'
#' # First find the knowledge-weights that minimize the knowledge gap:
#' alpha = knowledge_weights(E,P)
#' knowledge_gap(E,P, alpha)
#' 
#' # Small perturbations increase the knowledge gap:
#' alpha_per = alpha 
#' alpha_per[1] = alpha_per[1] + 0.001
#' alpha_per[2] = alpha_per[2] - 0.001
#' knowledge_gap(E,P, alpha_per)
#' @export
knowledge_gap = function(E,P, alpha){
  if(round(sum(alpha), 2) != 1) stop(simpleError("The weights must sum to 1."))
  if(!is.numeric(P) | !is.numeric(E)) stop(simpleError("All elements of E or P are not numbers."))
  if(!is.vector(P) | !is.vector(E)) stop(simpleError("E or P are not vectors."))
  
  J = length(E)
  if(J <= 4) stop(simpleError("The crowd must have 5 or more judges."))
  if(J != length(P)) stop(simpleError("The lengths of P and E differ."))
  if(any(is.na(E)) | any(is.na(P))) stop(simpleError("The inputs E or P contain NAs. 
                                                     Missing values must be handled outside the function call."))
  
  O = (1/J) * E + (J - 1)/J * P
  Ebar = mean(E)
  lin_mdl = stats::lm(P ~ E)
  r = stats::residuals(lin_mdl)
  sigmae2 = stats::deviance(lin_mdl)/stats::df.residual(lin_mdl)
  sigmaE2 = mean(E^2) - Ebar^2
  gap = (t(alpha) %*% O - (J-1)/J * t(alpha) %*% r - Ebar)^2 + ((J-1)/J)^2 *(J-2)/(J*(J-4)) * sigmae2 * (1+(Ebar-t(alpha)%*%E)^2/sigmaE2)
  return(as.numeric(gap))
}
