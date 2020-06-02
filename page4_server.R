server <- function(input, output) {

  emission_data <- read.csv("data/fossil-fuel-co2-emissions-by-nation.csv")

  output$plot <- renderPlot({

    plot_data <- emission_data %>%
      filter(Year > input$year_choice[1], Year < input$year_choice[2])

    max <- emission_data %>%
      group_by(Country) %>%
      summarize(tot = sum(Total)) %>%
      arrange(-tot) %>%
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
    p <- ggplot(data = top_five) +
      geom_smooth(mapping = aes(x = Year, y = Total, color = Country))

    return(p)
  })
}
