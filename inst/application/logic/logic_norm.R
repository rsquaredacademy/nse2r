output$preopen_nifty <- renderDataTable({
	nse2r::nse_preopen_nifty()
})

output$preopen_nifty_bank <- renderDataTable({
	nse2r::nse_preopen_nifty_bank()
})