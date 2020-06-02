side_panel <- sidebarPanel(
  sliderInput(
    inputId = "year_graph",
    label = h5("select the desired year"),
    min = 1751,
    max = 2014,
    value = c(1900),
    step = 1,
  ),
  textOutput(outputId = "message")
)

main_panel <- mainPanel(
  plotlyOutput(outputId = "stackedplotly")
)


page_three <- tabPanel(
  "Breakdown Emissions",
  headerPanel("Breakdown Emissions"),
  p(
    "The purpose of this chart is to look at a breakdown of each carbon emitting
    source in relation to the total for the top 10 carbon emitting countries in the
    year of your choosing (1751-2014)"
  ),
  sidebarLayout(
    side_panel,
    main_panel
  )
)
