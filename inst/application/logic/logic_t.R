output$advances_declines <- renderDataTable({
	nse2r::nse_advances_declines()
})