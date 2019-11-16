output$index_list <- renderDataTable({
	nsetools::nse_index_list()
})

output$index_quote <- renderDataTable({
	nsetools::nse_index_quote()
})

