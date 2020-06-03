library("plotly")
library("ggplot2")
library("dplyr")
library("tidyr")

ui <- fluidPage(navbarPage(
  includeCSS("style.css"),
  page_one,
  page2,
  page_three,
  page4,
  page5))
