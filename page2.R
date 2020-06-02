page2 <- tabPanel(
  "Fossil Fuel Emission Over Last 50 Years",
  headerPanel("Fossil Fuel Emission Over Last 50 Years"),

  sidebarLayout(
    sidebarPanel(

      selectInput(
        inputId = "selected_fuel",
        choices = c("Total", "Solid.Fuel", "Liquid.Fuel", "Gas.Fuel"),
        label = h3("Choose Fuel Type")
      )
    ),

    mainPanel(
      plotlyOutput(outputId = "line_graph"),

      h3("Chart Description"),
      p("This chart displays information about fossil fuel emission",
        "over the last 50 years (1964-2014). It shows the trends for",
        "each of the individual fuel types (solid, liquid, and gas)",
        "as well as for the total fossil fuel emissions. This demonstrates",
        "how emissions may have increased, specifically over the last 50",
        "years, as well as which types of fuel had the greatest impact.",
        "Overall, the chart answers questions regarding how climate",
        "change has been impacted in recent times by quantifying the idea",
        "through specific fossil fuel emission data visualizations and",
        "widgets. It displays which types of fuel had the greatest impact",
        "and which types had the least impact over the last 50 years.",
        "These results can be used to take the necessary measures to reduce",
        "emissions of the fuel types that have been impacting the environment",
        "most and, ultimately, the effect of climate change."
      )

    )
  )
)