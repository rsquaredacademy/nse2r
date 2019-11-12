#' Process JSON
#'
#' Base function to process JSON data.
#'
#' @importFrom magrittr %>%
#'
nse_base <- function(url) {

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
