emission_data <- read.csv("data/fossil-fuel-co2-emissions-by-nation.csv")

page2 <- tabPanel(
  "Total Emission Over Last 50 Years",
  titlePanel("Total Emission Over Last 50 Years"),

  sidebarLayout(
    sidebarPanel(

      selectInput(
        inputId = "selected_fuel",
        choices = c("Total", "Solid.Fuel", "Liquid.Fuel", "Gas.Fuel"),
        label = h3("Choose Fuel Type")
      )
    ),

    mainPanel(
      plotlyOutput(outputId = "line_graph")
    )
  )
)