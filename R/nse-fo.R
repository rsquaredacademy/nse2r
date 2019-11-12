#' F & O lot size
#'
#' Fetch futures and options lot size from NSE.
#'
#' @examples
#' \dontrun{
#' nse_fo_lotsizes()
#' }
#'
#' @export
#'
nse_fo_lotsizes <- function() {

  url <- "https://www.nseindia.com/content/fo/fo_mktlots.csv"
  utils::read.csv(url)
  
}

#' NSE top F & O gainers
#'
#' Top futures and options gainers for the last trading session.
#'
#' @examples
#' \dontrun{
#' nse_fo_top_gainers()
#' }
#'
#' @export
#'
nse_fo_top_gainers <- function() {

  url <-  "https://www.nseindia.com/live_market/dynaContent/live_analysis/gainers/fnoGainers1.json"
  nse_base(url)

}


#' NSE top F & O losers
#'
#' Top futures and options losers for the last trading session.
#'
#' @examples
#' \dontrun{
#' nse_fo_top_losers()
#' }
#'
#' @export
#'
nse_fo_top_losers <- function() {

  url <- "https://www.nseindia.com/live_market/dynaContent/live_analysis/losers/fnoLosers1.json"
  nse_base(url)

}
