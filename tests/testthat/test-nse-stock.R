context("stock")

httptest::with_mock_api({
  test_that("output from nse_stock_most_traded is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_stock_most_traded()
    expect_equal(
      names(iquotes),
      c("security", "sharetotal", "trdQty", "nooftrades", "avgdailyturn",
        "turnover"))
  })
})

httptest::with_mock_api({
  test_that("output from nse_stock_year_high is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_stock_year_high()
    expect_equal(
      names(iquotes),
      c("symbol", "symbolDesc", "value", "year", "ltp", "value_old", "dt",
        "prev", "change", "pChange"))
  })
})

httptest::with_mock_api({
  test_that("output from nse_stock_year_low is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_stock_year_low()
    expect_equal(
      names(iquotes),
      c("symbol", "symbolDesc", "value", "year", "ltp", "value_old", "dt",
        "prev", "change", "pChange"))
  })
})

httptest::with_mock_api({
  test_that("output from nse_stock_top_gainers is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_stock_top_gainers()
    expect_equal(
      names(iquotes),
      c("symbol", "series", "openPrice", "highPrice", "lowPrice", "ltp",
        "previousPrice", "netPrice", "tradedQuantity", "turnoverInLakhs",
        "lastCorpAnnouncementDate", "lastCorpAnnouncement"))
  })
})

httptest::with_mock_api({
  test_that("output from nse_stock_top_losers is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_stock_top_losers()
    expect_equal(
      names(iquotes),
      c("symbol", "series", "openPrice", "highPrice", "lowPrice", "ltp",
        "previousPrice", "netPrice", "tradedQuantity", "turnoverInLakhs",
        "lastCorpAnnouncementDate", "lastCorpAnnouncement"))
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















