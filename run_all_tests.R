# ==============================================================
# Test / Demo Script
# Author: donaldnyingifa
# Assignment: BDA400 Assignment 5 - Technical Analysis using R
# ==============================================================
# This script sources every indicator file and runs the sample
# examples given in the assignment so you can see each function
# working end to end without having to open every file one by one.

setwd(dirname(sys.frame(1)$ofile))

source("sma.R")
source("ema.R")
source("macd.R")
source("stdev.R")
source("linreg.R")
source("rsi.R")
source("stoch_rsi.R")
source("crossover.R")
source("crossunder.R")

cat("\n==================== SMA ====================\n")
data <- c(10, 12, 15, 20, 18, 22, 25, 24, 21)
print(sma(data, period = 3))

cat("\n==================== EMA ====================\n")
print(ema(data, period = 3))

cat("\n==================== MACD ====================\n")
macd_data <- c(100, 105, 110, 115, 120, 125, 130)
print(macd(macd_data, short_period = 3, long_period = 5, signal_period = 2))

cat("\n==================== STDEV ====================\n")
print(stdev(data))

cat("\n==================== LINREG ====================\n")
print(linreg(data, regressionLength = 6, regressionOffset = 0))

cat("\n==================== RSI ====================\n")
rsi_data <- c(45, 50, 48, 55, 52, 49, 58, 60, 65, 62)
print(rsi(rsi_data, period = 5))

cat("\n==================== STOCH RSI ====================\n")
print(stoch_rsi(rsi_data, period = 5, k_period = 3, d_period = 3))

cat("\n==================== CROSSOVER ====================\n")
arr1 <- c(10, 12, 15, 20, 18, 22, 25, 24, 21)
arr2 <- c(18, 20, 22, 18, 15, 12, 10, 11, 13)
print(crossover(arr1, arr2))

cat("\n==================== CROSSUNDER ====================\n")
print(crossunder(arr1, arr2))
