#' Process JSON
#'
#' Base function to process JSON data.
#'
#' @importFrom magrittr %>%
#'
nse_base <- function(url) {

  resp <- httr::GET(url)

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
      httr::content("text", encoding = "UTF-8") %>%
      jsonlite::fromJSON() %>%
      magrittr::use_series(data)
  }

}
