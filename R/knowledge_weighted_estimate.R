#' Knowledge-Weighted Estimate
#'
#' This function computes the knowledge-weighted estimate from \emph{Palley & Satopää (2021):
#' Boosting the Wisdom of Crowds Within a Single Judgment Problem: Weighted Averaging Based on Peer Predictions}.
#' The current version of the paper is available at \url{https://papers.ssrn.com/sol3/Papers.cfm?abstract_id=3504286}.
#' @param E Vector of \eqn{J} estimates of the outcome. If influence scores are calculated
#'  (i.e., \code{no_inf_check} is FALSE), then the function call requires \eqn{J \ge 6}; else the knowledge-weighted estimated requires
#'  at least \eqn{J \ge 5} judges. 
#' @param P Vector of \eqn{J} predictions of others. The values must be in the same order as the estimates in \code{E}.
#' Specifically, for all \eqn{j = 1, ..., J}, \code{E[j]} and \code{P[j]} give the \eqn{j}th judge's estimate and prediction of others, respectively.
#' @param cutoff A positive scalar describing the cutoff value for the outlier-robust knowledge-weighted estimate. 
#' The outlier-robust version calculates the influence scores for all 
#' judges (see \code{\link[metaggR]{get_influence_scores}} function). Each influence score is then compared against \code{cutoff} x the
#' interquartile range of all influence scores. If a judge's influence score is above this quantity, then that judge is 
#' deemed exceptionally influential. By default, the influence scores are checked and a warning is given if an exceptionally
#' influential judge is found.
#' To turn off this feature, set \code{no_inf_check} to TRUE.
#' @param remove_inf A boolean value. If TRUE, then all exceptionally influential judges are removed before 
#' the knowledge-weighted estimate is calculated. If FALSE, then the knowledge-weighted estimate is 
#' calculated based on the responses of all \eqn{J} judges.
#' @param  no_inf_check A boolean value. If TRUE, then the influence scores are not calculated at any point.
#' This can be helpful to speed up calculations. However, the authors recommend checking for influential judges
#' each time the knowledge weighted estimate is applied.
#' @return A singular value representing the knowledge-weighted estimate
#' @examples
#' # Illustration on the Three Gorges Dam Example in Palley & Satopää (2021):
#'
#' # Judges' estimates:
#' E1 = c(50, 134, 206, 290, 326, 374)
#' # Judges' predictions of others
#' P1 = c(26, 92, 116, 218, 218, 206)
#'
#' # Knowledge-weighted estimate is 329.305
#' knowledge_weighted_estimate(E1,P1)
#' 
#' # The original example with 6 judges is augmented with a 7th judge with an extreme response.
#' # Judges' estimates:
#' E2 = c(50, 134, 206, 290, 326, 374, 1000)
#' # Judges' predictions of others
#' P2 = c(26, 92, 116, 218, 218, 206, 400)
#' 
#' # Knowledge-weighted estimate is 630.0491
#' # The function call warns of exceptionally influential judges.
#' knowledge_weighted_estimate(E2,P2)
#' 
#' # Calculate the knowledge-weighted estimate without influence score checking.
#' knowledge_weighted_estimate(E2,P2, no_inf_check = TRUE)
#' 
#' # Calculate the influence scores of the judges.
#' # This reveals that the 7th judge is highly influential.
#' get_influence_scores(E2,P2)
#' 
#' # Calculate the outlier-robust knowledge-weighted estimate.
#' # This removes all highly influential judges, namely judge 7 in this simple example, 
#' # and returns the knowledge-weighted estimate of the remaining judges' estimates.
#' # This estimate aligns with the original 329.305
#' knowledge_weighted_estimate(E2,P2, remove_inf = TRUE)
#' 
#' 
#' @export
knowledge_weighted_estimate = function(E,P, cutoff = 7/2, remove_inf = FALSE, no_inf_check = FALSE){
	# Check violations of conditions:
  if(!is.numeric(P) | !is.numeric(E)) stop(simpleError("All elements of E or P are not numbers."))
  if(!is.vector(P) | !is.vector(E)) stop(simpleError("E or P are not vectors."))
  J = length(E)
  if(J <= 4) stop(simpleError("The crowd must have 5 or more judges."))
	if(J != length(P)) stop(simpleError("The lengths of P and E differ."))
  if(any(is.na(E)) | any(is.na(P))) stop(simpleError("The inputs E or P contain NAs. 
                                                     Missing values must be handled outside the function call."))

  if(stats::var(E) == 0) {
    warning(simpleError("All judges' estimates are the same. The return value is the consensus estimate."))
    return(E[1])
  } else {
  
    # The influence scores are not checked:
    if(no_inf_check){
      return(KWE(E,P))

    } else {
      if(J <= 5) stop(simpleError("Influence score computation requires a crowd with 6 or more judges."))
      
      KWE_full = KWE(E, P)
      infs = NULL
      for(j in 1:J){
          E_j = E[-j]
          P_j = P[-j]
          KWE_j = KWE(E_j, P_j)
          infs[j] = abs(KWE_full - KWE_j)
      }
      IQR =  diff(stats::quantile(infs, c(0.25, 0.75)))
      select = infs < cutoff*IQR
      
      ## remove_inf == TRUE: Remove influential points as defined by cutoffxIQR.
      if(remove_inf){
        num_non_outlier = sum(select)
        if(num_non_outlier < 5){
          warning(simpleError("After removing influential responses, fewer than 5 judges remain. Returning the median estimate of the full crowd."))
          KWE_robust = stats::median(E)
        } else {
          KWE_robust = KWE(E[select],P[select])
        }
        return(KWE_robust)
        
      ## remove_inf == FALSE: Do not remove influential points.
      } else {
        if(any(!select)) warning(simpleError("Some responses are highly influential. Call get_influence_scores(E,P)."))
        return(KWE_full)
      }
    }
  }
}
