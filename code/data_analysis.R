library(ggplot2)
library(dplyr)

housing_data <- read.csv(
  "D:/Rproject/6400-blog4/data/cleaned_data/housing_data.csv"
)

housing_data$date <- as.Date(housing_data$date)

head(housing_data)

str(housing_data)

summary(housing_data)

ggplot(
  housing_data,
  aes(
    x = date,
    y = real_house_price
  )
) +
  geom_line(
    linewidth = 0.8
  ) +
  labs(
    title = "Real House Prices in the United States",
    subtitle = "Median sales price of new houses, in 2025 dollars",
    x = "Year",
    y = "Real house price (2025 dollars)"
  ) +
  theme_minimal()

ggsave(
  "D:/Rproject/6400-blog4/figure1_real_house_price.png",
  width = 8,
  height = 5,
  dpi = 300
)

ggplot(
  housing_data,
  aes(
    x = date,
    y = mortgage_rate
  )
) +
  geom_line(
    linewidth = 0.8
  ) +
  labs(
    title = "30-Year Fixed Mortgage Rates in the United States",
    subtitle = "Quarterly average",
    x = "Year",
    y = "Mortgage rate (%)"
  ) +
  theme_minimal()

ggsave(
  "D:/Rproject/6400-blog4/figure2_mortgage_rate.png",
  width = 8,
  height = 5,
  dpi = 300
)

ggplot(
  housing_data,
  aes(
    x = date,
    y = price_income_ratio
  )
) +
  geom_line(
    linewidth = 0.8
  ) +
  labs(
    title = "House-Price-to-Income Ratio in the United States",
    subtitle = "Real median house price relative to real median household income",
    x = "Year",
    y = "House-price-to-income ratio"
  ) +
  theme_minimal()

ggsave(
  "D:/Rproject/6400-blog4/figure3_price_income_ratio.png",
  width = 8,
  height = 5,
  dpi = 300
)