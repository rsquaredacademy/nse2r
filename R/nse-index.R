#' Index quote
#'
#' Fetch the quote for a given index.
#'
#' @examples
#' \donttest{
#' nse_index_quote()
#' }
#'
#' @return A tibble with the following columns:
#'
#' \item{index_name}{Name of the NSE indices.}
#' \item{last_traded_price}{Last traded price.}
#' \item{change}{Change in price.}
#' \item{percent_change}{Percentage change in price.}
#'
#' @export
#'
nse_index_quote <- function() {

  url <- "http://www.nseindia.com/homepage/Indices1.json"

  url %>%
    nse_base() %>%
    magrittr::extract(-5) %>%
    nse_format_num(cols_skip = 1, cols_modify = 2:4) %>%
    nse_format(cols_skip = 1, cols_modify = 2:4) %>%
    magrittr::set_names(., c("index_name", "last_traded_price", "change",
                        "percent_change"))

}

#' Index list
#'
#' List NSE indices.
#'
#' @examples
#' \donttest{
#' nse_index_list()
#' }
#'
#' @return A tibble with the following column:
#'
#' \item{index_name}{Name of the index.}
#'
#' @export
#'
nse_index_list <- function() {

  url <- "http://www.nseindia.com/homepage/Indices1.json"

  url %>%
    nse_base() %>%
    magrittr::extract(1) %>%
    magrittr::set_names(., c("index_name"))

}

#' Validate index symbol.
#'
#' Check if index symbol is valid.
#'
#' @param index_code Symbol of the index.
#'
#' @examples
#' \donttest{
#' nse_index_valid("nifty auto")
#' nse_index_valid("nifty cps")
#' }
#'
#' @export
#'
nse_index_valid <- function(index_code) {

  valid_index <-
    nse_index_list() %>%
    magrittr::extract2(1)

  toupper(index_code) %in% valid_index

}
