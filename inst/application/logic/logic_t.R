output$advances_declines <- renderDataTable({
	nsetools::nse_advances_declines()
})