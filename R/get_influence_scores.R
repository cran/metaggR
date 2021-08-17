#' Calculate the Influence Scores
#'
#' This function computes and plots the influence scores described in \emph{Palley & Satopää (2021):
#' Boosting the Wisdom of Crowds Within a Single Judgment Problem: Weighted Averaging Based on Peer Predictions}.
#' The current version of the paper is available at \url{https://papers.ssrn.com/sol3/Papers.cfm?abstract_id=3504286}
#' @param E Vector of \eqn{J \ge 6} estimates of the outcome.
#' @param P Vector of \eqn{J \ge 6} predictions of others. The values must be in the same order as the estimates in \code{E}.
#' Specifically, for all \eqn{j = 1, ..., J}, \code{E[j]} and \code{P[j]} give the \eqn{j}th judge's estimate and prediction of others, respectively.
#' @param plotIt A boolean value. If TRUE, then the function call produces two side-by-side plots:
#' \enumerate{
#'     \item Left plot: This is a scatter plot of the judges' estimates against the judges' implied predictions of others. 
#'     This plot includes regression lines both with (solid black) and without (dashed red) the exceptionally influential judges.
#'     All exceptionally influential judges are shown in red. 
#'     The knowledge-weighted estimate is shown both with (black square) and without (red circle) exceptionally influential judges.
#'     \item Right plot: This shows the judges' influence scores. 
#'     All exceptionally influential judges are shown in red. 
#'     The dashed horizontal line represents the threshold, defined as the user-defined \code{cutoff} value x the
#'     interquartile range of all influence scores. 
#' }
#' For more information on the plots, see the Electronic Companion of \emph{Palley & Satopää (2021):
#' Boosting the Wisdom of Crowds Within a Single Judgment Problem: Weighted Averaging Based on Peer Predictions}
#'  at \url{https://papers.ssrn.com/sol3/Papers.cfm?abstract_id=3504286}.
#' @param cutoff A positive scalar describing the cutoff value for the outlier-robust knowledge-weighted estimate. 
#' The outlier-robust version calculates the influence scores for all 
#' judges. Each influence score is then compared against \code{cutoff} x the
#' interquartile range of all influence scores. If a judge's influence score is above this quantity, then that judge is 
#' deemed exceptionally influential. This parameter only has an effect if \code{plotIt} has been set to TRUE.
#' @return \eqn{J} vector of influence scores. Intuitively, the influence score of a judge represents the amount by which the 
#' knowledge-weighted estimate would change if that judge was removed from the crowd. Judges with an exceptionally 
#' high influence should be inspected. As a default cutoff value, the authors recommend \eqn{7/2} times the interquartile range
#' of the individual judges' influence scores. 
#' @examples
#' # Illustration on the Three Gorges Dam Example in Palley & Satopää (2021):
#' 
#' # The original example with 6 judges is augmented with a 7th judge with an extreme response.
#' # Judges' estimates:
#' E2 = c(50, 134, 206, 290, 326, 374, 1000)
#' # Judges' predictions of others
#' P2 = c(26, 92, 116, 218, 218, 206, 400)
#'
#' # The influence score of the 7th judge is much higher than the other judges' scores.
#' # This judge's response should be inspected and potentially excluded from
#' # the final knowledge-weighted estimate.
#' get_influence_scores(E2,P2)
#' @export
get_influence_scores = function(E, P, 
                                plotIt = FALSE,
                                cutoff = 7/2){
  # Check violations of conditions:
  if(!is.numeric(P) | !is.numeric(E)) stop(simpleError("All elements of E and/or P are not numbers."))
  if(!is.vector(P) | !is.vector(E)) stop(simpleError("E and/or P are not vectors."))
  J = length(E)
  if(J <= 5) stop(simpleError("Influence score computation requires a crowd with 6 or more judges."))
  if(J != length(P)) stop(simpleError("The lengths of P and E differ."))
  if(any(is.na(E)) | any(is.na(P))) stop(simpleError("The inputs E and/or P contain NAs. Missing values must be handled outside the function call."))

  KWE_full = KWE(E, P)
  infs = NULL
  for(j in 1:J){
    E_j = E[-j]
    P_j = P[-j]
    KWE_j = KWE(E_j, P_j)
    infs[j] = abs(KWE_full - KWE_j)
  }
  
  if(plotIt){
    IQR = diff(stats::quantile(infs, c(0.25, 0.75)))
    select = infs > cutoff*IQR
  
    graphics::par(mfrow = c(1, 2), mar = c(5, 5, 1, 1), oma = c(0.5,1,0.5,0.5))    
    ## With influencial points:
    O = (1/J)*E + (J-1)/J*P
    lin_O_w = stats::lm(O~E)
    KWC_w = knowledge_weighted_estimate(E,P,no_inf_check=TRUE)
    
    J_wo = sum(!select)
    O_wo = (1/J_wo)*E[!select] + (J_wo-1)/J_wo*P[!select]
    lin_O_wo = stats::lm(O_wo~E[!select])
    KWC_wo = knowledge_weighted_estimate(E[!select],P[!select],no_inf_check=TRUE)
    
    graphics::par(xpd=FALSE)
    graphics::plot(O~E,
         xlab = expression(E[j]~"(Estimate of" ~ theta*")"), 
         ylab = expression(O[j]~"(Implied prediction of"~ bar(E)*")"),
         pch = 16,
         col = grDevices::rgb(0,0,0,alpha=1),
         xlim = range(E, O),
         ylim = range(E, O),
         cex = 1.5, cex.lab = 1.5, cex.axis = 1.5)
    
    graphics::abline(lin_O_w, lwd = 3, lty = 1)
    graphics::abline(lin_O_wo, lwd = 3, lty = 2, col = "red")
    graphics::points(O~E, col = "black", pch = 16, cex = 1.5)
    graphics::points(O[select]~E[select], col = "red", pch = 16, cex = 1.5)
    
    graphics::par(xpd=TRUE)
    graphics::points(c(KWC_w, KWC_wo), 
           y = rep((graphics::par("usr")[1]), 2), 
           pch = c(0, 1), col = c("black", "red"), cex = 2, lwd = 3)
    
    ## Plot each judge's influence score:
    graphics::par(xpd=FALSE)
    graphics::plot(infs, ylab = "Influence Score", xlab = "Judge", pch = 16,
         cex = 1.5, cex.lab = 1.5, cex.axis = 1.5)
    graphics::abline(h = cutoff*IQR, lty = 3, lwd = 2)
    graphics::points(y = infs[select], x = c(1:length(infs))[select], col = "red", pch = 16, cex = 1.5)
  }
  
  return(infs)
}
