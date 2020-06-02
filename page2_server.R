source("page2.R")

server <- function(input, output) {
  output$line_graph <- renderPlotly({

    last_50_years <- emission_data %>%
      group_by(Year) %>%
      summarise(Total = sum(Total),
                Solid.Fuel = sum(Solid.Fuel),
                Liquid.Fuel = sum(Liquid.Fuel),
                Gas.Fuel = sum(Gas.Fuel)) %>%
      select(Year, input$selected_fuel) %>%
      top_n(50, Year) %>%
      arrange(Year)

    fuel_amount <- last_50_years[[input$selected_fuel]]
    fuel_plot <- ggplot(data = last_50_years) +
      geom_line(mapping = aes(x = Year, y = fuel_amount), color = "dark red") +
      labs(
        title = "Fossil Fuel CO2 Emission (1964-2014)",
        x = "Year",
        y = "Amount",
        legend = FALSE
      )
    ggplotly(fuel_plot)
    fuel_plot
  })
}