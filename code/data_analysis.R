library(ggplot2)
library(dplyr)

project_path <- ".."

data_folder <- file.path(
  project_path,
  "data"
)

cleaned_data_path <- file.path(
  data_folder,
  "cleaned_data"
)

figure_path <- file.path(
  project_path,
  "figure"
)

housing_data_path <- file.path(
  cleaned_data_path,
  "housing_data.csv"
)

figure1_path <- file.path(
  figure_path,
  "figure1_real_house_price.png"
)

figure2_path <- file.path(
  figure_path,
  "figure2_mortgage_rate.png"
)

figure3_path <- file.path(
  figure_path,
  "figure3_price_income_ratio.png"
)

housing_data <- read.csv(
  housing_data_path
)

housing_data$date <- as.Date(housing_data$date)

head(housing_data)

str(housing_data)

summary(housing_data)

# =============================================================================
# Figure 1: Real House Prices
# =============================================================================

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
  figure1_path,
  width = 8,
  height = 5,
  dpi = 300
)

# =============================================================================
# Figure 2: Mortgage Rates
# =============================================================================

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
  figure2_path,
  width = 8,
  height = 5,
  dpi = 300
)

# =============================================================================
# Figure 3: House-Price-to-Income Ratio
# =============================================================================

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
  figure3_path,
  width = 8,
  height = 5,
  dpi = 300
)
