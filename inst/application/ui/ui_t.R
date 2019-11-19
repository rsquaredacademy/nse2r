tabPanel('Advances & Declines', value = 'tab_t',

  fluidPage(
    fluidRow(
      column(6, align = 'left',
        h4('Advances & Declines'),
        p('Indices advances & declines.')
      ),
      column(6, align = 'right',
        actionButton(inputId='tdistlink1', label="Help", icon = icon("question-circle"),
          onclick ="window.open('https://nsetools.rsquaredacademy.com/reference/index.html#section-advances-declines', '_blank')")
      )
    ),
    hr(),
    br(),
    fluidRow(
      column(12,
        tabsetPanel(type = 'tabs',
          tabPanel('Advances & Declines',
            column(12,
              br(),
              dataTableOutput(outputId = 'advances_declines') %>% 
                shinycssloaders::withSpinner()
            )
          )
        )
      )
    )
  )

)
