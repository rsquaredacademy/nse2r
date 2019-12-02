#' Pre open Nifty data
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
#' \code{symbol}{NSE ticker.}
#' \code{series}{Equity (EQ)}
#' \code{corp_action_date}{Corporate action date.}
#' \code{corp_action}{Corporate Action}
#' \code{price}{Price}
#' \code{change}{Change in price}
#' \code{percent_change}{Percentage change in price.}
#' \code{prev_close}{Previous close.}
#' \code{quantity}{Quantity}
#' \code{value}{Value (in lakhs),}
#' \code{mkt_cap}{Free float market capitalization (in crores).}
#' \code{year_high}{Normal market 52 week high.}
#' \code{year_low}{Normal market 52 week low.}
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

