httptest::with_mock_api({
  test_that("output from nse_stock_most_traded is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_stock_most_traded()
    expect_equal(
      names(iquotes),
      c("security", "share_turnover", "traded_quantity",
        "no_of_trades", "avg_daily_turnonver", "turnover"))
  })
})

httptest::with_mock_api({
  test_that("output from nse_stock_year_high is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_stock_year_high()
    expect_equal(
      names(iquotes),
      c("symbol", "symbol_desc", "date", "new_high", "year",
        "last_traded_price", "prev_high", "prev_close",
        "change", "percent_change"))
  })
})

httptest::with_mock_api({
  test_that("output from nse_stock_year_low is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_stock_year_low()
    expect_equal(
      names(iquotes),
      c("symbol", "symbol_desc", "date", "new_low", "year",
        "last_traded_price", "prev_low", "prev_close",
        "change", "percent_change"))
  })
})

httptest::with_mock_api({
  test_that("output from nse_stock_top_gainers is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_stock_top_gainers()
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
  test_that("output from nse_stock_top_losers is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_stock_top_losers()
    expect_equal(
      names(iquotes),
      c("symbol", "series", "last_corp_announcement_date",
        "last_corp_announcement", "open_price", "high_price",
        "low_price", "last_traded_price",
        "prev_close_price", "percent_change",
        "traded_quantity", "turnover_in_lakhs"))
  })
})



test_that("output from nse_stock_code is as expected", {
  testthat::skip_on_cran()
  iquotes <- read.csv("www.nseindia.com/content/equities/EQUITY_L.csv")
  expect_equal(
    names(iquotes),
    c("SYMBOL", "NAME.OF.COMPANY", "SERIES", "DATE.OF.LISTING",	"PAID.UP.VALUE",
      "MARKET.LOT",	"ISIN.NUMBER", "FACE.VALUE")
  )
})















