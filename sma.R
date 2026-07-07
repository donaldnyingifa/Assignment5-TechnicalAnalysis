# ==============================================================
# Simple Moving Average (SMA)
# Author: donaldnyingifa
# Assignment: BDA400 Assignment 5 - Technical Analysis using R
# ==============================================================
# The SMA smooths a series of numbers by averaging each window of
# 'period' consecutive values. It gives every point in the window
# equal weight, which is what makes it "simple" compared to the EMA.

sma <- function(data, period) {

  # A moving average obviously can't be computed if we don't have
  # at least 'period' values to average over, so we stop early.
  if (length(data) < period) {
    stop("Data length should be greater than or equal to the period")
  }

  n <- length(data)

  # We'll end up with one SMA value for every window of 'period'
  # values that fits inside the data.
  sma_values <- numeric(n - period + 1)

  for (i in 1:(n - period + 1)) {
    current_window <- data[i:(i + period - 1)]
    mean_value <- sum(current_window) / period
    sma_values[i] <- mean_value
  }

  return(sma_values)
}

# --------------------------------------------------------------
# Quick manual test (uncomment to run directly)
# --------------------------------------------------------------
# data <- c(10, 12, 15, 20, 18, 22, 25, 24, 21)
# sma_result <- sma(data, period = 3)
# print(sma_result)
