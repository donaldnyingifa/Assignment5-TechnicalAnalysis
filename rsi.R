# ==============================================================
# Relative Strength Index (RSI)
# Author: donaldnyingifa
# Assignment: BDA400 Assignment 5 - Technical Analysis using R
# ==============================================================
# RSI measures momentum by comparing the size of recent gains to
# the size of recent losses. We first split day-to-day price
# changes into "gains" and "losses" buckets, average the first
# 'period' of each, and then roll those averages forward using
# Wilder's smoothing method so that every new day nudges the
# average rather than replacing it outright.

rsi <- function(data, period) {

  # Calculate the differences between consecutive data points
  diff_values <- diff(data)

  n <- length(diff_values)

  # Initialize two vectors to store the gains and losses
  gains <- numeric(n)
  losses <- numeric(n)

  # Calculate gains and losses
  for (i in 1:n) {
    if (diff_values[i] > 0) {
      gains[i] <- diff_values[i]
      losses[i] <- 0
    } else {
      losses[i] <- abs(diff_values[i])
      gains[i] <- 0
    }
  }

  # Calculate the average gains and average losses for the first 'period' data points
  avg_gain <- mean(gains[1:period])
  avg_loss <- mean(losses[1:period])

  # Initialize the RSI vector with NA values
  rsi_values <- rep(NA, length(data))

  # Calculate RSI values using Wilder's smoothing method
  for (i in (period + 1):length(data)) {
    avg_gain <- (avg_gain * (period - 1) + gains[i - 1]) / period
    avg_loss <- (avg_loss * (period - 1) + losses[i - 1]) / period

    rs <- avg_gain / avg_loss
    rsi_values[i] <- 100 - (100 / (1 + rs))
  }

  return(rsi_values)
}

# --------------------------------------------------------------
# Quick manual test (uncomment to run directly)
# --------------------------------------------------------------
# data <- c(45, 50, 48, 55, 52, 49, 58, 60, 65, 62)
# rsi_result <- rsi(data, period = 5)
# print(rsi_result)
