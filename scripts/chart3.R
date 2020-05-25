line_plot <- function(emission_data) {
  #find countries with largest overall combined totals
  max <- emission_data %>%
    group_by(Country) %>%
    summarize(tot = sum(Total)) %>%
    arrange(-tot) %>%
    select(Country) 
  
  #filter out data for countries of top five largest fossil fuel totals
  us_change <- filter(emission_data, Country == "UNITED STATES OF AMERICA")
  uk_change <- filter(emission_data, Country == "UNITED KINGDOM")
  ussr_change <- filter(emission_data, Country == "USSR")
  china_change <- filter(emission_data, Country == "CHINA (MAINLAND)")
  japan_change <- filter(emission_data, Country == "JAPAN")
  
  #combine all individual data together
  top_five <- full_join(us_change, uk_change)
  top_five <- full_join(top_five, ussr_change)
  top_five <- full_join(top_five, china_change)
  top_five <- full_join(top_five, japan_change)
  
  #create plot itself
  plot <- ggplot(data = top_five) +
    geom_smooth(mapping = aes(x = Year, y = Total, color = Country)) +
    ggtitle("Total Fossil Fuel Change of Top Five Countries")
  
  return(plot)
}
