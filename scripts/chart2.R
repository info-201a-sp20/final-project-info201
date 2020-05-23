library("ggplot2")
library("dplyr")
library("tidyr")

emission_data <- read.csv("data/fossil-fuel-co2-emissions-by-nation.csv")

data_2014 <- emission_data %>%
  filter(Year == 2014) %>%
  arrange(-Total) %>%
  slice(1:10)

gather_data <- data_2014 %>%
  select(Country, Solid.Fuel, Liquid.Fuel, Gas.Fuel, Cement, Gas.Flaring) %>%
  gather(key = carbon_emissions, value = type, -Country)

stacked_graph <- ggplot(data = gather_data) +
  geom_col(mapping = aes(x = Country, y = type, fill = carbon_emissions)) +
  xlab("Country") +
  ylab("Million metric tons of C") +
  ggtitle("Top 10 CO2 Emitting Countries in 2014") +
  coord_flip() +
  scale_fill_discrete(name = "Carbon Emission",
                     labels = c("Cement", "Gas Flaring",
                                "Gas Fuel", "Liquid Fuel", "Solid Fuel"))


  