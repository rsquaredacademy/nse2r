tabPanel('Indices', value = 'tab_chisq',

  fluidPage(
    fluidRow(
      column(8, align = 'left',
        h4('Indices'),
        p('Get index list and quote.')

      ),
      column(4, align = 'right',
        actionButton(inputId='chidistlink1', label="Help", icon = icon("question-circle"),
          onclick ="window.open('https://nsetools.rsquaredacademy.com/reference/index.html#section-index', '_blank')")
      )
    ),
    hr(),
    br(),
    fluidRow(
      column(12,
        tabsetPanel(type = 'tabs',
          tabPanel('List',
            column(12,
              br(),
              dataTableOutput('index_list') %>% 
                shinycssloaders::withSpinner()
            )
          ),
          tabPanel('Quote',
            column(12,
              br(),
              dataTableOutput('index_quote') %>% 
                shinycssloaders::withSpinner()
            )
          )
        )
      )
    )
  )

)
