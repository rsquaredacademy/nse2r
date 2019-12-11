#' Advances & Declines
#'
#' NSE indices advances & declines.
#'
#' @param clean_names Logical; if \code{TRUE}, makes the column names
#' descriptive and uses snake_case.
#'
#' @examples
#' \donttest{
#' nse_advances_declines()
#'
#' # retain original column names as returned by NSE
#' nse_advances_declines(clean_names = FALSE)
#' }
#'
#' @return A tibble with the following columns:
#'
#' \item{index_name}{Name of the index.}
#' \item{advances}{Number of stocks increased (in green).}
#' \item{declines}{Number of stocks decreased (in red).}
#' \item{unchanged}{Number of stocks unchanged.}
#'
#' @export
#'
nse_advances_declines <- function(clean_names = TRUE) {

  url  <- "http://www.nseindia.com/common/json/indicesAdvanceDeclines.json"
  data <- nse_format(nse_base(url), 1, 2:4)

  if (clean_names) {
    names(data) <- c("index_name", "advances", "declines", "unchanged")
  }

  data

}
