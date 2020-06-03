emission_data <- read.csv("data/fossil-fuel-co2-emissions-by-nation.csv")

year_range <- range(emission_data$Year)

year_input <- sliderInput(
  inputId = "year_choice",
  label = "Year",
  min = year_range[1],
  max = year_range[2],
  value = year_range,
  width = 250
)


feature_input <- fluidPage(

  radioButtons("feature", label = h3("Emission Type"),
                              choices = list("Total" = "Total",
                                             "Liquid Fuel" = "Liquid.Fuel",
                                             "Gas Fuel" = "Gas.Fuel",
                                             "Solid Fuel" = "Solid.Fuel"),
                              selected = "Total"),

)



page4 <- tabPanel(
  "Fossil Fuel Change of Top Five Countries",


  fluidPage(

    headerPanel("Fossil Fuel Change of Top Five Countries"),
    p(
      "The purpose of this chart is to observe the change over time of
      various types of Carbon Dioxide emmissions based on the nations that
      contributed most to that polution. The years can be changed to see
      these changed at a closer point of view as well as to predict what
      could have contributed to the changes."
    ),

    year_input,

    feature_input,

    plotlyOutput("plot")
  )
)

