sidepanel <- sidebarPanel(
  selectInput(
    inputId = "country_choice",
    choices = c("UNITED STATES", "CHINA(MAINLAND)", "USSR", "UNITED KINGDOM", "JAPAN", "GERMANY", "INDIA", "RUSSIAN FEDERATION",
                "FRANCE(INCLUDING MONACO)", "CANADA"),
    label = h3("Choose A Country")
  ),
  textOutput(outputId = "summary_info_per_country")
)
mainPanel <- mainPanel(
  plotlyOutput(outputId = "summary_info_per_country")
)

page5 <- tabPanel(
  "Top Ten Countries With The Highest Emissions",
  titlePanel("Top Ten Countries With The Highest Emissions"),
  sidebarLayout(
    side_panel,
    main_panel
  )
)
