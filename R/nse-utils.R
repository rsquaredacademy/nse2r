#' Process JSON
#'
#' Base function to process JSON data.
#'
#' @param url URL of data.
#'
#' @importFrom magrittr %>%
#'
#' @noRd
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
      magrittr::use_series(data) %>%
      tibble::as_tibble()
  }

}

#' Format columns
#'
#' Modify data types of columns.
#'
#' @param data An object of class \code{data.frame}.
#' @param cols_skip Columns to be skipped.
#' @param cols_modify Columns to be modified.
#'
#' @noRd
#'
nse_format <- function(data, cols_skip, cols_modify) {

  skipped  <- data[, cols_skip]
  modified <- purrr::map_dfc(data[,cols_modify], as.numeric)
  tibble::as_tibble(cbind(skipped, modified))

}

#' Remove comma from data
#'
#' Remove comma from data to facilitate conversion to number.
#'
#' @param data An object of class \code{data.frame}.
#' @param cols_skip Columns to be skipped.
#' @param cols_modify Columns to be modified.
#'
#' @noRd
#'
nse_format_num <- function(data, cols_skip, cols_modify) {

  skipped  <- data[, cols_skip]
  modified <- purrr::map_dfc(data[,cols_modify], stringr::str_remove_all, ",")
  tibble::as_tibble(cbind(skipped, modified))

}

#' @importFrom utils packageVersion menu install.packages
check_suggests <- function(pkg) {

  pkg_flag <- tryCatch(utils::packageVersion(pkg), error = function(e) NA)

  if (is.na(pkg_flag)) {

    msg <- message(paste0('\n', pkg, ' must be installed for this functionality.'))

    if (interactive()) {
      message(msg, "\nWould you like to install it?")
      if (utils::menu(c("Yes", "No")) == 1) {
        utils::install.packages(pkg)
      } else {
        stop(msg, call. = FALSE)
      }
    } else {
      stop(msg, call. = FALSE)
    }
  }

}
