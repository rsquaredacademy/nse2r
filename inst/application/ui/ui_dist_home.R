tabPanel('Market Data', value = 'tab_dist_home',

	fluidPage(theme = shinytheme('cerulean'),

		includeCSS("mystyle.css"),

		fluidRow(

			column(12),

			br(),

			column(12, align = 'center',
				h5('Fetch Data from NSE')
			),

			br(),
			br(),
			br(),

			column(3),

			column(4, align = 'left',
				h5('Pre Open Session Data')
			),

			column(2, align = 'left',
					actionButton(
						inputId = 'button_dist_home_1',
						label = 'Click Here',
						width = '120px'
					)
			),

			column(3),

			br(),
			br(),
			br(),

			column(3),

			column(4, align = 'left',
				h5('Advances & Declines')
			),

			column(2, align = 'left',
					actionButton(
						inputId = 'button_dist_home_2',
						label = 'Click Here',
						width = '120px'
					)
			),

			column(3),

			br(),
			br(),
			br(),

			column(3),

			column(4, align = 'left',
				h5('Indices')
			),

			column(2, align = 'left',
					actionButton(
						inputId = 'button_dist_home_3',
						label = 'Click Here',
						width = '120px'
					)
			),

			column(3),

			br(),
			br(),
			br(),

			column(3),

			column(4, align = 'left',
				h5('Stock')
			),

			column(2, align = 'left',
					actionButton(
						inputId = 'button_dist_home_4',
						label = 'Click Here',
						width = '120px'
					)
			),

			column(3),

			br(),
			br(),
			br(),

			column(3),

			column(4, align = 'left',
				h5('Futures & Options')
			),

			column(2, align = 'left',
					actionButton(
						inputId = 'button_dist_home_5',
						label = 'Click Here',
						width = '120px'
					)
			),

			column(3)

		)

	)
)