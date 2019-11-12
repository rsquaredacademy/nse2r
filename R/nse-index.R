#' Index quote
#'
#' NSE indices quote
#'
#' @export
#'
nse_index_quote <- function() {

  url <- "http://www.nseindia.com/homepage/Indices1.json"
  
  url %>%
    nse_base() %>%
    magrittr::extract(-5)

}

#' Index list
#'
#' NSE indices list.
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
#' @export
#'
nse_index_valid <- function(index_code) {

  valid_index <-
    nse_index_list() %>%
    magrittr::extract2(1)

  toupper(index_code) %in% valid_index

}
