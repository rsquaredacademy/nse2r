output$index_list <- renderDataTable({
	nse2r::nse_index_list()
})

output$index_quote <- renderDataTable({
	nse2r::nse_index_quote()
})

