top_ten_countries <- function(emission_data) {
  emissions <- emission_data %>%
    group_by(Country) %>%
    summarize(total_emission = sum(Total)) %>%
    top_n(10) %>% arrange(-total_emission)

  aggregate_table <- plot_ly(
    type = "table",
    columnwidth = c(1, 1),
    columnorder = c(0, 1),
    header = list(
      values = c("Country", "Total Number of Emissions"),
      align = c("center", "center"),
      line = list(width = 1, color = "black"),
      fill = list(color = "rgb(27, 48, 149)"),
      font = list(family = "Arial", size = 14, color = "white")
    ),
    cells = list(
      values = rbind(emissions$Country, emissions$total_emission),
      align = c("center", "center"),
      line = list(color = "black", width = 1),
      font = list(family = "Arial", size = 14, color = c("black"))
    )
  )
  return(aggregate_table)
}