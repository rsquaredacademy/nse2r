httptest::with_mock_api({
  test_that("output from nse_advances_declines is as expected", {
    testthat::skip_on_cran()
    iquotes <- nse_advances_declines()
    expect_equal(names(iquotes), c("index_name", "advances", "declines", "unchanged"))
  })
})



