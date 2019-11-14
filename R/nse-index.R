#' Index quote
#'
#' NSE indices quote.
#'
#' @examples
#' \dontrun{
#' nse_index_quote()
#' }
#'
#' @export
#'
nse_index_quote <- function() {

  url <- "http://www.nseindia.com/homepage/Indices1.json"

  url %>%
    nse_base() %>%
    magrittr::extract(-5) %>%
    nse_format_num(cols_skip = 1, cols_modify = 2:4) %>%
    nse_format(cols_skip = 1, cols_modify = 2:4)
    
}

#' Index list
#'
#' List NSE indices.
#'
#' @examples
#' \dontrun{
#' nse_index_list()
#' }
#'
#' @export
#'
nse_index_list <- function() {

  url <- "http://www.nseindia.com/homepage/Indices1.json"

  url %>%
    nse_base() %>%
    magrittr::extract(1)

}

#' Valid index
#'
#' Check if index is valid.
#'
#' @param index_code Symbol of the index.
#'
#' @examples
#' \dontrun{
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
