#' Advance declines
#'
#' NSE indices advances & declines.
#'
#' @examples
#' \dontrun{
#' nse_fo_lotsizes()
#' }
#'
#' @export
#'
nse_advances_declines <- function() {

  url <- "http://www.nseindia.com/common/json/indicesAdvanceDeclines.json"

  url %>%
    nse_base() %>%
    nse_format(cols_skip = 1, cols_modify = 2:4)

}
