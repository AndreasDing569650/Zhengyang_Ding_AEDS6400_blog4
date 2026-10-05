library(jsonlite)
library(dplyr)

api_key <- "b0e13cc0dc34627cceb4039dbd650349"

get_fred_data <- function(series_id, api_key) {
  
  url <- paste0(
    "https://api.stlouisfed.org/fred/series/observations?",
    "series_id=", series_id,
    "&api_key=", api_key,
    "&file_type=json"
  )
  
  data <- fromJSON(url)$observations
  
  data <- data.frame(
    date = as.Date(data$date),
    value = as.numeric(data$value)
  )
  
  return(data)
}

house_price <- get_fred_data(
  "MSPUS",
  api_key
)

mortgage_rate <- get_fred_data(
  "MORTGAGE30US",
  api_key
)

median_income <- get_fred_data(
  "MEHOINUSA672N",
  api_key
)

cpi <- get_fred_data(
  "CPIAUCSL",
  api_key
)

house_price <- house_price %>%
  rename(
    house_price = value
  )

mortgage_rate <- mortgage_rate %>%
  rename(
    mortgage_rate = value
  )

median_income <- median_income %>%
  rename(
    median_income = value
  )

cpi <- cpi %>%
  rename(
    cpi = value
  )

head(house_price)
head(mortgage_rate)
head(median_income)
head(cpi)

nrow(house_price)
nrow(mortgage_rate)
nrow(median_income)
nrow(cpi)

range(house_price$date)
range(mortgage_rate$date)
range(median_income$date)
range(cpi$date)

write.csv(
  house_price,
  "data/raw_data/house_price_raw.csv",
  row.names = FALSE
)

write.csv(
  mortgage_rate,
  "data/raw_data/mortgage_rate_raw.csv",
  row.names = FALSE
)

write.csv(
  median_income,
  "data/raw_data/median_income_raw.csv",
  row.names = FALSE
)

write.csv(
  cpi,
  "data/raw_data/cpi_raw.csv",
  row.names = FALSE
)