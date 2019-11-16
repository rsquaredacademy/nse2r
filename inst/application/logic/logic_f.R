output$fo_lotsizes <- renderDataTable({
	nsetools::nse_fo_lotsizes()
})

output$fo_top_gainers <- renderDataTable({
	nsetools::nse_fo_top_gainers()
})

output$fo_top_losers <- renderDataTable({
	nsetools::nse_fo_top_losers()
})

