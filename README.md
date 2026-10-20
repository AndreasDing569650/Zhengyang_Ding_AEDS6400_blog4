# AEDS 6400 Blog Post 4: Housing Affordability in the United States

## 1. Project Overview

This project examines how housing affordability in the United States has changed over time. The main research question is:
> **How has housing affordability in the United States changed over time, and what roles have house prices, mortgage rates, and household income played in this change?**

The project uses data from the Federal Reserve Bank of St. Louis FRED database to examine changes in housing affordability in the United States.
The analysis combines median sales prices of new houses, 30-year fixed mortgage rates, median household income, and the Consumer Price Index (CPI). The data are collected through the FRED API and transformed into comparable measures by adjusting house prices for inflation and constructing a house-price-to-income ratio.
The project uses 3 sets of time-series visualizations to examine long-run changes in housing prices, borrowing costs, and housing affordability.

## 2. Data and Method

The project uses data from the Federal Reserve Bank of St. Louis **FRED (Federal Reserve Economic Data)** database. Data are collected through the FRED API, cleaned and transformed in R, and then used to construct the final indicators and visualizations.

The project uses four FRED series:

| Variable | FRED Series | Frequency | Description |
|---|---|---|---|
| House price | `MSPUS` | Quarterly | Median sales price of new houses sold in the United States |
| Mortgage rate | `MORTGAGE30US` | Weekly | 30-year fixed-rate mortgage average |
| Median household income | `MEHOINUSA672N` | Annual | Real median household income in the United States |
| CPI | `CPIAUCSL` | Monthly | Consumer Price Index for All Urban Consumers |

The FRED API is used to retrieve the observations programmatically. The Consumer Price Index (`CPIAUCSL`) is used to adjust nominal house prices for inflation. The CPI is originally reported monthly. To make it consistent with the quarterly house-price data, monthly CPI observations are aggregated into quarterly averages. The 2025 average CPI is used as the base period for converting nominal house prices into 2025 dollars.

In our analysis, we first plot the time series regularity of real house price and 30-year mortgage rate respectively. These two figures complement each other in explaining purchasing cost.

For the third figure, comparing house prices with household income provides a simple way to assess whether housing has become more or less affordable relative to household resources. The income series is annual, while house prices are quarterly. Therefore, the annual income observation is matched to each quarter within the corresponding year.

## 3. Repository Structure

```text
Zhengyang_Ding_AEDS6400_blog4/
│
├── code/
│   ├── data_scrape.R
│   ├── data_clean.R
│   └── data_analysis.R
│
├── data/
│   ├── raw_data/
│   │   ├── house_price_raw.csv
│   │   ├── mortgage_rate_raw.csv
│   │   ├── median_income_raw.csv
│   │   └── cpi_raw.csv
│   │
│   └── cleaned_data/
│       └── housing_data.csv
│
├── figure/
│   ├── figure1_real_house_price.png
│   ├── figure2_mortgage_rate.png
│   └── figure3_price_income_ratio.png
│
└── README.md
