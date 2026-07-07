# ==============================================================
# Moving Average Convergence Divergence (MACD)
# Author: donaldnyingifa
# Assignment: BDA400 Assignment 5 - Technical Analysis using R
# ==============================================================
# MACD is built entirely out of EMAs. Two EMAs (a fast one and a
# slow one) are subtracted to get the MACD line, and then that
# line is itself smoothed with another EMA to produce the signal
# line. The gap between the two is the histogram, which traders
# watch for momentum shifts.
#
# NOTE: this file depends on ema(), so make sure ema.R is sourced
# before you call macd() on its own.

source("ema.R")

macd <- function(data, short_period, long_period, signal_period) {

  # Calculate the short-term and long-term exponential moving averages
  short_ema <- ema(data, short_period)
  long_ema <- ema(data, long_period)

  # Calculate the MACD line
  macd_line <- short_ema - long_ema

  # Calculate the signal line (EMA of the MACD line)
  signal_line <- ema(macd_line, signal_period)

  # Calculate the histogram (the difference between the MACD line and the signal line)
  histogram <- macd_line - signal_line

  # Return the MACD line, signal line, and histogram as a list
  result <- list(
    macd_line = macd_line,
    signal_line = signal_line,
    histogram = histogram
  )

  return(result)
}

# --------------------------------------------------------------
# Quick manual test (uncomment to run directly)
# --------------------------------------------------------------
# data <- c(100, 105, 110, 115, 120, 125, 130)
# macd_result <- macd(data, short_period = 3, long_period = 5, signal_period = 2)
# print(macd_result)
