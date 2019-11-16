tabPanel('Pre Open Data', value = 'tab_norm',

  fluidPage(
    fluidRow(
      column(8, align = 'left',
        h4('Pre Open'),
        p('Pre open session data of futures & options, nifty and nifty bank.')
      ),
      column(4, align = 'right',
        actionButton(inputId='ndistlink1', label="Help", icon = icon("question-circle"),
          onclick ="window.open('https://nsetools.rsquaredacademy.com/reference/index.html#section-pre-open-data', '_blank')")
      )
    ),
    hr(),
    fluidRow(
      column(12,
        tabsetPanel(type = 'tabs',
          tabPanel('Futures & Options',
            column(12,
              dataTableOutput('preopen_fo') %>% 
                shinycssloaders::withSpinner()
            )
          ),
          tabPanel('Nifty',
            column(12,
              dataTableOutput('preopen_nifty') %>% 
                shinycssloaders::withSpinner()
            )
          ),
          tabPanel('Nifty Bank',
            column(12,
              dataTableOutput('preopen_nifty_bank') %>% 
                shinycssloaders::withSpinner()
            )
          )
        )
      )
    )
  )

)
