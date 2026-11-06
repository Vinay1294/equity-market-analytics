# Equity Market Analytics — Final Project Report

## 1. Project Overview

The Equity Market Analytics project uses SQL to analyze historical stock market data and understand stock price performance, trading activity, and investment risk.

The analysis was performed using MySQL 8.0 and MySQL Workbench. Microsoft Excel was used to view and verify the exported CSV results.

## 2. Project Objectives

- Evaluate annual stock price performance for 2025.
- Analyze monthly average closing prices.
- Examine trading volume.
- Measure annualized stock volatility.
- Calculate maximum drawdown.
- Identify data quality issues.
- Consolidate stock performance and risk metrics to compare the stocks in the dataset.

## 3. Dataset Description

The project uses historical daily stock price data containing the following fields:

- `DATE` — trading date.
- `SYMBOL` — stock ticker symbol.
- `OPEN` — opening price.
- `HIGH` — highest recorded price for the day.
- `LOW` — lowest recorded price for the day.
- `CLOSE` — closing price.
- `VOLUME` — recorded trading volume.

### Dataset Summary

- Total records: 139,714
- Unique stock symbols: 50
- Start date: January 1, 2015
- End date: August 31, 2026
- Main performance and risk analysis period: 2025
- Minimum recorded trading days for inclusion in the consolidated 2025 analysis: 240

## 4. Tools and Technologies

- **MySQL 8.0:** Used to query and analyze the stock price data.
- **MySQL Workbench:** Used to write, execute, and manage SQL scripts.
- **Microsoft Excel:** Used to open and inspect exported CSV results.
- **CSV files:** Used to store the outputs of the SQL analyses.

## 5. SQL Methodology

Seven SQL analyses were performed:

1. **Data quality analysis:** Checked the record count, number of unique stocks, date range, missing prices, invalid high-low relationships, and negative trading volume.
2. **Annual performance analysis:** Compared the first and last recorded closing prices for each stock in 2025 and calculated percentage price changes.
3. **Monthly analysis:** Examined monthly average closing prices and month-over-month comparisons.
4. **Trading volume analysis:** Examined trading volume for the 2025 analysis period.
5. **Volatility analysis:** Calculated annualized volatility from daily returns using the square root of 252 trading days, with a minimum of 240 recorded days.
6. **Maximum drawdown analysis:** Measured the largest peak-to-trough decline during 2025.
7. **Consolidated performance and risk analysis:** Combined annual price performance, annualized volatility, and maximum drawdown for comparison.


## 6. Key Findings

### 6.1 Annual Stock Price Performance

The consolidated analysis included 49 stocks with at least 240 recorded trading days in 2025.

- **Highest price increase:** SHRIRAMFIN recorded a price change of +73.28%, increasing from a first recorded closing price of ₹571.69 to a last recorded closing price of ₹990.60.
- **Second-highest price increase:** EICHERMOT recorded a price change of +51.62%.
- **Lowest price change:** TRENT recorded a price change of -39.43%, decreasing from ₹7,053.55 to ₹4,272.69.
- TCS recorded a price change of -19.32%, the second-lowest result in the consolidated dataset.

These figures represent changes between the first and last recorded closing prices in 2025, not total investment returns including dividends.

### 6.2 Volatility Analysis

- TRENT recorded the highest annualized volatility at 38.21%.
- ITC recorded the lowest annualized volatility at 15.13%.
- SHRIRAMFIN recorded annualized volatility of 34.62%.

Annualized volatility measures the variability of daily returns. Higher volatility indicates greater historical fluctuation, but it does not predict the direction of future price movements.

### 6.3 Maximum Drawdown Analysis

- TRENT recorded the largest maximum drawdown at -45.08%.
- BHARTIARTL recorded the smallest maximum drawdown at -8.55%.
- LTIM recorded a maximum drawdown of -33.62%, despite its positive annual price change of +6.83%.

Maximum drawdown measures the largest peak-to-trough decline during the measured period. It provides additional information about historical downside risk beyond the beginning-to-end price change.

### 6.4 Data Quality Findings

The initial data quality analysis identified:

- 139,714 total records.
- 50 unique stock symbols.
- No missing opening prices.
- No missing closing prices.
- 182 records where the recorded HIGH value was lower than LOW.
- No records with negative trading volume.

Further investigation found that all 182 records with HIGH lower than LOW had zero recorded volume and a difference between HIGH and LOW of less than 0.0001. These records were retained rather than automatically deleted. They should be documented as a data quality issue.

### 6.5 Overall Interpretation

The results demonstrate that annual price performance and historical risk measures provide different perspectives on stock behavior. SHRIRAMFIN led the dataset in annual price change, while TRENT had both the weakest annual price change and the largest maximum drawdown.

The results also show why comparing stocks using only their beginning and ending prices may be insufficient. Volatility and drawdown help describe how much prices fluctuated and how deeply they fell during the analysis period.


## 7. Limitations of the Analysis

1. **Historical data:** The analysis uses historical stock prices from the available dataset. Past performance does not guarantee future results.
2. **Price changes versus total returns:** Annual performance is calculated using the first and last recorded closing prices. Dividends, taxes, and transaction costs are not included.
3. **Trading days:** The consolidated analysis includes stocks with at least 240 recorded days in 2025. Results may not represent stocks excluded by this criterion.
4. **Volatility estimation:** Annualized volatility is estimated from daily returns using 252 trading days per year.
5. **Maximum drawdown period:** The drawdown calculation measures peak-to-trough declines within the analyzed 2025 period. Peaks before 2025 are not included.
6. **Data quality:** The 182 records where HIGH was lower than LOW require further investigation. They were retained rather than automatically removed.
7. **Scope:** The analysis describes historical performance and risk. It does not establish which stock will perform best in the future or provide personalized investment advice.

## 8. Conclusion

The Equity Market Analytics project demonstrates how SQL can be used to investigate historical stock market data and calculate meaningful performance and risk metrics.

The project analyzed annual price changes, monthly price trends, trading volume, annualized volatility, maximum drawdown, and data quality. The consolidated results showed differences in both price performance and historical risk across the 49 stocks that met the minimum recorded-day requirement for 2025.

SHRIRAMFIN recorded the highest annual price change in the analyzed dataset, while TRENT recorded the lowest annual price change and the largest maximum drawdown. These findings illustrate the value of examining multiple metrics rather than evaluating stocks solely by their annual price changes.

The project also highlighted the importance of data quality checks before interpreting analytical results.

Overall, this project strengthened practical skills in SQL querying, data validation, financial metric calculation, result interpretation, and project documentation.

## 9. Project Files

- `README.md` — project overview and instructions.
- `sql/queries/` — seven SQL scripts used for analysis.
- `sql/SQL_results/` — seven exported CSV result files.
- `reports/Equity_Market_Analytics_Report.md` — final project report.

