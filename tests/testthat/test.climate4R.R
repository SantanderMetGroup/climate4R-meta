# tests/testthat/test-climate4R.R

test_that("climate4R_check_versions runs without error", {
  expect_silent(climate4R_check_versions())
})

test_that("climate4R_check_remotes_consistency runs without error", {
  expect_silent(climate4R_check_remotes_consistency())
})

test_that("climate4R_session_info outputs information", {
  expect_silent(climate4R_session_info())
})

test_that("climate4R_report runs and returns logical", {
  result <- climate4R_report()
  expect_true(is.logical(result))
})