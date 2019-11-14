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

  indices <- x[1:index_line,]
  stocks  <- x[stock_line:nrow(x), ]

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
  nse_base(url)

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
  nse_base(url)

}
