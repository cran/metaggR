% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/knowledge_gap.R
\name{knowledge_gap}
\alias{knowledge_gap}
\title{Calculate the Knowledge Gap}
\usage{
knowledge_gap(E, P, alpha)
}
\arguments{
\item{E}{Vector of \eqn{J \ge 5} estimates of the outcome.}

\item{P}{Vector of \eqn{J \ge 5} predictions of others. The values must be in the same order as the estimates in \code{E}.
Specifically, for all \eqn{j = 1, ..., J}, \code{E[j]} and \code{P[j]} give the \eqn{j}th judge's estimate and prediction of others, respectively.}

\item{alpha}{Vector of \eqn{J \ge 5} weights. The \code{alpha[j]} element is the weight assigned to \code{E[j]}. 
The weights can be any values in the real line as long as they sum to 1.}
}
\value{
A singular value representing the knowledge gap. This represents the expected distance between the
weighted combination of the judges' estimates, 
where the weights have been given by \code{alpha}, and the optimal aggregate estimate called the Global Posterior Expectation (GPE).
}
\description{
This function computes the knowledge gap described in \emph{Palley & Satopää (2021):
Boosting the Wisdom of Crowds Within a Single Judgment Problem: Weighted Averaging Based on Peer Predictions}.
The current version of the paper is available at \url{https://papers.ssrn.com/sol3/Papers.cfm?abstract_id=3504286}
}
\examples{
# Illustration on the Three Gorges Dam Example in Palley & Satopää (2021):

# Judges' estimates:
E = c(50, 134, 206, 290, 326, 374)
# Judges' predictions of others
P = c(26, 92, 116, 218, 218, 206)

# First find the knowledge-weights that minimize the knowledge gap:
alpha = knowledge_weights(E,P)
knowledge_gap(E,P, alpha)

# Small perturbations increase the knowledge gap:
alpha_per = alpha 
alpha_per[1] = alpha_per[1] + 0.001
alpha_per[2] = alpha_per[2] - 0.001
knowledge_gap(E,P, alpha_per)
}
