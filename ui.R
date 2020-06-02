library("plotly")
library("ggplot2")
library("dplyr")
library("tidyr")

source("page1.R")
source("page2.R")
source("page3.R")
source("page4.R")
source("page5i.R")

ui <- navbarPage("Climate Change",
  page_one,
  page2,
  page_three,
  page4)
