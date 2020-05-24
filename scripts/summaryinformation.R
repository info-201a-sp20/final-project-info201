rm(list = ls())

get_summary_info <- function(emission_data) {
  country_with_most_emissions <- emission_data %>%
    group_by(Country) %>%
    summarize(total_impact = sum(Total)) %>%
    filter(total_impact == max(total_impact)) %>%
    pull(Country)
  
  year_with_most_emissions <- emission_data %>%
    group_by(Year) %>%
    summarize(total_impact = sum(Total)) %>%
    filter(total_impact == max(total_impact)) %>%
    pull(Year)
  
  most_emissions_per_capita <- emission_data %>%
    group_by(Country) %>%
    summarize(total_capita = sum(Per.Capita)) %>%
    filter(total_capita == max(total_capita)) %>%
    pull(Country)
  
  year_most_emissions_per_capita <- emission_data %>%
    group_by(Year) %>%
    summarize(total_capita = sum(Per.Capita)) %>%
    filter(total_capita == max(total_capita)) %>%
    pull(Year)
  
  country_with_least_emissions <- emission_data %>%
    group_by(Country) %>%
    summarize(total_impact = sum(Total)) %>%
    filter(total_impact == min(total_impact)) %>%
    pull(Country)
  
  year_with_least_emissions <- emission_data %>%
    group_by(Year) %>%
    summarize(total_impact = sum(Total)) %>%
    filter(total_impact == min(total_impact)) %>%
    pull(Year)
  
  list <- c(country_with_most_emissions,
            year_with_most_emissions,
            most_emissions_per_capita,
            year_most_emissions_per_capita,
            country_with_least_emissions,
            year_with_least_emissions)
  list
}