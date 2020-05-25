bar_data <- function(emission_data) {
   liquid_fuel <- emission_data %>%
     group_by(Country) %>%
     summarize(total_fuel = sum(Solid.Fuel)) %>%
     top_n(10)

   bar_chart <- ggplot(liquid_fuel) +
      geom_bar(mapping = aes(x = Country, fill = Solid.Fuel),
               color = "dark blue") +
      labs(
        title = "Total Fossil Fuels CO2 Emissions By Solid Fuels",
        X = "Country",
        Y = "Total Solid Fuel",
        legend = FALSE
      )
    return(bar_chart)
 }
