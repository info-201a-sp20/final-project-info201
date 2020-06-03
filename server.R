library("plotly")
library("ggplot2")
library("dplyr")
library("tidyr")

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

    amount <- last_50_years[[input$selected_fuel]]
    fuel_plot <- ggplot(data = last_50_years) +
      geom_line(mapping = aes(x = Year, y = amount), color = "dark red") +
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
    paste("The chosen year was", input$year_graph)
  })

  output$stackedplotly <- renderPlotly({
    #data for top 10 emitting countries in desired
    data_filtered <- emission_data %>%
      filter(Year == input$year_graph) %>%
      arrange(-Total) %>%
      slice(1:10)

    #prepare the data to be able to place into a stacked chart
    gather_data <- data_filtered %>%
      select(Country, Solid.Fuel, Liquid.Fuel, Gas.Fuel,
             Cement, Gas.Flaring) %>%
      gather(key = Carbon_Emission, value = Amount, -Country)

    #create a stacked bar chart based off emission type of top
    #10 emitting countries
    stacked_graph <- ggplot(data = gather_data) +
      geom_col(mapping = aes(x = Country, y = Amount, fill = Carbon_Emission)) +
      xlab("Country") +
      ylab("Million metric tons of C") +
      ggtitle(paste("Top 10 CO2 Emitting Countries in", input$year_graph)) +
      coord_flip() +
      scale_fill_discrete(name = "Carbon Emission Source",
                          labels = c("Cement", "Gas Flaring",
                                     "Gas Fuel", "Liquid Fuel", "Solid Fuel"))
    ggplotly(stacked_graph)
    return(stacked_graph)
  })

  output$plot <- renderPlotly({

    plot_data <- emission_data %>%
      filter(Year > input$year_choice[1], Year < input$year_choice[2])

    max <- emission_data %>%
      group_by(Country) %>%
      summarise(Total = sum(Total),
                Solid.Fuel = sum(Solid.Fuel),
                Liquid.Fuel = sum(Liquid.Fuel),
                Gas.Fuel = sum(Gas.Fuel)) %>%
      select(Country)

    #filter out data for countries of top five largest fossil fuel totals
    us_change <- filter(plot_data, Country == "UNITED STATES OF AMERICA")
    uk_change <- filter(plot_data, Country == "UNITED KINGDOM")
    ussr_change <- filter(plot_data, Country == "USSR")
    china_change <- filter(plot_data, Country == "CHINA (MAINLAND)")
    japan_change <- filter(plot_data, Country == "JAPAN")

    #combine all individual data together
    top_five <- full_join(us_change, uk_change)
    top_five <- full_join(top_five, ussr_change)
    top_five <- full_join(top_five, china_change)
    top_five <- full_join(top_five, japan_change)


    #create plot itself
    amount <- top_five[[input$feature]]
    p <- ggplot(data = top_five) +
      ggtitle("Fossil Fuel Change of Top Five Countries") +
      geom_smooth(mapping = aes(x = Year, y = amount, color = Country))

    ggplotly(p)

    return(p)
  })

  output$table <- renderTable({
    emissions <- emission_data %>%
      group_by(Country) %>%
      summarize(total_emission = sum(Total)) %>%
      top_n(10) %>%
      arrange(-total_emission)

    colnames(emissions) <- c("Country",
                             "Total Emissions (Million Metric Tons of C)")
    emissions
  })

  output$year_plot <- renderPlot({
    last_50_years <- emission_data %>%
      group_by(Year) %>%
      summarise(total = sum(Total)) %>%
      top_n(5, Year) %>%
      arrange(Year)

    chart <- ggplot(last_50_years) +
      geom_col(mapping = aes(x = Year, y = total), fill = "dark red") +
      labs(
        title = "Total Fossil Fuel CO2 Emission Over 5 Years (2010-2014)",
        x = "Year",
        y = "Total Amount of Fossil Fuel CO2 Emission",
        legend = FALSE
      )
    return(chart)
  })

  output$country_plot <- renderPlot({
    data_2014 <- emission_data %>%
      filter(Year == 2014) %>%
      arrange(-Total) %>%
      slice(1:10)

    #prepare the data to be able to place into a stacked chart
    gather_data <- data_2014 %>%
      select(Country, Solid.Fuel, Liquid.Fuel, Gas.Fuel,
             Cement, Gas.Flaring) %>%
      gather(key = carbon_emissions, value = type, -Country)

    #create a stacked bar chart based off emission type
    #of top 10 emitting countries
    stacked_graph <- ggplot(data = gather_data) +
      geom_col(mapping = aes(x = Country, y = type, fill = carbon_emissions)) +
      xlab("Country") +
      ylab("Million metric tons of C") +
      ggtitle("Top 10 CO2 Emitting Countries in 2014") +
      coord_flip() +
      scale_fill_discrete(name = "Carbon Emission Source",
                          labels = c("Cement", "Gas Flaring",
                                     "Gas Fuel", "Liquid Fuel", "Solid Fuel"))
    return(stacked_graph)
  })
}