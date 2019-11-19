tabPanel('Stock', value = 'tab_binom',

  fluidPage(
    fluidRow(
      column(12,
        fluidRow(
          column(8, align = 'left',
            h4('Stocks'),
            p('Get stock symbol and name, top gainers & losers, 52 week high & low and
              most traded stocks.')
          ),
          column(4, align = 'right',
            actionButton(inputId='binomdist1', label="Help", icon = icon("question-circle"),
              onclick ="window.open('https://nsetools.rsquaredacademy.com/reference/index.html#section-stocks', '_blank')")
          )
        ),
        hr(),
        br(),
        tabsetPanel(type = 'tabs',
          tabPanel('Symbol & Code',
            column(12,
              br(),
              dataTableOutput('stock_code') %>% 
                shinycssloaders::withSpinner()
            )
          ),
          tabPanel('Most Traded',
            column(12,
              br(),
              dataTableOutput('stock_most_traded') %>% 
                shinycssloaders::withSpinner()
            )
          ),
          tabPanel('Top Gainers',
            column(12,
              br(),
              dataTableOutput('stock_top_gainers') %>% 
                shinycssloaders::withSpinner()
            )
          ),
          tabPanel('Top Losers',
            column(12,
              br(),
              dataTableOutput('stock_top_losers') %>% 
                shinycssloaders::withSpinner()
            )
          ),
          tabPanel('52 Week High',
            column(12,
              br(),
              dataTableOutput('stock_year_high') %>% 
                shinycssloaders::withSpinner()
            )
          ),
          tabPanel('52 Week Low',
            column(12,
              br(),
              dataTableOutput('stock_year_low') %>% 
                shinycssloaders::withSpinner()
            )
          )
        )
      )
    )
  )

)
