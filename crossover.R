# ==============================================================
# Crossover function
# Author: donaldnyingifa
# Assignment: BDA400 Assignment 5 - Technical Analysis using R
# ==============================================================
# A crossover happens the moment one line moves from being at or
# below a second line to being strictly above it. We scan through
# both arrays together and flag "Up" only at the exact point where
# that flip occurs.

crossover <- function(arr1, arr2) {

  # Check if the length of both arrays is the same
  if (length(arr1) != length(arr2)) {
    stop("Both arrays should have the same length")
  }

  n <- length(arr1)

  # Initialize a vector to store the crossover signals
  crossover_signals <- character(n)
  crossover_signals[1] <- "None"

  # Check for crossovers at each data point
  for (i in 2:n) {
    if (arr1[i] > arr2[i] && arr1[i - 1] <= arr2[i - 1]) {
      crossover_signals[i] <- "Up"
    } else {
      crossover_signals[i] <- "None"
    }
  }

  return(crossover_signals)
}

# --------------------------------------------------------------
# Quick manual test (uncomment to run directly)
# --------------------------------------------------------------
# arr1 <- c(10, 12, 15, 20, 18, 22, 25, 24, 21)
# arr2 <- c(18, 20, 22, 18, 15, 12, 10, 11, 13)
# crossover_signals <- crossover(arr1, arr2)
# print(crossover_signals)
