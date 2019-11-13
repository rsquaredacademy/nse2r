#' Advance declines
#'
#' NSE indices advances & declines.
#'
#' @export
#'
nse_advances_declines <- function() {

  url <- "http://www.nseindia.com/common/json/indicesAdvanceDeclines.json"
  nse_base(url)

}
