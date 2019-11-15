#' Pre open nifty
#'
#' Fetch data of pre open session of Nifty from NSE.
#'
#' @examples
#' nse_preopen_nifty()
#'
#' @export
#'
nse_preopen_nifty <- function() {

  url <- "https://www.nseindia.com/live_market/dynaContent/live_analysis/pre_open/nifty.json"
  
  result <-
  	url %>%
    nse_base() %>%
    nse_format_num(cols_skip = 1:4, cols_modify = 5:17) %>%
    nse_format(cols_skip = 1:4, cols_modify = 5:17)

  result$xDt <- as.Date(result$xDt, format = "%d-%b-%Y")
  result$caAct[result$caAct == "-"] <- NA
  result$caAct <- trimws(result$caAct)
  return(result)

}

#' Pre open nifty bank
#'
#' Fetch data of pre open session of Nifty Bank from NSE.
#'
#' @examples
#' nse_preopen_nifty_bank()
#'
#' @export
#'
nse_preopen_nifty_bank <- function() {

  url <- "https://www.nseindia.com/live_market/dynaContent/live_analysis/pre_open/niftybank.json"
  
  result <-
  	url %>%
    nse_base() %>%
    nse_format_num(cols_skip = 1:4, cols_modify = 5:17) %>%
    nse_format(cols_skip = 1:4, cols_modify = 5:17)

  result$xDt <- as.Date(result$xDt, format = "%d-%b-%Y")
  result$caAct[result$caAct == "-"] <- NA
  result$caAct <- trimws(result$caAct)
  return(result)

}

#' Pre open F & O
#'
#' Fetch data of pre open session of futures and options from NSE.
#'
#' @examples
#' nse_preopen_fo()
#'
#' @export
#'
nse_preopen_fo <- function() {

  url <- "https://www.nseindia.com/live_market/dynaContent/live_analysis/pre_open/fo.json"
  
  result <-
  	url %>%
    nse_base() %>%
    nse_format_num(cols_skip = 1:4, cols_modify = 5:17) %>%
    nse_format(cols_skip = 1:4, cols_modify = 5:17)

  result$xDt   <- as.Date(result$xDt, format = "%d-%b-%Y")
  result$caAct[result$caAct == "-"] <- NA
  result$caAct <- trimws(result$caAct)
  
  return(result)

}
