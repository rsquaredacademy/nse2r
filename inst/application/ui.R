library(shiny)
library(shinyBS)
library(shinythemes)
library(magrittr)

shinyUI(

    navbarPage(HTML("nse2r"), id = 'mainpage',

    source('ui/ui_analyze.R', local = TRUE)[[1]],
    source('ui/ui_exit_button.R', local = TRUE)[[1]]
))
