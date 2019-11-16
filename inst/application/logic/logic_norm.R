output$preopen_fo <- renderDataTable({
	nsetools::nse_preopen_fo()
})

output$preopen_nifty <- renderDataTable({
	nsetools::nse_preopen_nifty()
})

output$preopen_nifty_bank <- renderDataTable({
	nsetools::nse_preopen_nifty_bank()
})