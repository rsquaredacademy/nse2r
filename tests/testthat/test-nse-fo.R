context("futures and options")

test_that("output from nse_fo_lotsizes is as expected", {
  testthat::skip_on_cran()
  iquotes <- read.csv("www.nseindia.com/content/fo/fo_mktlots.csv")
  expect_equal(ncol(iquotes), 16)
})

httptest::with_mock_api({
  test_that("output from nse_fo_top_gainers is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_fo_top_gainers()
    expect_equal(
      names(iquotes),
      c("symbol", "series", "openPrice", "highPrice", "lowPrice", "ltp",
        "previousPrice", "netPrice", "tradedQuantity", "turnoverInLakhs",
        "lastCorpAnnouncementDate", "lastCorpAnnouncement" ))
  })
})

httptest::with_mock_api({
  test_that("output from nse_fo_top_losers is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_fo_top_losers()
    expect_equal(
      names(iquotes),
      c("symbol", "series", "openPrice", "highPrice", "lowPrice", "ltp",
        "previousPrice", "netPrice", "tradedQuantity", "turnoverInLakhs",
        "lastCorpAnnouncementDate", "lastCorpAnnouncement" ))
  })
})
