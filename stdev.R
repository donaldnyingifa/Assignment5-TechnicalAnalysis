# ==============================================================
# Standard Deviation (stdev)
# Author: donaldnyingifa
# Assignment: BDA400 Assignment 5 - Technical Analysis using R
# ==============================================================
# Standard deviation tells us how spread out a set of numbers is
# around its own average. We get there by finding the mean, seeing
# how far each point sits from that mean, squaring those distances
# (so negatives don't cancel out positives), averaging the squares,
# and finally taking the square root to bring the units back to
# something meaningful.

stdev <- function(data) {

  # Calculate the mean of the data
  mean_value <- sum(data) / length(data)

  # Calculate the differences between the data points and the mean
  diff_values <- data - mean_value

  # Calculate the squared differences
  squared_diff <- diff_values^2

  # Calculate the variance (mean of squared differences)
  variance <- sum(squared_diff) / length(squared_diff)

  # Calculate the standard deviation (square root of the variance)
  standard_deviation <- sqrt(variance)

  return(standard_deviation)
}

# --------------------------------------------------------------
# Quick manual test (uncomment to run directly)
# --------------------------------------------------------------
# data <- c(10, 12, 15, 20, 18, 22, 25, 24, 21)
# stdev_result <- stdev(data)
# print(stdev_result)
