library(shiny)
library("dplyr")

ui <- fluidPage(
  titlePanel("Climate Change"),
  
  sidebarLayout(
    sidebarPanel(
      img("Fossil Fuel Emissions", 
          src = "https://s.w-x.co/util/image/w/GettyImages-1130554431.jpg?v=at&w=485&h=273")
    ),
    mainPanel(
      p("Climate change has been a popular and important topic of discussion amongst people for several years now. 
        Numerous scientists have gathered vast amounts of data to dicover trends in climate change over the decades. 
        This project attempts to gather data from the last several centuries regarding fossil fuel carbon dioxide emission. 
        This is very important, especially in the current day, because it will allow people to understand the effect of climate change and start taking preventive measures. 
        Our [dataset](https://datahub.io/core/co2-fossil-by-nation) contains data from the Carbon Dioxide Information Analysis 
        Center (CDIAC) for numerous countries from 1751 to 2014.")
    )
  )
  
  
)