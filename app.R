library("shiny")
library("plotly")
library("ggplot2")
library("dplyr")
library("tidyr")

source("ui.R")
source("server.R")

shinyApp(ui = ui, server = server)
