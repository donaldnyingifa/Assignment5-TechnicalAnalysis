# ==============================================================
# Exponential Moving Average (EMA)
# Author: donaldnyingifa
# Assignment: BDA400 Assignment 5 - Technical Analysis using R
# ==============================================================
# Unlike the SMA, the EMA leans more heavily on recent prices. It
# does this recursively: every new EMA value depends on the price
# today and the EMA from yesterday, scaled by a multiplier that is
# derived from the chosen period.

ema <- function(data, period) {

  # Calculate the multiplier for EMA. Shorter periods produce a
  # larger multiplier, meaning the average reacts faster to new data.
  multiplier <- 2 / (period + 1)

  n <- length(data)
  ema_values <- numeric(n)

  for (i in 1:n) {
    if (i == 1) {
      # There's no prior EMA to build on, so we just seed it with
      # the first data point.
      ema_values[i] <- data[i]
    } else {
      ema_values[i] <- (data[i] - ema_values[i - 1]) * multiplier + ema_values[i - 1]
    }
  }

  return(ema_values)
}

# --------------------------------------------------------------
# Quick manual test (uncomment to run directly)
# --------------------------------------------------------------
# data <- c(10, 12, 15, 20, 18, 22, 25, 24, 21)
# ema_result <- ema(data, period = 3)
# print(ema_result)
