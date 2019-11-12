#' Most actively traded stocks
#'
#' Most actively traded stocks in a month on NSE.
#'
#' @examples
#' \dontrun{
#' nse_stock_most_traded()
#' }
#'
#' @export
#'
nse_stock_most_traded <- function() {

  url <- "https://www.nseindia.com/products/dynaContent/equities/equities/json/mostActiveMonthly.json"
  nse_base(url)

}

#' 52 week high
#'
#' Stocks that have touched their 52 week highs during the day on NSE.
#'
#' @examples
#' \dontrun{
#' nse_stock_year_high()
#' }
#'
#' @export
#'
nse_stock_year_high <- function() {

  url <- "https://www.nseindia.com/products/dynaContent/equities/equities/json/online52NewHigh.json"
  nse_base(url)

}

#' 52 week low
#'
#' Stocks that have touched their 52 week lows during the day on NSE.
#'
#' @examples
#' \dontrun{
#' nse_stock_year_low()
#' }
#'
#' @export
#'
nse_stock_year_low <- function() {

  url <- "https://www.nseindia.com/products/dynaContent/equities/equities/json/online52NewLow.json"
  nse_base(url)

}


#' Stock code
#'
#' Fetch stock symbol and name from NSE.
#'
#' @examples
#' \dontrun{
#' nse_stock_code()
#' }
#'
#' @export
#'
nse_stock_code <- function() {

  url <- "http://www.nseindia.com/content/equities/EQUITY_L.csv"
  utils::read.csv(url)[, 1:2]

}

#' Valid stock code
#'
#' Check if stock code is valid.
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

  valid_stock <-
    nse_stock_code() %>%
    magrittr::extract2(1)

  toupper(stock_code) %in% valid_stock

}

#' NSE top gainers
#'
#' Top gainers for the last trading session.
#'
#' @examples
#' \dontrun{
#' nse_stock_top_gainers()
#' }
#'
#' @export
#'
nse_stock_top_gainers <- function() {

  url <- "http://www.nseindia.com/live_market/dynaContent/live_analysis/gainers/niftyGainers1.json"
  nse_base(url)

}

#' NSE top losers
#'
#' Top losers for the last trading session.
#'
#' @examples
#' \dontrun{
#' nse_stock_top_losers()
#' }
#'
#' @export
#'
nse_stock_top_losers <- function() {

  url <- "http://www.nseindia.com/live_market/dynaContent/live_analysis/losers/niftyLosers1.json"
  nse_base(url)

}


#' Stock quote
#'
#' Gets the quote for a given stock code.
#'
#' @param stock_code Symbol of the stock.
#'
#' @examples
#' \dontrun{
#' nse_stock_quote("infy")
#' }
#'
#' @export
#'
nse_stock_quote <- function(stock_code) {

  base_url <- "https://www.nseindia.com/live_market/dynaContent/live_watch/get_quote/GetQuote.jsp"

  if (nse_stock_valid(stock_code)) {

    base_url %>%
      httr::modify_url(query = "symbol=") %>%
      paste0(toupper(stock_code)) %>%
      xml2::read_html() %>%
      rvest::html_nodes("#responseDiv") %>%
      rvest::html_text() %>%
      jsonlite::fromJSON() %>%
      magrittr::use_series(data) %>%
      as.list()

  } else {

    stop("Please check the stock code. \n       Use nse_stock_code() to fetch stock symbol from NSE \n       and nse_stock_valid() to check if stock code is valid. ", call. = FALSE)

  }

}
