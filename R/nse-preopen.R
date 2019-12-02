#' Pre open nifty
#'
#' Fetch data of pre open session of Nifty from NSE.
#'
#' @examples
#' \dontrun{
#' nse_preopen_nifty()
#' }
#'
#' @export
#'
nse_preopen_nifty <- function() {

  url <- "https://www.nseindia.com/live_market/dynaContent/live_analysis/pre_open/nifty.json"

  result <-
  	url %>%
    nse_base() %>%
    magrittr::extract(., 1:13) %>%
    nse_format_num(cols_skip = 1:4, cols_modify = 5:13) %>%
    nse_format(cols_skip = 1:4, cols_modify = 5:13)

  result$xDt <- as.Date(result$xDt, format = "%d-%b-%Y")
  result$caAct[result$caAct == "-"] <- NA
  result$caAct <- trimws(result$caAct)

  result %>%
    magrittr::set_names("symbol",
                        "series",
                        "corp_action_date",
                        "corp_action",
                        "price",
                        "change",
                        "percent_change",
                        "prev_close",
                        "quantity",
                        "value",
                        "mkt_cap",
                        "year_high",
                        "year_low")

}

#' Pre open nifty bank
#'
#' Fetch data of pre open session of Nifty Bank from NSE.
#'
#' @examples
#' \dontrun{
#' nse_preopen_nifty_bank()
#' }
#'
#' @export
#'
nse_preopen_nifty_bank <- function() {

  url <- "https://www.nseindia.com/live_market/dynaContent/live_analysis/pre_open/niftybank.json"

  result <-
  	url %>%
    nse_base() %>%
    magrittr::extract(., 1:13) %>%
    nse_format_num(cols_skip = 1:4, cols_modify = 5:13) %>%
    nse_format(cols_skip = 1:4, cols_modify = 5:13)

  result$xDt <- as.Date(result$xDt, format = "%d-%b-%Y")
  result$caAct[result$caAct == "-"] <- NA
  result$caAct <- trimws(result$caAct)

  result %>%
    magrittr::set_names("symbol",
                        "series",
                        "corp_action_date",
                        "corp_action",
                        "price",
                        "change",
                        "percent_change",
                        "prev_close",
                        "quantity",
                        "value",
                        "mkt_cap",
                        "year_high",
                        "year_low")

}

