context("futures and options")

httptest::with_mock_api({
  test_that("output from nse_fo_top_gainers is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_fo_top_gainers()
    expect_equal(
      names(iquotes),
      c("symbol", "series", "last_corp_announcement_date",
        "last_corp_announcement", "open_price", "high_price",
        "low_price", "last_traded_price",
        "prev_close_price", "percent_change",
        "traded_quantity", "turnover_in_lakhs"))
  })
})

httptest::with_mock_api({
  test_that("output from nse_fo_top_losers is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_fo_top_losers()
    expect_equal(
      names(iquotes),
      c("symbol", "series", "last_corp_announcement_date",
        "last_corp_announcement", "open_price", "high_price",
        "low_price", "last_traded_price",
        "prev_close_price", "percent_change",
        "traded_quantity", "turnover_in_lakhs"))
  })
})
