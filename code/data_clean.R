library(dplyr)

data_folder <- "D:/Rproject/6400-blog4/data"

house_price <- read.csv(
  file.path(data_folder, "raw_data", "house_price_raw.csv")
)

mortgage_rate <- read.csv(
  file.path(data_folder, "raw_data", "mortgage_rate_raw.csv")
)

median_income <- read.csv(
  file.path(data_folder, "raw_data", "median_income_raw.csv")
)

cpi <- read.csv(
  file.path(data_folder, "raw_data", "cpi_raw.csv")
)

names(house_price)
names(mortgage_rate)
names(median_income)
names(cpi)

house_price$date <- as.Date(house_price$date)

mortgage_rate$date <- as.Date(mortgage_rate$date)

median_income$date <- as.Date(median_income$date)

cpi$date <- as.Date(cpi$date)

house_price <- house_price %>%
  mutate(
    year = as.integer(format(date, "%Y")),
    quarter = paste0(
      "Q",
      ceiling(as.integer(format(date, "%m")) / 3)
    )
  ) %>%
  select(
    date,
    year,
    quarter,
    house_price
  )

mortgage_rate <- mortgage_rate %>%
  mutate(
    year = as.integer(format(date, "%Y")),
    quarter = paste0(
      "Q",
      ceiling(as.integer(format(date, "%m")) / 3)
    )
  ) %>%
  group_by(year, quarter) %>%
  summarise(
    mortgage_rate = mean(mortgage_rate, na.rm = TRUE),
    .groups = "drop"
  )

cpi <- cpi %>%
  mutate(
    year = as.integer(format(date, "%Y")),
    quarter = paste0(
      "Q",
      ceiling(as.integer(format(date, "%m")) / 3)
    )
  ) %>%
  group_by(year, quarter) %>%
  summarise(
    cpi = mean(cpi, na.rm = TRUE),
    .groups = "drop"
  )

median_income <- median_income %>%
  mutate(
    year = as.integer(format(date, "%Y"))
  ) %>%
  select(
    year,
    median_income
  )

housing_data <- house_price %>%
  
  left_join(
    mortgage_rate,
    by = c("year", "quarter")
  ) %>%
  
  left_join(
    cpi,
    by = c("year", "quarter")
  ) %>%
  
  left_join(
    median_income,
    by = "year"
  )

head(housing_data)

tail(housing_data)

str(housing_data)

colSums(is.na(housing_data))

range(housing_data$date)

range(housing_data$year)

base_cpi <- cpi %>%
  filter(year == 2025) %>%
  summarise(
    base_cpi = mean(cpi, na.rm = TRUE)
  ) %>%
  pull(base_cpi)


base_cpi

housing_data <- housing_data %>%
  mutate(
    real_house_price =
      house_price * (base_cpi / cpi)
  )

housing_data <- housing_data %>%
  mutate(
    price_income_ratio =
      real_house_price / median_income
  )


housing_data <- housing_data %>%
  arrange(date)

head(housing_data)

tail(housing_data)

summary(housing_data)

colSums(is.na(housing_data))

write.csv(
  housing_data,
  file.path(data_folder, "housing_data.csv"),
  row.names = FALSE
)