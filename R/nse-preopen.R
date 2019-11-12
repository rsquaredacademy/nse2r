#' Pre open nifty
#'
#' Fetch data of pre open session of Nifty from NSE.
#'
#' @examples
#' \dontrun{
#' nse_preopen_nifty()
#' }
#'
#' @export
#'
nse_preopen_nifty <- function() {

  url <- "https://www.nseindia.com/live_market/dynaContent/live_analysis/pre_open/nifty.json"
  nse_base(url)

}

#' Pre open nifty bank
#'
#' Fetch data of pre open session of Nifty Bank from NSE.
#'
#' @examples
#' \dontrun{
#' nse_preopen_nifty_bank()
#' }
#'
#' @export
#'
nse_preopen_nifty_bank <- function() {

  url <- "https://www.nseindia.com/live_market/dynaContent/live_analysis/pre_open/niftybank.json"
  nse_base(url)

}

#' Pre open F & O
#'
#' Fetch data of pre open session of futures and options from NSE.
#'
#' @examples
#' \dontrun{
#' nse_preopen_fo()
#' }
#'
#' @export
#'
nse_preopen_fo <- function() {

  url <- "https://www.nseindia.com/live_market/dynaContent/live_analysis/pre_open/fo.json"
  nse_base(url)

}
