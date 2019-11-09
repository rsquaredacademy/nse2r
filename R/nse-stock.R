#' Most actively traded stocks
#'
#' Most actively traded stocks in a month on NSE.
#'
#' @export
#'
nse_stock_most_traded <- function() {

  url <- "https://www.nseindia.com/products/dynaContent/equities/equities/json/mostActiveMonthly.json"

  is_online <- pingr::is_online()

  if (is_online) {
    resp <- httr::GET(url)
  } else {
    stop("Please check your internet connection.", call. = FALSE)
  }

  if (httr::http_error(resp)) {
    stop(
      sprintf(
        "Request failed [%s]\n%s",
        httr::status_code(resp),
        result$error$message
      ),
      call. = FALSE
    )
  } else {
    resp %>%
      httr::content("text") %>%
      jsonlite::fromJSON() %>%
      magrittr::use_series(data)
  }

}

#' 52 week high
#'
#' Stocks that have touched their 52 week highs during the day on NSE.
#'
#' @export
#'
nse_stock_year_high <- function() {

  url <- "https://www.nseindia.com/products/dynaContent/equities/equities/json/online52NewHigh.json"

  is_online <- pingr::is_online()

  if (is_online) {
    resp <- httr::GET(url)
  } else {
    stop("Please check your internet connection.", call. = FALSE)
  }

  if (httr::http_error(resp)) {
    stop(
      sprintf(
        "Request failed [%s]\n%s",
        httr::status_code(resp),
        result$error$message
      ),
      call. = FALSE
    )
  } else {
    resp %>%
      httr::content("text") %>%
      jsonlite::fromJSON() %>%
      magrittr::use_series(data)
  }

}

#' 52 week low
#'
#' Stocks that have touched their 52 week lows during the day on NSE.
#'
#' @export
#'
nse_stock_year_low <- function() {

  url <- "https://www.nseindia.com/products/dynaContent/equities/equities/json/online52NewLow.json"

  is_online <- pingr::is_online()

  if (is_online) {
    resp <- httr::GET(url)
  } else {
    stop("Please check your internet connection.", call. = FALSE)
  }

  if (httr::http_error(resp)) {
    stop(
      sprintf(
        "Request failed [%s]\n%s",
        httr::status_code(resp),
        result$error$message
      ),
      call. = FALSE
    )
  } else {
    resp %>%
      httr::content("text") %>%
      jsonlite::fromJSON() %>%
      magrittr::use_series(data)
  }

}


#' Stock code
#'
#' Fetch stock symbol and name from NSE.
#'
#' @export
#'
nse_stock_code <- function() {

  url <- "http://www.nseindia.com/content/equities/EQUITY_L.csv"

  is_online <- pingr::is_online()

  if (is_online) {
    read.csv(url)[, 1:2]
  } else {
    stop("Please check your internet connection.", call. = FALSE)
  }

}

#' Valid stock code
#'
#' Check if stock code is valid.
#'
#' @export
#'
nse_stock_valid <- function(stock_code) {

  valid_stock <-
    nse_stock_code() %>%
    extract2(1)

  toupper(stock_code) %in% valid_stock

}

#' NSE top gainers
#'
#' Top gainers for the last trading session.
#'
#' @importFrom magrittr %>%
#'
#' @export
#'
nse_stock_top_gainers <- function() {

  url <- "http://www.nseindia.com/live_market/dynaContent/live_analysis/gainers/niftyGainers1.json"

  is_online <- pingr::is_online()

  if (is_online) {
    resp <- httr::GET(url)
  } else {
    stop("Please check your internet connection.", call. = FALSE)
  }

  if (httr::http_error(resp)) {
    stop(
      sprintf(
        "Request failed [%s]\n%s",
        httr::status_code(resp),
        result$error$message
      ),
      call. = FALSE
    )
  } else {
    resp %>%
      httr::content("text") %>%
      jsonlite::fromJSON() %>%
      magrittr::use_series(data)
  }

}

#' NSE top losers
#'
#' Top losers for the last trading session.
#'
#' @export
#'
nse_stock_top_losers <- function() {

  url <- "http://www.nseindia.com/live_market/dynaContent/live_analysis/losers/niftyLosers1.json"

  is_online <- pingr::is_online()

  if (is_online) {
    resp <- httr::GET(url)
  } else {
    stop("Please check your internet connection.", call. = FALSE)
  }

  if (httr::http_error(resp)) {
    stop(
      sprintf(
        "Request failed [%s]\n%s",
        httr::status_code(resp),
        result$error$message
      ),
      call. = FALSE
    )
  } else {
    resp %>%
      httr::content("text") %>%
      jsonlite::fromJSON() %>%
      magrittr::use_series(data)
  }

}