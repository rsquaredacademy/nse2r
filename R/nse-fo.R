#' Top F&O gainers and losers
#'
#' Top futures and options gainers and losers for the last trading session.
#'
#' @param clean_names Logical; if \code{TRUE}, makes the column names
#' descriptive and uses snake_case.
#'
#' @examples
#' \dontrun{
#' # top gainers
#' nse_fo_top_gainers()
#'
#' # retain original column names as returned by NSE
#' nse_fo_top_gainers(clean_names = FALSE)
#'
#' # top losers
#' nse_fo_top_losers()
#'
#' # retain original column names as returned by NSE
#' nse_fo_top_losers(clean_names = FALSE)
#' }
#'
#' @return A tibble with the following columns:
#'
#' \item{symbol}{NSE ticker.}
#' \item{series}{Equity (EQ).}
#' \item{last_corp_announcement_date}{Last corporate announcement date.}
#' \item{last_corp_announcement}{Last corporate announcement.}
#' \item{open_price}{Open price.}
#' \item{high_price}{High price.}
#' \item{low_price}{Low price.}
#' \item{last_traded_price}{Last traded price.}
#' \item{prev_close_price}{Previous close price.}
#' \item{percent_change}{Percentage change in price.}
#' \item{traded_quantity}{Total traded quantity.}
#' \item{turnover}{Turnover in lakhs.}
#'
#' @name nse_fo
#'
NULL

#' @rdname nse_fo
#' @export
#'
nse_fo_top_gainers <- function(clean_names = TRUE) {

  url <-  "https://www1.nseindia.com/live_market/dynaContent/live_analysis/gainers/fnoGainers1.json"
  nse_fo_base(url, clean_names)

}


#' @rdname nse_fo
#' @export
#'
nse_fo_top_losers <- function(clean_names = TRUE) {

  url <- "https://www1.nseindia.com/live_market/dynaContent/live_analysis/losers/fnoLosers1.json"
  nse_fo_base(url, clean_names)

}

