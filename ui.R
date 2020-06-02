source("page1.R")
source("page2.R")
source("page3.R")
source("page4.R")
source("page5i.R")

ui <- fluidPage(navbarPage(
  page_one,
  page2,
  page_three,
  page4,
  page5
))
