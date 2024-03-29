httptest::with_mock_api({
  test_that("output from nse_index_quote is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_index_quote()
    expect_equal(names(iquotes), c("index_name", "last_traded_price", "change",
                        "percent_change"))
  })
})

httptest::with_mock_api({
  test_that("output from nse_index_list is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_index_list()
    expect_equal(names(iquotes), c("index_name"))
  })
})


httptest::with_mock_api({
  test_that("output from nse_index_valid is as expected", {
    testthat::skip_on_cran()
    expect_true(nse_index_valid("nifty auto"))
    expect_false(nse_index_valid("nifty cps"))
  })
})
