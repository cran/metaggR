#' This function standardizes the responses, calculates the knowledge-weighted estimate, 
#' and then reverse-standardizes the knowledge-weighted estimate. 
#' This is done for computational stability and should be considered internal to the package.
#' @param E Vector of \eqn{J \ge 5} estimates of the outcome.
#' @param P Vector of \eqn{J \ge 5} predictions of others. The values must be in the same order as the estimates in \code{E}.
#' Specifically, for all \eqn{j = 1, ..., J}, \code{E[j]} and \code{P[j]} give the \eqn{j}th judge's estimate and prediction of others, respectively.
#' @return The knowledge-weighted estimate
#' @noRd
KWE = function(E,P){
  if(stats::var(E) == 0){
    ## All E's are equal; return the consensus.
    return(E[1])
    
  } else {
    ## Standardize:
    mu_E = mean(E)
    sd_E = stats::sd(E)
    E = (E - mu_E)/sd_E
    P = (P - mu_E)/sd_E
    
    alpha = knowledge_weights(E,P)
    
    ## Aggregate and reverse-standardize:
    return(as.numeric((t(alpha) %*% E)*sd_E + mu_E))
  }
}