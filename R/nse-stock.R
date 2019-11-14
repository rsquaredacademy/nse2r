#' Most actively traded stocks
#'
#' Fetch most actively traded stocks in a month on NSE.
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
  
  url %>%
    nse_base() %>%
    nse_format_num(cols_skip = 1, cols_modify = 2:6) %>%
    nse_format(cols_skip = 1, cols_modify = 2:6)

}

#' 52 week high
#'
#' Fetch stocks that have touched their 52 week highs during the day on NSE.
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
  
  cols_to_skip   <- c(1, 2, 7)
  cols_to_modify <- c(3:6, 8:10)

  result <-
    url %>%
    nse_base() %>%
    nse_format_num(cols_skip = cols_to_skip, cols_modify = cols_to_modify) %>%
    nse_format(cols_skip = 1:3, cols_modify = 4:10)

  result$dt <- as.Date(result$dt, format = "%d-%b-%Y")
  return(result)

}

#' 52 week low
#'
#' Fetch stocks that have touched their 52 week lows during the day on NSE.
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
  
  cols_to_skip   <- c(1, 2, 7)
  cols_to_modify <- c(3:6, 8:10)

  result <-
    url %>%
    nse_base() %>%
    nse_format_num(cols_skip = cols_to_skip, cols_modify = cols_to_modify) %>%
    nse_format(cols_skip = 1:3, cols_modify = 4:10)

  result$dt <- as.Date(result$dt, format = "%d-%b-%Y")
  return(result)

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

  url %>%
    utils::read.csv() %>%
    magrittr::extract(, 1:2) %>% 
    tibble::as_tibble() %>%
    purrr::map_dfc(as.character)

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
#' Fetch top gainers for the last trading session.
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
  
  cols_to_skip   <- c(1, 2, 11, 12)
  cols_to_modify <- 3:10

  result <-
    url %>%
    nse_base() %>%
    nse_format_num(cols_skip = cols_to_skip, cols_modify = cols_to_modify) %>%
    nse_format(cols_skip = 1:4, cols_modify = 5:12)

  result$lastCorpAnnouncementDate <- as.Date(result$lastCorpAnnouncementDate, format = "%d-%b-%Y")
  return(result)

}

#' NSE top losers
#'
#' Fetch top losers for the last trading session.
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
  
  cols_to_skip   <- c(1, 2, 11, 12)
  cols_to_modify <- 3:10

  result <-
    url %>%
    nse_base() %>%
    nse_format_num(cols_skip = cols_to_skip, cols_modify = cols_to_modify) %>%
    nse_format(cols_skip = 1:4, cols_modify = 5:12)

  result$lastCorpAnnouncementDate <- as.Date(result$lastCorpAnnouncementDate, format = "%d-%b-%Y")
  return(result)

}


#' Stock quote
#'
#' Fetch the quote for a given stock code.
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
