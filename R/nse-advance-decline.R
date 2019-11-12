#' Advance declines
#'
#' NSE indices advance & decline.
#'
#' @export
#'
nse_advances_declines <- function() {

  url <- "http://www.nseindia.com/common/json/indicesAdvanceDeclines.json"
  nse_base(url)

}
