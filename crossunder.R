# ==============================================================
# Crossunder function
# Author: donaldnyingifa
# Assignment: BDA400 Assignment 5 - Technical Analysis using R
# ==============================================================
# This is the mirror image of the crossover function. Instead of
# looking for one line breaking above another, we look for the
# moment it drops below it, having been at or above it the step
# before.

crossunder <- function(arr1, arr2) {

  # Check if the length of both arrays is the same
  if (length(arr1) != length(arr2)) {
    stop("Both arrays should have the same length")
  }

  n <- length(arr1)

  # Initialize a vector to store the crossunder signals
  crossunder_signals <- character(n)
  crossunder_signals[1] <- "None"

  # Check for crossunder signals at each data point
  for (i in 2:n) {
    if (arr1[i] < arr2[i] && arr1[i - 1] >= arr2[i - 1]) {
      crossunder_signals[i] <- "True"
    } else {
      crossunder_signals[i] <- "False"
    }
  }

  return(crossunder_signals)
}

# --------------------------------------------------------------
# Quick manual test (uncomment to run directly)
# --------------------------------------------------------------
# arr1 <- c(10, 12, 15, 20, 18, 22, 25, 24, 21)
# arr2 <- c(18, 20, 22, 18, 15, 12, 10, 11, 13)
# crossunder_signals <- crossunder(arr1, arr2)
# print(crossunder_signals)
