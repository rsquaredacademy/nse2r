#' Pre Open market data
#'
#' Fetch data of pre open session of Nifty & Nifty Bank.
#'
#' @param clean_names Logical; if \code{TRUE}, makes the column names
#' descriptive and uses snake_case.
#'
#' @examples
#' \dontrun{
#' # nifty
#' nse_preopen_nifty()
#'
#' # retain original column names as returned by NSE
#' nse_preopen_nifty(clean_names = FALSE)
#'
#' # nifty bank
#' nse_preopen_nifty_bank()
#'
#' # retain original column names as returned by NSE
#' nse_preopen_nifty_bank(clean_names = FALSE)
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
nse_preopen_nifty <- function(clean_names = TRUE) {

  url <- "https://www1.nseindia.com/live_market/dynaContent/live_analysis/pre_open/nifty.json"
  nse_preopen_base(url, clean_names)

}

#' @rdname preopen_nifty
#' @export
#'
nse_preopen_nifty_bank <- function(clean_names = TRUE) {

  url <- "https://www1.nseindia.com/live_market/dynaContent/live_analysis/pre_open/niftybank.json"
  nse_preopen_base(url, clean_names)

}

