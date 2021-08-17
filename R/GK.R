#' Data: General Knowledge Statements
#'
#' Martinie et al. (2020) recruited individuals on Amazon Mechanical Turk and asked them to provide subjective probabilities
#'  of whether various general science statements from U.S. grade school were true or false. 
#'  Problems were classified into five levels of difficulty, with level 1 being the easiest and level 5 being the most difficult. 
#'  For example, one easy problem (level 1) presented the statement \emph{Omnivores only eat meat}, whereas one 
#'  difficult problem (level 5) presented the statement \emph{Sound waves and electromagnetic waves 
#'  are examples of longitudinal waves}. 
#'  
#' The full data have been split into 5 groups based on the difficulty the questions.
#' \enumerate{
#'     \item \code{E_GK_1} to \code{E_GK_5}: A list of the judges' estimates of the probabilities 
#'     that the statements are true. 
#'     \item \code{P_GK_1} to \code{P_GK_5}: A list of the judges' predictions of others' average probability estimates. 
#'     \item \code{ID_GK_1} to \code{ID_GK_5}: A list of the judges' identification numbers. 
#'     These values make it possible to track a judge across different judgment tasks. 
#'     \item \code{THETA_GK_1} to \code{THETA_GK_5}: Actual outcomes showing whether the statements are true (1) or not (0).
#' }
#' The final number in the name of the data set indicates the associated difficulty level.
#' For instance, \code{E_GK_5} holds the probability estimates of the most difficult questions, 
#' \code{THETA_GK_1} holds actual outcomes for the easiest questions, and so on.
#' The elements of each list correspond to the same question. For instance, the \eqn{j}th elements
#' of \code{THETA_GK_1}, \code{E_GK_1}, \code{P_GK_1}, and \code{ID_GK_1} give
#' the true outcome, vector of probability estimates, vector of predictions of other judges' average probability estimates, 
#' and vector of identification numbers of the \eqn{j}th question with difficulty level 1.
#'  
#' @source Marcellin Martinie, Tom Wilkening, and Piers D. L. Howe. 
#' "Using meta-predictions to identify experts in the crowd when past performance is unknown"
#' \url{https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0232058}
#' @name General_Knowledge_Statements
NULL
#> NULL

#' @format 
#' \describe{
#' \item{\code{E_GK_1}}{holds judges' estimates of the outcome. Specifically, it holds a list of 100 elements, 
#' one per general knowledge statement with difficulty level 1. 
#' The \eqn{j}th element is a vector of the judges' estimates of the probability that the \eqn{j}th statement is true.}
#' }
#' @rdname General_Knowledge_Statements
"E_GK_1"


#' @format 
#' \describe{
#' \item{\code{E_GK_2}}{holds judges' estimates of the outcome. Specifically, it holds a list of 100 elements, 
#' one per general knowledge statement with difficulty level 2. 
#' The \eqn{j}th element is a vector of the judges' estimates of the probability that the \eqn{j}th statement is true.}
#' }
#' @rdname General_Knowledge_Statements
"E_GK_2"

#' @format 
#' \describe{
#' \item{\code{E_GK_3}}{holds judges' estimates of the outcome. Specifically, it holds a list of 100 elements, 
#' one per general knowledge statement with difficulty level 3. 
#' The \eqn{j}th element is a vector of the judges' estimates of the probability that the \eqn{j}th statement is true.}
#' }
#' @rdname General_Knowledge_Statements
"E_GK_3"


#' @format 
#' \describe{
#' \item{\code{E_GK_4}}{holds judges' estimates of the outcome. Specifically, it holds a list of 100 elements, 
#' one per general knowledge statement with difficulty level 4. 
#' The \eqn{j}th element is a vector of the judges' estimates of the probability that the \eqn{j}th statement is true.}  
#' }
#' @rdname General_Knowledge_Statements
"E_GK_4"

#' @format 
#' \describe{
#' \item{\code{E_GK_5}}{holds judges' estimates of the outcome. Specifically, it holds a list of 100 elements, 
#' one per general knowledge statement with difficulty level 5. 
#' The \eqn{j}th element is a vector of the judges' estimates of the probability that the \eqn{j}th statement is true.}  
#' }
#' @rdname General_Knowledge_Statements
"E_GK_5"


#' @format 
#' \describe{
#' \item{\code{P_GK_1}}{holds judges' predictions of other judges' average estimate of the outcome. 
#' Specifically, it holds a list of 100 elements, one per general knowledge statement with difficulty level 1. 
#' The \eqn{j}th element is a vector of the judges' predictions of others' average estimate of the probability 
#' that the \eqn{j}th statement is true.}  
#' }
#' @rdname General_Knowledge_Statements
"P_GK_1"

#' @format 
#' \describe{
#' \item{\code{P_GK_2}}{holds judges' predictions of other judges' average estimate of the outcome. 
#' Specifically, it holds a list of 100 elements, one per general knowledge statement with difficulty level 2. 
#' The \eqn{j}th element is a vector of the judges' predictions of others' average estimate of the probability 
#' that the \eqn{j}th statement is true.}
#' }
#' @rdname General_Knowledge_Statements
"P_GK_2"

#' @format 
#' \describe{
#' \item{\code{P_GK_3}}{holds judges' predictions of other judges' average estimate of the outcome. 
#' Specifically, it holds a list of 100 elements, one per general knowledge statement with difficulty level 3. 
#' The \eqn{j}th element is a vector of the judges' predictions of others' average estimate of the probability 
#' that the \eqn{j}th statement is true.}  
#' }
#' @rdname General_Knowledge_Statements
"P_GK_3"

#' @format 
#' \describe{
#' \item{\code{P_GK_4}}{holds judges' predictions of other judges' average estimate of the outcome. 
#' Specifically, it holds a list of 100 elements, one per general knowledge statement with difficulty level 4. 
#' The \eqn{j}th element is a vector of the judges' predictions of others' average estimate of the probability 
#' that the \eqn{j}th statement is true.}  
#' }
#' @rdname General_Knowledge_Statements
"P_GK_4"

#' @format 
#' \describe{
#' \item{\code{P_GK_5}}{holds judges' predictions of other judges' average estimate of the outcome. 
#' Specifically, it holds a list of 100 elements, one per general knowledge statement with difficulty level 5. 
#' The \eqn{j}th element is a vector of the judges' predictions of others' average estimate of the probability 
#' that the \eqn{j}th statement is true.}  
#' }
#' @rdname General_Knowledge_Statements
"P_GK_5"

#' @format 
#' \describe{
#' \item{\code{THETA_GK_1}}{is a vector of 100 elements, one per general knowledge statement with difficulty level 1. 
#' The \eqn{j}th element shows whether the \eqn{j}th general statement is true (1) or false (0).} 
#' }
#' @rdname General_Knowledge_Statements
"THETA_GK_1"

#' @format 
#' \describe{
#' \item{\code{THETA_GK_2}}{is a vector of 100 elements, one per general knowledge statement with difficulty level 2. 
#' The \eqn{j}th element shows whether the \eqn{j}th general statement is true (1) or false (0).}
#' }
#' @rdname General_Knowledge_Statements
"THETA_GK_2"

#' @format 
#' \describe{
#' \item{\code{THETA_GK_3}}{is a vector of 100 elements, one per general knowledge statement with difficulty level 3. 
#' The \eqn{j}th element shows whether the \eqn{j}th general statement is true (1) or false (0).}
#' }
#' @rdname General_Knowledge_Statements
"THETA_GK_3"

#' @format 
#' \describe{
#' \item{\code{THETA_GK_4}}{is a vector of 100 elements, one per general knowledge statement with difficulty level 4. 
#' The \eqn{j}th element shows whether the \eqn{j}th general statement is true (1) or false (0).}
#' }
#' @rdname General_Knowledge_Statements
"THETA_GK_4"

#' @format 
#' \describe{
#' \item{\code{THETA_GK_5}}{is a vector of 100 elements, one per general knowledge statement with difficulty level 5. 
#' The \eqn{j}th element shows whether the \eqn{j}th general statement is true (1) or false (0).} 
#' }
#' @rdname General_Knowledge_Statements
"THETA_GK_5"

#' @format 
#' \describe{
#' \item{\code{ID_GK_1}}{holds judges' identification numbers. 
#' Specifically, it holds a list of 100 elements, one per general knowledge statement with difficulty level 1. 
#' The \eqn{j}th element is a vector of numbers identifying the judges who provides responses for the \eqn{j}th statement.
#' These values make it possible to track a judge across questions.}
#' }
#' @rdname General_Knowledge_Statements
"ID_GK_1"

#' @format 
#' \describe{
#' \item{\code{ID_GK_2}}{holds judges' identification numbers. 
#' Specifically, it holds a list of 100 elements, one per general knowledge statement with difficulty level 2. 
#' The \eqn{j}th element is a vector of numbers identifying the judges who provides responses for the \eqn{j}th statement.
#' These values make it possible to track a judge across questions.}
#' }
#' @rdname General_Knowledge_Statements
"ID_GK_2"

#' @format 
#' \describe{
#' \item{\code{ID_GK_3}}{holds judges' identification numbers. 
#' Specifically, it holds a list of 100 elements, one per general knowledge statement with difficulty level 3. 
#' The \eqn{j}th element is a vector of numbers identifying the judges who provides responses for the \eqn{j}th statement.
#' These values make it possible to track a judge across questions.}
#' }
#' @rdname General_Knowledge_Statements
"ID_GK_3"

#' @format 
#' \describe{
#' \item{\code{ID_GK_4}}{holds judges' identification numbers. 
#' Specifically, it holds a list of 100 elements, one per general knowledge statement with difficulty level 4. 
#' The \eqn{j}th element is a vector of numbers identifying the judges who provides responses for the \eqn{j}th statement.
#' These values make it possible to track a judge across questions.}  
#' }
#' @rdname General_Knowledge_Statements
"ID_GK_4"


#' @format 
#' \describe{
#' \item{\code{ID_GK_5}}{holds judges' identification numbers. 
#' Specifically, it holds a list of 100 elements, one per general knowledge statement with difficulty level 5. 
#' The \eqn{j}th element is a vector of numbers identifying the judges who provides responses for the \eqn{j}th statement.
#' These values make it possible to track a judge across questions.}  
#' }
#' @rdname General_Knowledge_Statements
"ID_GK_5"



