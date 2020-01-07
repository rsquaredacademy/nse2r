#' Index quote
#'
#' Fetch the quote for a given index.
#'
#' @param clean_names Logical; if \code{TRUE}, makes the column names
#' descriptive and uses snake_case.
#'
#' @examples
#' \donttest{
#' nse_index_quote()
#'
#' # retain original column names as returned by NSE
#' nse_index_quote(clean_names = FALSE)
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
nse_index_quote <- function(clean_names = TRUE) {

  url <- "https://www1.nseindia.com/homepage/Indices1.json"

  url %>%
    nse_base() %>%
    magrittr::extract(-5) %>%
    nse_format_num(1, 2:4) %>%
    nse_format(1, 2:4) -> result

  if (clean_names) {
    names(result) <-  c("index_name", "last_traded_price", "change",
                               "percent_change")
  }

  result

}

#' Index list
#'
#' List NSE indices.
#'
#' @param clean_names Logical; if \code{TRUE}, makes the column names
#' descriptive and uses snake_case.
#'
#' @examples
#' \donttest{
#' nse_index_list()
#'
#' # retain original column names as returned by NSE
#' nse_index_list(clean_names = FALSE)
#' }
#'
#' @return A tibble with the following column:
#'
#' \item{index_name}{Name of the index.}
#'
#' @export
#'
nse_index_list <- function(clean_names = TRUE) {

  url    <- "https://www1.nseindia.com/homepage/Indices1.json"
  result <- nse_base(url)[1]

  if (clean_names) {
    names(result) <-  c("index_name")
  }

  result

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

  valid_index <- nse_index_list()[[1]]
  toupper(index_code) %in% valid_index

}
