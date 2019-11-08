#' Index quote
#'
#' NSE indices quote
#'
#' @export
#'
nse_index_quote <- function() {

  url <- "http://www.nseindia.com/homepage/Indices1.json"

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
      magrittr::use_series(data) %>%
      magrittr::extract(-5)
  }

}

#' Index list
#'
#' NSE indices list.
#'
#' @export
#'
nse_index_list <- function() {

  url <- "http://www.nseindia.com/homepage/Indices1.json"

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
      magrittr::use_series(data) %>%
      magrittr::extract(1)
  }

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
    extract2(1)

  toupper(index_code) %in% valid_index

}
