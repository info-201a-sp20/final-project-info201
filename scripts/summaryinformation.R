rm(list = ls())

get_summary_info <- function(emission_data) {
  list <- list()
  
  list$country_with_most_emissions <- emission_data %>%
    group_by(Country) %>%
    summarize(total_impact = sum(Total)) %>%
    filter(total_impact == max(total_impact)) %>%
    pull(Country)
  
  list$year_with_most_emissions <- emission_data %>%
    group_by(Year) %>%
    summarize(total_impact = sum(Total)) %>%
    filter(total_impact == max(total_impact)) %>%
    pull(Year)
  
  list$most_emissions_per_capita <- emission_data %>%
    group_by(Country) %>%
    summarize(total_capita = sum(Per.Capita)) %>%
    filter(total_capita == max(total_capita)) %>%
    pull(Country)
  
  list$year_most_emissions_per_capita <- emission_data %>%
    group_by(Year) %>%
    summarize(total_capita = sum(Per.Capita)) %>%
    filter(total_capita == max(total_capita)) %>%
    pull(Year)
  
  list$country_with_least_emissions <- emission_data %>%
    group_by(Country) %>%
    summarize(total_impact = sum(Total)) %>%
    filter(total_impact == min(total_impact)) %>%
    pull(Country)
  
  list$year_with_least_emissions <- emission_data %>%
    group_by(Year) %>%
    summarize(total_impact = sum(Total)) %>%
    filter(total_impact == min(total_impact)) %>%
    pull(Year)
  
  list
}