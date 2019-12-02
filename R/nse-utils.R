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

nse_stock_year_base <- function(url) {

  cols_to_skip   <- c(1, 2, 7)
  cols_to_modify <- c(3:6, 8:10)

  result <-
    url %>%
    nse_base() %>%
    nse_format_num(cols_skip = cols_to_skip, cols_modify = cols_to_modify) %>%
    nse_format(cols_skip = 1:3, cols_modify = 4:10)

  result$dt <- as.Date(result$dt, format = "%d-%b-%Y")

  return(result)

}

nse_fo_base <- function(url) {

  cols_to_skip   <- c(1, 2, 11, 12)
  cols_to_modify <- 3:10

  result <-
    url %>%
    nse_base() %>%
    nse_format_num(cols_skip = cols_to_skip, cols_modify = cols_to_modify) %>%
    nse_format(cols_skip = 1:4, cols_modify = 5:12)

  result$lastCorpAnnouncementDate <- as.Date(result$lastCorpAnnouncementDate,
                                             format = "%d-%b-%Y")

  result %>%
    magrittr::set_names(., c("symbol", "series", "last_corp_announcement_date",
                             "last_corp_announcement", "open_price", "high_price",
                             "low_price", "last_traded_price",
                             "prev_close_price", "percent_change",
                             "traded_quantity", "turnover_in_lakhs"))

}

nse_preopen_base <- function(url) {

  result <-
    url %>%
    nse_base() %>%
    magrittr::extract(., 1:13) %>%
    nse_format_num(cols_skip = 1:4, cols_modify = 5:13) %>%
    nse_format(cols_skip = 1:4, cols_modify = 5:13)

  result$xDt <- as.Date(result$xDt, format = "%d-%b-%Y")
  result$caAct[result$caAct == "-"] <- NA
  result$caAct <- trimws(result$caAct)

  result %>%
    magrittr::set_names(., c("symbol", "series", "corp_action_date",
                             "corp_action", "price", "change", "percent_change",
                             "prev_close", "quantity", "value", "mkt_cap",
                             "year_high", "year_low"))

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
