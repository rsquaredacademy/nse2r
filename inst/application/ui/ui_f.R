tabPanel('Futures & Options', value = 'tab_f',

  fluidPage(
    fluidRow(
      column(7, align = 'left',
        h4('Futures & Options'),
        p('Futures & options top gainers and losers.')
      ),
      column(5, align = 'right',
        actionButton(inputId='fdistlink1', label="Help", icon = icon("question-circle"),
          onclick ="window.open('https://nse2r.rsquaredacademy.com/reference/index.html#section-index', '_blank')")
      )
    ),
    hr(),
    br(),
    fluidRow(
      column(12,
        tabsetPanel(type = 'tabs',
          tabPanel('Top Gainers',
            column(12,
              br(),
              dataTableOutput('fo_top_gainers') %>% 
                shinycssloaders::withSpinner()
            )
          ),
          tabPanel('Top Losers',
            column(12,
              br(),
              dataTableOutput('fo_top_losers') %>% 
                shinycssloaders::withSpinner()
            )
          )
        )
      )
    )
  )

)
