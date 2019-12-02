#' NSE top F & O gainers
#'
#' Top futures and options gainers for the last trading session.
#'
#' @examples
#' \donttest{
#' nse_fo_top_gainers()
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

  result %>%
    magrittr::set_names(., c("symbol", "series", "last_corp_announcement_date",
                             "last_corp_announcement", "open_price", "high_price",
                             "low_price", "last_traded_price",
                             "previous_close_price", "percent_change",
                             "traded_quantity", "turnover_in_lakhs"))

}


#' NSE top F & O losers
#'
#' Top futures and options losers for the last trading session.
#'
#' @examples
#' \donttest{
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

  result %>%
    magrittr::set_names(., c("symbol", "series", "last_corp_announcement_date",
                        "last_corp_announcement", "open_price", "high_price",
                        "low_price", "last_traded_price",
                        "previous_close_price", "percent_change",
                        "traded_quantity", "turnover_in_lakhs"))

}
