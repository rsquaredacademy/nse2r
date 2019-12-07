#' Advances & Declines
#'
#' NSE indices advances & declines.
#'
#' @examples
#' \donttest{
#' nse_advances_declines()
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
nse_advances_declines <- function() {

  url <- "http://www.nseindia.com/common/json/indicesAdvanceDeclines.json"

  url %>%
    nse_base() %>%
    nse_format(cols_skip = 1, cols_modify = 2:4) %>%
    magrittr::set_names(., c("index_name", "advances", "declines", "unchanged"))

}
