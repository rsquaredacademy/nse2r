context("futures and options")

httptest::with_mock_api({
  test_that("output from nse_fo_top_gainers is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_fo_top_gainers()
    expect_equal(
      names(iquotes),
      c("symbol", "series", "lastCorpAnnouncementDate", "lastCorpAnnouncement",
        "openPrice", "highPrice", "lowPrice", "ltp", "previousPrice",
        "netPrice", "tradedQuantity", "turnoverInLakhs"))
  })
})

httptest::with_mock_api({
  test_that("output from nse_fo_top_losers is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_fo_top_losers()
    expect_equal(
      names(iquotes),
      c("symbol", "series", "lastCorpAnnouncementDate", "lastCorpAnnouncement",
        "openPrice", "highPrice", "lowPrice", "ltp", "previousPrice",
        "netPrice", "tradedQuantity", "turnoverInLakhs"))
  })
})
