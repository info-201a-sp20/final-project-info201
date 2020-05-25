emission_data <- read.csv("data/fossil-fuel-co2-emissions-by-nation.csv")
library("dplyr")
library("ggplot2")
library("plotly")
library(lintr)
library(leaflet)

 top_ten_countries <- function (emission_data) {
   emission_data <- emission_data %>% 
     group_by(Country) %>%
     summarize(total_emission = sum(Total)) %>%
     top_n(10)
 
aggreagted_table <- plot_ly (
  type ='table', 
  columnwidth = c(1,1), 
  columnorder = c(0, 1),
  header = list(
    values = c("Country","Total Number of Emissions"),
    align = c("center", "center"),
    line = list(width = 1, color = 'black'),
    fill = list(color = 'rgb(27, 48, 149)'),
    font = list(family = "Arial", size = 14, color = "white")
  ), 
  cells = list(
    values = rbind(emission_data$Country, emission_data$total_emission),
    align = c("center", "center"),
    line = list(color = "black", width = 1),
    font = list(family = "Arial", size = 14, color = c("black"))
  )
)
return(aggreagted_table)
 }
 