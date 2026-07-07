# ==============================================================
# Stochastic RSI (StochRSI)
# Author: donaldnyingifa
# Assignment: BDA400 Assignment 5 - Technical Analysis using R
# ==============================================================
# StochRSI takes the RSI one step further by running the
# Stochastic Oscillator formula on top of it. This squeezes RSI
# values into a 0 to 1 range based on where the current RSI sits
# relative to its own recent high and low, which makes overbought
# and oversold conditions easier to spot. The %K line is that
# normalized value smoothed with an SMA, and %D is a further SMA
# of %K.
#
# NOTE: this file depends on rsi() and sma(), so make sure rsi.R
# and sma.R are sourced before you call stoch_rsi() on its own.

source("rsi.R")
source("sma.R")

stoch_rsi <- function(data, period, k_period, d_period) {

  # Calculate the RSI
  rsi_values <- rsi(data, period)

  # Calculate the StochRSI (ignoring the leading NA values produced by rsi())
  min_rsi <- min(rsi_values, na.rm = TRUE)
  max_rsi <- max(rsi_values, na.rm = TRUE)
  k_values <- (rsi_values - min_rsi) / (max_rsi - min_rsi)

  # Calculate the %K line (StochRSI), skipping the NA entries at the start
  valid_k_values <- k_values[!is.na(k_values)]
  k_line <- sma(valid_k_values, k_period)

  # Calculate the %D line (3-day simple moving average of %K)
  d_line <- sma(k_line, d_period)

  # Return the %K and %D lines as a list
  result <- list(
    k_line = k_line,
    d_line = d_line
  )

  return(result)
}

# --------------------------------------------------------------
# Quick manual test (uncomment to run directly)
# --------------------------------------------------------------
# data <- c(45, 50, 48, 55, 52, 49, 58, 60, 65, 62)
# stoch_rsi_result <- stoch_rsi(data, period = 5, k_period = 3, d_period = 3)
# print(stoch_rsi_result)
