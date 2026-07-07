# BDA400 - Technical Analysis using R (Assignment 5, Development Phase)

**Author:** donaldnyingifa
**Course:** BDA400 / Data Science Tools and Techniques
**Assignment:** Assignment 5 - Technical Analysis using R, Development Phase (15%)

## Overview

This repository contains R implementations of nine technical analysis indicators used in financial time series analysis: Simple Moving Average, Exponential Moving Average, MACD, Standard Deviation, Linear Regression, RSI, Stochastic RSI, Crossover, and Crossunder. Every function is written using only R's core language features, with no external libraries, following the templates and pseudocode provided in the assignment brief.

## Repository Structure

```
.
├── README.md
├── sma.R
├── ema.R
├── macd.R
├── stdev.R
├── linreg.R
├── rsi.R
├── stoch_rsi.R
├── crossover.R
├── crossunder.R
├── run_all_tests.R
└── donaldnyingifa_BDA400_A05.pdf
```

## How to Run

1. Clone the repository and open R or RStudio.
2. Set your working directory to the cloned repository folder:
   ```r
   setwd("path/to/repository")
   ```
3. Source any individual function file to use it on its own:
   ```r
   source("sma.R")
   sma(c(10, 12, 15, 20, 18, 22, 25, 24, 21), period = 3)
   ```
4. To see every function run at once using the assignment's sample data, source the test script:
   ```r
   source("run_all_tests.R")
   ```

**Note on dependencies:** `macd.R` sources `ema.R`, and `stoch_rsi.R` sources `rsi.R` and `sma.R`. These `source()` calls are already included at the top of the relevant files, so keep all scripts in the same folder as one another.

## Function Reference

| Function | File | Description |
|---|---|---|
| `sma(data, period)` | sma.R | Simple Moving Average — equal-weighted average over a rolling window |
| `ema(data, period)` | ema.R | Exponential Moving Average — weights recent data more heavily |
| `macd(data, short_period, long_period, signal_period)` | macd.R | MACD line, signal line, and histogram |
| `stdev(data)` | stdev.R | Standard deviation of a dataset |
| `linreg(regressionSource, regressionLength, regressionOffset)` | linreg.R | Slope, intercept, and predicted values from a linear fit |
| `rsi(data, period)` | rsi.R | Relative Strength Index using Wilder's smoothing |
| `stoch_rsi(data, period, k_period, d_period)` | stoch_rsi.R | Stochastic RSI, returning %K and %D lines |
| `crossover(arr1, arr2)` | crossover.R | Flags where arr1 crosses above arr2 |
| `crossunder(arr1, arr2)` | crossunder.R | Flags where arr1 crosses below arr2 |

## Documentation

A full write-up explaining the logic behind each implementation, along with a cover page, is available in `donaldnyingifa_BDA400_A05.docx`.

## Testing

Each function was tested against the sample data provided in the assignment brief and verified to produce results consistent with the described formulas. See `run_all_tests.R` for the full set of checks.
