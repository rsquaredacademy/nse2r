output$stock_code <- renderDataTable({
	nsetools::nse_stock_code()
})

output$stock_most_traded <- renderDataTable({
	nsetools::nse_stock_most_traded()
})

output$stock_top_gainers <- renderDataTable({
	nsetools::nse_stock_top_gainers()
})

output$stock_top_losers <- renderDataTable({
	nsetools::nse_stock_top_losers()
})

output$stock_year_high <- renderDataTable({
	nsetools::nse_stock_year_high()
})

output$stock_year_low <- renderDataTable({
	nsetools::nse_stock_year_low()
})