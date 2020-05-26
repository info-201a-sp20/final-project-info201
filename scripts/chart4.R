bar_data <- function(emission_data) {
   liquid_fuel <- emission_data %>%
     group_by(Country) %>%
     summarize(total_fuel = sum(Solid.Fuel)) %>%
     top_n(10)

   bar_chart <- ggplot(liquid_fuel) +
      geom_bar(mapping = aes(x = Country, fill = total_fuel),
               color = "dark blue") +
      labs(
        title = "Total Fossil Fuels CO2 Emissions By Solid Fuels",
        x = "Country",
        y = "Total Solid Fuel",
        fill = "",
        legend = FALSE
      )
    return(bar_chart)
 }
