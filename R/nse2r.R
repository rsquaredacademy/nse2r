#' \code{nse2r} package
#'
#' Tools for Collecting Real Time Data from National Stock Exchange (India)
#'
#' @docType package
#' @name nse2r
NULL

## quiets concerns of R CMD check re: the .'s that appear in pipelines
if (getRversion() >= "2.15.1") {
  utils::globalVariables(c(
    ".", "result", "data", "SYMBOL", "chart", "meta", "regularMarketPrice"
  ))
}
