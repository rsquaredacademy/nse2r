#' Most actively traded stocks
#'
#' Fetch most actively traded stocks in a month on NSE.
#'
#' @param clean_names Logical; if \code{TRUE}, makes the column names
#' descriptive and uses snake_case.
#'
#' @examples
#' \dontrun{
#' nse_stock_most_traded()
#'
#' # retain original column names as returned by NSE
#' nse_stock_most_traded(clean_names = FALSE)
#' }
#'
#' @return A tibble with the following columns:
#'
#' \item{security}{Name of the firm.}
#' \item{share_turnover}{Share in total turnover (percentage).}
#' \item{traded_quantity}{Total traded quantity (in lakhs)}
#' \item{no_of_trades}{Number of trades.}
#' \item{avg_daily_turnover}{Average daily turnover (in crores).}
#' \item{turnover}{Turnover (in crores.)}
#'
#' @export
#'
nse_stock_most_traded <- function(clean_names = TRUE) {

  url <- "https://www1.nseindia.com/products/dynaContent/equities/equities/json/mostActiveMonthly.json"

  url %>%
    nse_base() %>%
    nse_format_num(1, 2:6) %>%
    nse_format(1, 2:6) -> result

  if (clean_names) {
    names(result) <- c("security", "share_turnover", "traded_quantity",
                       "no_of_trades", "avg_daily_turnonver", "turnover")
  }

  result

}

#' 52 week high & low
#'
#' Fetch stocks that have touched their 52 week high and low.
#'
#' @param clean_names Logical; if \code{TRUE}, makes the column names
#' descriptive and uses snake_case.
#'
#' @examples
#' \dontrun{
#' # 52 week high
#' nse_stock_year_high()
#'
#' # retain original column names as returned by NSE
#' nse_stock_year_high(clean_names = FALSE)
#'
#' # 52 week low
#' nse_stock_year_low()
#'
#' # retain original column names as returned by NSE
#' nse_stock_year_low(clean_names = FALSE)
#' }
#'
#' @return A tibble with the following column names:
#'
#' \item{symbol}{NSE ticker.}
#' \item{symbol_desc}{Name of the firm.}
#' \item{date}{Previous high date.}
#' \item{new_high}{New 52 week high price.}
#' \item{new_low}{New 52 week low price.}
#' \item{year}{Year.}
#' \item{last_traded_price}{Last traded price.}
#' \item{prev_high}{Previous high price.}
#' \item{prev_low}{Previous low price.}
#' \item{prev_close}{Previous close price.}
#' \item{change}{Change in price.}
#' \item{percent_change}{Percentage change in price.}
#'
#' @name nse_stock_high_low
#'
NULL

#' @rdname nse_stock_high_low
#' @export
#'
nse_stock_year_high <- function(clean_names = TRUE) {

  url   <- "https://www1.nseindia.com/products/dynaContent/equities/equities/json/online52NewHigh.json"
  result <- nse_stock_year_base(url)

  if (clean_names) {
    names(result) <- c("symbol", "symbol_desc", "date", "new_high", "year",
                       "last_traded_price", "prev_high", "prev_close", "change",
                       "percent_change")
  }

  result

}

#' @rdname nse_stock_high_low
#' @export
#'
nse_stock_year_low <- function(clean_names = TRUE) {

  url    <- "https://www1.nseindia.com/products/dynaContent/equities/equities/json/online52NewLow.json"
  result <- nse_stock_year_base(url)

  if (clean_names) {
    names(result) <- c("symbol", "symbol_desc", "date", "new_low", "year",
                "last_traded_price", "prev_low", "prev_close", "change",
                "percent_change")
  }

  result

}


#' Stock code
#'
#' Fetch stock symbol and name from NSE.
#'
#' @param clean_names Logical; if \code{TRUE}, makes the column names
#' descriptive and uses snake_case.
#'
#' @examples
#' \dontrun{
#' nse_stock_code()
#'
#' # retain original column names as returned by NSE
#' nse_stock_code(clean_names = FALSE)
#' }
#'
#' @return A tibble with the following columns:
#'
#' \item{symbol}{NSE ticker.}
#' \item{company}{Name of the firm.}
#'
#' @export
#'
nse_stock_code <- function(clean_names = TRUE) {

  url <- "https://www1.nseindia.com/content/equities/EQUITY_L.csv"

  url %>%
    utils::read.csv() %>%
    magrittr::extract(., 1:2) %>%
    lapply(as.character) %>%
    as.data.frame() -> result

  if (clean_names) {
    names(result) <- c("symbol", "company")
  }

  result

}

#' Validate stock symbol
#'
#' Check if stock symbol/ticker is valid.
#'
#' @param stock_code Symbol of the stock.
#'
#' @examples
#' \dontrun{
#' nse_stock_valid("infy")
#' nse_stock_valid("glo")
#' }
#'
#' @export
#'
nse_stock_valid <- function(stock_code) {

  valid_stock <- nse_stock_code()[[1]]
  toupper(stock_code) %in% valid_stock

}

#' NSE top gainers & losers
#'
#' Fetch top gainers and losers for the last trading session.
#'
#' @param clean_names Logical; if \code{TRUE}, makes the column names
#' descriptive and uses snake_case.
#'
#' @examples
#' \dontrun{
#' # top gainers
#' nse_stock_top_gainers()
#'
#' # retain original column names as returned by NSE
#' nse_stock_top_gainers(clean_names = FALSE)
#'
#' # top losers
#' nse_stock_top_losers()
#'
#' # retain original column names as returned by NSE
#' nse_stock_top_losers(clean_names = FALSE)
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
#' @name nse_stock_top_base
#'
NULL

#' @rdname nse_stock_top_base
#' @export
#'
nse_stock_top_gainers <- function(clean_names = TRUE) {

  url <- "https://www1.nseindia.com/live_market/dynaContent/live_analysis/gainers/niftyGainers1.json"
  nse_fo_base(url, clean_names)

}

#' @rdname nse_stock_top_base
#' @export
#'
nse_stock_top_losers <- function(clean_names = TRUE) {

  url <- "https://www1.nseindia.com/live_market/dynaContent/live_analysis/losers/niftyLosers1.json"
  nse_fo_base(url, clean_names)

}


#' Stock quote
#'
#' Fetch the quote for a given stock code from Yahoo Finance API or Rediff Money.
#'
#' @param stock_code Symbol of the stock.
#'
#' @examples
#' \dontrun{
#' nse_stock_quote("infy")
#' }
#' 
#' @importFrom yahoofinancer Ticker
#'
#' @export
#'
nse_stock_quote <- function(stock_code) {

  if (nse_stock_valid(stock_code)) {

    stock  <- paste0(toupper(stock_code), '.NS')
    ticker <- Ticker$new(stock)
    ticker$quote$regularMarketPrice

  } else {

    stop("Please check the stock code. \n       Use nse_stock_code() to fetch stock symbol from NSE \n       and nse_stock_valid() to check if stock code is valid. ", call. = FALSE)

  }

}
