#' Knowledge-Weighted Estimate
#'
#' This function computes the knowledge-weighted estimate from \emph{Palley & Satopää (2020):
#' Boosting the Wisdom of Crowds Within a Single Judgment Problem: Weighted Averaging Based on Peer Predictions}.
#' The current version of the paper is available at \url{https://papers.ssrn.com/sol3/Papers.cfm?abstract_id=3504286}
#' @param E Vector of \eqn{J \ge 5} estimates of the outcome.
#' @param P Vector of \eqn{J \ge 5} predictions of others. The values must be in the same order as the estimates in \code{E}.
#' Specifically, for all \eqn{j = 1, ..., J}, \code{E[j]} and \code{P[j]} give the \eqn{j}th judge's estimate and prediction of others, respectively.
#' @return The knowledge-weighted estimate
#' @examples
#' # Illustration on the Three Gorges Dam Example in Palley & Satopää (2020):
#'
#' # Judges' estimates:
#' E = c(50, 134, 206, 290, 326, 374)
#' # Judges' predictions of others
#' P = c(26, 92, 116, 218, 218, 206)
#'
#' # Knowledge-weighted estimate is 329.3266
#' knowledge_weighted_estimate(E,P)
#' @export
knowledge_weighted_estimate = function(E,P){
	# Check violations of conditions:
  if(!is.numeric(P) | !is.numeric(E)) stop(simpleError("All elements of E and/or P are not numbers."))
  if(!is.vector(P) | !is.vector(E)) stop(simpleError("E and/or P are not vectors."))
  J = length(E)
  if(J <= 4) stop(simpleError("The crowd must have 5 or more judges."))
	if(J != length(P)) stop(simpleError("The lengths of P and E differ."))
  if(any(is.na(E)) | any(is.na(P))) stop(simpleError("The inputs E and/or P contain NAs. Missing values must be handled outside the function call."))

  if(stats::var(E) == 0) {
    warning(simpleError("All judges' estimates are the same. The return value is the consensus estimate."))
    return(E[1])
  } else {
  	E = matrix(E, J, 1)
  	P = matrix(P, J, 1)
  	O = (1/J)*E + (J-1)/J*P # Judges' implied predictions
    Ebar =  mean(E) # Equally weighted average
    lin_mdl = stats::lm(P~E)
    r = stats::residuals(lin_mdl)
    sigmae2 = stats::deviance(lin_mdl)/stats::df.residual(lin_mdl)
    sigmaE2 = mean(E^2) - Ebar^2
    Q = (O - (J-1)/J*r) %*% t( O - (J-1)/J*r ) + E %*%  t(E)*
        ( ((J-1)/J)^2 *(J-2)/(J*(J-4))*sigmae2/sigmaE2 )
    c = -2*Ebar*(O - (J-1)/J*r+(((J-1)/J)^2 *(J-2)/(J*(J-4))*sigmae2/sigmaE2)*E)
    V = MASS::ginv(Q %*% Q + matrix(0.25, J, J)) %*% Q
    R = 1 - Q %*% V %*% matrix(1, J, 1)
    L = (t(R) %*% R + 0.25*sum(V)^2)[1,1]
    alpha = (0.5* (R %*% matrix(1, 1, J) - L*diag(J)) %*% V  %*% c  + R) / L
    return(as.numeric(t(alpha) %*% E)) # Knowledge-weighted estimate
  }
}
