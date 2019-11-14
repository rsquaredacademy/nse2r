#' F & O lot size
#'
#' Fetch futures and options lot size from NSE.
#'
#' @examples
#' \dontrun{
#' nse_fo_lotsizes()
#' }
#'
#' @export
#'
nse_fo_lotsizes <- function() {

  url <- "https://www.nseindia.com/content/fo/fo_mktlots.csv"

  result <-
    url %>%
		utils::read.csv() %>%
		tibble::as_tibble()

  split_line <-
    result %>%
    magrittr::use_series(SYMBOL) %>%
    as.character() %>%
    trimws() %>%
    magrittr::equals("Symbol") %>%
    which()

  index_line <- split_line - 1
  stock_line <- split_line + 1

  indices <-
    result %>%
    magrittr::extract(1:index_line, ) %>%
    nse_format(cols_skip = 1, cols_modify = 2:4) %>%
    purrr::map_df(trimws)

  stocks <-
    result %>%
    magrittr::extract(stock_line:nrow(result), ) %>%
    nse_format(cols_skip = 1, cols_modify = 2:4) %>%
    purrr::map_df(trimws)

  list(indices = indices,
       stocks  = stocks)

}

#' NSE top F & O gainers
#'
#' Top futures and options gainers for the last trading session.
#'
#' @examples
#' \dontrun{
#' nse_fo_top_gainers()
#' }
#'
#' @export
#'
nse_fo_top_gainers <- function() {

  url <-  "https://www.nseindia.com/live_market/dynaContent/live_analysis/gainers/fnoGainers1.json"

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


#' NSE top F & O losers
#'
#' Top futures and options losers for the last trading session.
#'
#' @examples
#' \dontrun{
#' nse_fo_top_losers()
#' }
#'
#' @export
#'
nse_fo_top_losers <- function() {

  url <- "https://www.nseindia.com/live_market/dynaContent/live_analysis/losers/fnoLosers1.json"

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
