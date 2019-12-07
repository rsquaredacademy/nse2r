#' Pre Open market data
#'
#' Fetch data of pre open session of Nifty & Nifty Bank.
#'
#' @examples
#' \donttest{
#' nse_preopen_nifty()
#' nse_preopen_nifty_bank()
#' }
#'
#' @return A tibble with the following columns:
#'
#' \item{symbol}{NSE ticker.}
#' \item{series}{Equity (EQ)}
#' \item{corp_action_date}{Corporate action date.}
#' \item{corp_action}{Corporate Action}
#' \item{price}{Price}
#' \item{change}{Change in price}
#' \item{percent_change}{Percentage change in price.}
#' \item{prev_close}{Previous close.}
#' \item{quantity}{Quantity}
#' \item{value}{Value (in lakhs),}
#' \item{mkt_cap}{Free float market capitalization (in crores).}
#' \item{year_high}{Normal market 52 week high.}
#' \item{year_low}{Normal market 52 week low.}
#'
#' @name preopen_nifty
#'
NULL

#' @rdname preopen_nifty
#' @export
#'
nse_preopen_nifty <- function() {

  url <- "https://www.nseindia.com/live_market/dynaContent/live_analysis/pre_open/nifty.json"
  nse_preopen_base(url)

}

#' @rdname preopen_nifty
#' @export
#'
nse_preopen_nifty_bank <- function() {

  url <- "https://www.nseindia.com/live_market/dynaContent/live_analysis/pre_open/niftybank.json"
  nse_preopen_base(url)

}

