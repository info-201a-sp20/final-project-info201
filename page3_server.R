library(plotly)
library("ggplot2")
library("dplyr")
library("tidyr")

server <- function(input, output) {
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
}
