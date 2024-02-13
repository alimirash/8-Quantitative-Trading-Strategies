# The Implementation of 8 Strategies

**WARNING: USE AT YOUR OWN RISK!**

[![GitHub repo size](https://img.shields.io/github/repo-size/alimirash/8-Quantitative-Trading-Strategies)](https://github.com/alimirash/8-Quantitative-Trading-Strategies)
[![GitHub contributors](https://img.shields.io/github/contributors/alimirash/8-Quantitative-Trading-Strategies)](https://github.com/alimirash/8-Quantitative-Trading-Strategies)
[![GitHub stars](https://img.shields.io/github/stars/alimirash/8-Quantitative-Trading-Strategies?style=social)](https://github.com/alimirash/8-Quantitative-Trading-Strategies)
[![GitHub forks](https://img.shields.io/github/forks/alimirash/8-Quantitative-Trading-Strategies?style=social)](https://github.com/alimirash/8-Quantitative-Trading-Strategies)

This repository contains the implementation of 8 trading strategies in MQL based on the approaches extracted from a [YouTube video](https://youtu.be/rlSkRMmycWo?si=70ZUCUANZuuQW4o3). The strategies are designed to be used in MetaTrader 5 (MQ5).

## Strategies Overview

### 1. Rubber Band Strategy
- Calculate a 5-day average of (High minus Low - (H-L)). This is the "ATR".
- Calculate the High of the last 5 days.
- Calculate a band 2.5 times below the 5-day High using the calculated ATR.
- If it closes below the band, go long at the close.
- Exit when the close is higher than yesterday's high.

### 2. 23rd June - July
- Buy on the close of the first trading day after the 23rd of June.
- Sell on the close on the first trading day of July.

### 3. MFI (Money Flow Index)
- If the two-day MFI is below 10, buy at the close.
- Sell at the close when the close ends higher than yesterday's high.
- **Profit Factor:** 3.24, **Percent Profitable:** 64%

### 4. RSI
- When the 2-week RSI crosses below 15, go long at Friday's close.
- Sell when the 2-weekly RSI crosses above 20.

### 5. Turn Off The Month Strategy
- Go long at the close on the fifth last trading day of the month.
- Exit after seven days, i.e., at the close of the third trading day of the next month.

### 6. Turnaround Monday Strategy
- Today is Monday.
- Today's close is lower than yesterday's close.
- Yesterday's close (Friday's close) must be lower than Thursday's close.
- If 1-3 are true, go long at the close on Monday.
- Sell at the close when today's close is higher than yesterday's high.


### 7. New Intraday High Strategy
- Today the S&P 500 must have made a new intraday high that is higher than the previous ten days' high.
- Today's IBS must be lower than 0.15.
- If 1 and 2 are true, go long at the close.
- Sell at the close when today's close is higher than yesterday's high.

## Usage

The MQL code for each strategy is available in the respective folders. You can use these files in your MetaTrader 5 platform to test and execute the strategies.

***Happy Trading and Profitable💲😎***
