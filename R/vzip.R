#' Zip vectors together into a single vector.
#'
#' \code{vzip} returns a single vector from input vectors, in order of input and
#' index in each vector.
#'
#' @description Similar to python zip, `vzip` takes input vectors and merges
#' them together by their input order and index. A simple example is two numeric
#' vectors, A = c(1,1,1) and B = c(2,2,2). The output of vzip(A,B) would simply
#' be a single vector of c(1,2,1,2,1,2). Any number of vectors can be input, but
#' each input vector must be of the same length. Output vector class depends on
#' input vector consensus.
#'
#' @usage
#' vzip(...)
#'
#' @param ... any number of vectors to zip together. Each vector must be of
#' equal length.
#'
#' @examples
#' A <- c(1,0,1)
#' B <- c(6,7,4)
#' vzip(A, B)
#'
#' @author Christopher Nobles, Ph.D.
#' @export
#'

vzip <- function(...){
  v <- list(...)
  if(length(unique(sapply(v, length))) > 1){
    stop("All input vectors are not of equal length.")
  }
  as.vector(t(matrix(unlist(v), ncol = length(v))))
}
