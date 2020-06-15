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

  url %>%
    jsonlite::fromJSON() %>%
    magrittr::use_series(data) %>%
    as.data.frame()

}

nse_stock_year_base <- function(url) {

  cols_to_skip   <- c(1, 2, 7)
  cols_to_modify <- c(3:6, 8:10)

  url %>%
    nse_base() %>%
    nse_format_num(cols_to_skip, cols_to_modify) %>%
    nse_format(1:3, 4:10) -> result

  result$dt <- as.Date(result$dt, format = "%d-%b-%Y")

  result

}

nse_fo_base <- function(url, clean_names) {

  cols_to_skip   <- c(1, 2, 11, 12)
  cols_to_modify <- 3:10

  url %>%
    nse_base() %>%
    nse_format_num(cols_to_skip, cols_to_modify) %>%
    nse_format(1:4, 5:12) -> result

  result$lastCorpAnnouncementDate <- as.Date(result$lastCorpAnnouncementDate,
                                             format = "%d-%b-%Y")
  if (clean_names) {
    names(result) <- c("symbol", "series", "last_corp_announcement_date",
                               "last_corp_announcement", "open_price", "high_price",
                               "low_price", "last_traded_price",
                               "prev_close_price", "percent_change",
                               "traded_quantity", "turnover_in_lakhs")
  }

  result

}

nse_preopen_base <- function(url, clean_names) {

  url %>%
    nse_base() %>%
    nse_format_num(1:4, 5:17) %>%
    nse_format(cols_skip = 1:4, cols_modify = 5:17) -> result

  result$xDt <- as.Date(result$xDt, format = "%d-%b-%Y")
  result$caAct[result$caAct == "-"] <- NA
  result$caAct <- trimws(result$caAct)

  if (clean_names) {
    names(result) <- c("symbol", "series", "corp_action_date",
                               "corp_action", "price", "change",
                               "percent_change", "prev_close", "quantity",
                               "value", "mkt_cap", "year_high", "year_low",
                               "sum_val", "sum_quantity", "fin_quantity",
                               "sum_fin_quantity")
  }

  result

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
    modified <- as.data.frame(lapply(data[, cols_modify], as.numeric))
    # modified <- purrr::map_dfc(data[,cols_modify], as.numeric)
    as.data.frame(cbind(skipped, modified))

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
    modified <- as.data.frame(lapply(data[, cols_modify], function(x) gsub(",", "", x)))
    # modified <- purrr::map_dfc(data[,cols_modify], stringr::str_remove_all, ",")
    as.data.frame(cbind(skipped, modified))

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
