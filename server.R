library("plotly")
library("ggplot2")
library("dplyr")
library("tidyr")

source("page2_server.R")
source("page3_server.R")
source("page4_server.R")
source("page5_server.R")

emission_data <- read.csv("data/fossil-fuel-co2-emissions-by-nation.csv")

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
  
  output$message <- renderText({
    return_message <- paste("The chosen year was", input$year_graph)
  })
  
  output$stackedplotly <- renderPlotly({
    #data for top 10 emitting countries in desired
    data_filtered <- emission_data %>%
      filter(Year == input$year_graph) %>%
      arrange(-Total) %>%
      slice(1:10)
    
    #prepare the data to be able to place into a stacked chart
    gather_data <- data_filtered %>%
      select(Country, Solid.Fuel, Liquid.Fuel, Gas.Fuel, Cement, Gas.Flaring) %>%
      gather(key = Carbon_Emission, value = Amount, -Country)
    
    #create a stacked bar chart based off emission type of top 10 emitting countries
    stacked_graph <- ggplot(data = gather_data) +
      geom_col(mapping = aes(x = Country, y = Amount, fill = Carbon_Emission)) +
      xlab("Country") +
      ylab("Million metric tons of C") +
      ggtitle(paste("Top 10 CO2 Emitting Countries in", input$year_graph)) +
      coord_flip() +
      scale_fill_discrete(name = "Carbon Emission Source",
                          labels = c("Cement", "Gas Flaring",
                                     "Gas Fuel", "Liquid Fuel", "Solid Fuel"))
    final <- ggplotly(stacked_graph)
    return(stacked_graph)
  })
  
  output$summary_info_per_country <- renderPlotly({
    emissions <- emission_data %>%
      group_by(input$country_choice) %>%
      summarize(total_emission = sum(Total)) %>%
      top_n(10) %>% 
      arrange(-total_emission)
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
  })
}