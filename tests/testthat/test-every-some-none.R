context("every-some")

test_that("every returns TRUE if all elements are TRUE", {
  x <- list(0, 1, TRUE)
  expect_false(every(x, isTRUE))
  expect_true(every(x[3], isTRUE))
})

test_that("some returns FALSE if all elements are FALSE", {
  x <- list(1, 0, FALSE)
  expect_false(some(x, isTRUE))
  expect_true(some(x[1], negate(isTRUE)))
})

test_that("none returns TRUE if all elements are FALSE", {
  x <- list(1, 0, TRUE)
  expect_false(none(x, isTRUE))
  expect_true(none(x[1], isTRUE))
})

# Life cycle --------------------------------------------------------------

test_that("return NA if present", {
  scoped_lifecycle_warnings()
  expect_warning(expect_equal(some(1:10, ~ NA), NA), "soft-deprecated")
  expect_warning(expect_equal(every(1:10, ~ NA), NA), "soft-deprecated")
})
