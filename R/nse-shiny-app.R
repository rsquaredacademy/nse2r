#' @title Launch shiny app
#' @description Launches shiny app for fetching data from NSE.
#' @examples
#' \dontrun{
#' nse_app()
#' }
#' @export
#'
nse_app  <- function() {

  check_suggests('shinyBS')
  check_suggests('shinycssloaders')
  check_suggests('shinythemes')

  shiny::runApp(appDir = system.file("application", package = "nsetools"))
}
