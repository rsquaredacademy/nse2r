context("preopen")

httptest::with_mock_api({
  test_that("output from nse_preopen_nifty is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_preopen_nifty()
    expect_equal(ncol(iquotes), 17)
  })
})

httptest::with_mock_api({
  test_that("output from nse_preopen_nifty_bank is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_preopen_nifty_bank()
    expect_equal(ncol(iquotes), 17)
  })
})

