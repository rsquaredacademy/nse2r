#' NSE top gainers
#'
#' Top gainers for the last trading session.
#'
#' @importFrom magrittr %>%
#'
#' @export
#'
nse_top_gainers <- function() {

  url <- "http://www.nseindia.com/live_market/dynaContent/live_analysis/gainers/niftyGainers1.json"

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
      magrittr::use_series(data)
  }

}

#' NSE top F & O gainers
#'
#' Top futures and options gainers for the last trading session.
#'
#' @export
#'
nse_top_gainers_fo <- function() {

  url <-  "https://www.nseindia.com/live_market/dynaContent/live_analysis/gainers/fnoGainers1.json"

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
      magrittr::use_series(data)
  }

}
