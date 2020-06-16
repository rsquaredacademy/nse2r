output$stock_code <- renderDataTable({
	nse2r::nse_stock_code()
})

output$stock_most_traded <- renderDataTable({
	nse2r::nse_stock_most_traded()
})

output$stock_top_gainers <- renderDataTable({
	nse2r::nse_stock_top_gainers()
})

output$stock_top_losers <- renderDataTable({
	nse2r::nse_stock_top_losers()
})

output$stock_year_high <- renderDataTable({
	nse2r::nse_stock_year_high()
})

output$stock_year_low <- renderDataTable({
	nse2r::nse_stock_year_low()
})
