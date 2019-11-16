tabPanel('Futures & Options', value = 'tab_f',

  fluidPage(
    fluidRow(
      column(7, align = 'left',
        h4('Futures & Options'),
        p('Futures & options lotsizes, top gainers and losers.')
      ),
      column(5, align = 'right',
        actionButton(inputId='fdistlink1', label="Help", icon = icon("question-circle"),
          onclick ="window.open('https://nsetools.rsquaredacademy.com/reference/index.html#section-index', '_blank')")
      )
    ),
    hr(),
    fluidRow(
      column(12,
        tabsetPanel(type = 'tabs',
          tabPanel('Lot Sizes',
            column(12,
              dataTableOutput('fo_lotsizes') %>% 
                shinycssloaders::withSpinner()
            )
          ),
          tabPanel('Top Gainers',
            column(12,
              dataTableOutput('fo_top_gainers') %>% 
                shinycssloaders::withSpinner()
            )
          ),
          tabPanel('Top Losers',
            column(12,
              dataTableOutput('fo_top_losers') %>% 
                shinycssloaders::withSpinner()
            )
          )
        )
      )
    )
  )

)
