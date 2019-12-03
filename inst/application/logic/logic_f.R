output$fo_top_gainers <- renderDataTable({
	nse2r::nse_fo_top_gainers()
})

output$fo_top_losers <- renderDataTable({
	nse2r::nse_fo_top_losers()
})

