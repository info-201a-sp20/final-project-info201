rm(list = ls())
#import libraries
library("ggplot2")
library("dplyr")
library("lintr")
lint("scripts/chart1.R")

fossil_fuel_emission <- read.csv("data/fossil-fuel-co2-emissions-by-nation.csv")

last_50_years <- fossil_fuel_emission %>%
  group_by(Year) %>%
  summarise(total = sum(Total)) %>%
  top_n(50, Year) %>%
  arrange(Year)
    

ggplot(last_50_years) +
  geom_line(mapping = aes(x = Year, y = total), color = "dark red") +
  labs(
    title = "Total Fossil Fuel CO2 Emission Over 50 Years (1964-2014)",
    x = "Year",
    y = "Total Amount of Fossil Fuel CO2 Emission",
    legend = FALSE
  )
