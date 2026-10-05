# AEDS 6400 Blog Post 4: Housing Affordability in the United States

This project uses data from the Federal Reserve Bank of St. Louis FRED database to examine changes in housing affordability in the United States.
The analysis combines median sales prices of new houses, 30-year fixed mortgage rates, median household income, and the Consumer Price Index (CPI). The data are collected through the FRED API and transformed into comparable measures by adjusting house prices for inflation and constructing a house-price-to-income ratio.
The project uses 3 sets of time-series visualizations to examine long-run changes in housing prices, borrowing costs, and housing affordability.

## Repository Structure

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
