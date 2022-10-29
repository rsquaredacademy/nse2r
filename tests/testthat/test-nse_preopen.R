context("preopen")

httptest::with_mock_api({
  test_that("output from nse_preopen_nifty is as expected", {
    
    testthat::skip_on_cran()
    testthat::skip_on_os("windows")
    testthat::skip_on_os("mac")
    
    iquotes <- nse_preopen_nifty()
    
    expect_equal(ncol(iquotes), 17)
    
    expect_equal(
      names(iquotes),
      c("symbol", "series", "corp_action_date",
        "corp_action", "price", "change",
        "percent_change", "prev_close", "quantity",
        "value", "mkt_cap", "year_high", "year_low",
        "sum_val", "sum_quantity", "fin_quantity",
        "sum_fin_quantity"))
  })
})

httptest::with_mock_api({
  test_that("output from nse_preopen_nifty_bank is as expected", {
    
    testthat::skip_on_cran()
    testthat::skip_on_os("windows")
    testthat::skip_on_os("mac")

    iquotes <- nse_preopen_nifty_bank()
    
    expect_equal(ncol(iquotes), 17)
    
    expect_equal(
      names(iquotes),
      c("symbol", "series", "corp_action_date",
        "corp_action", "price", "change",
        "percent_change", "prev_close", "quantity",
        "value", "mkt_cap", "year_high", "year_low",
        "sum_val", "sum_quantity", "fin_quantity",
        "sum_fin_quantity"))
  })
})

