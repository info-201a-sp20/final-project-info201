line_graph <- function(emission_data) {
  last_50_years <- emission_data %>%
    group_by(Year) %>%
    summarise(total = sum(Total)) %>%
    top_n(50, Year) %>%
    arrange(Year)

  chart <- ggplot(last_50_years) +
    geom_line(mapping = aes(x = Year, y = total), color = "dark red") +
    labs(
      title = "Total Fossil Fuel CO2 Emission Over 50 Years (1964-2014)",
      x = "Year",
      y = "Total Amount of Fossil Fuel CO2 Emission",
      legend = FALSE
    )
  return(chart)
}
