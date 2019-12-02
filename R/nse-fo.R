#' NSE top F & O gainers and losers
#'
#' Top futures and options gainers and losers for the last trading session.
#'
#' @examples
#' \donttest{
#' nse_fo_top_gainers()
#' nse_fo_top_losers()
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
nse_fo_top_gainers <- function() {

  url <-  "https://www.nseindia.com/live_market/dynaContent/live_analysis/gainers/fnoGainers1.json"
  nse_fo_base(url)

}


#' @rdname nse_fo
#' @export
#'
nse_fo_top_losers <- function() {

  url <- "https://www.nseindia.com/live_market/dynaContent/live_analysis/losers/fnoLosers1.json"
  nse_fo_base(url)

}

