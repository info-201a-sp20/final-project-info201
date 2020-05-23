function(emission_data) {
  #data for top 10 emitting countries in 2014
  data_2014 <- emission_data %>%
    filter(Year == 2014) %>%
    arrange(-Total) %>%
    slice(1:10)

  #prepare the data to be able to place into a stacked chart
  gather_data <- data_2014 %>%
    select(Country, Solid.Fuel, Liquid.Fuel, Gas.Fuel, Cement, Gas.Flaring) %>%
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
}