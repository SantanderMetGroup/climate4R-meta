# tests/testthat/test-climate4R.R

test_that("check_installed_versions runs with message", {
  expect_message(check_installed_versions())
})

test_that("check_remotes_versions runs with message", {
  expect_message(check_remotes_versions())
})

test_that("show_installed_versions outputs information", {
  expect_output(show_installed_versions())
})

test_that("report_versions runs and returns logical", {
  result <- report_versions()
  expect_true(is.logical(result))
})