library("shiny")
library("plotly")
library("ggplot2")
library("dplyr")
library("tidyr")

source("page2_server.R")
source("page3_server.R")
source("page4_server.R")
source("ui.R")
source("server.R")

shinyApp(ui = ui, server = server)

