page_one <- tabPanel(
  "Overview",
  headerPanel(strong("Overview")),

  sidebarLayout(
    sidebarPanel(
      img("",
        src = paste0(
          "https://www.irishtimes.com/polopoly_fs/1.3923036.1560365484!",
          "/image/image.jpg_gen/derivatives/ratio_1x1_w1200/image.jpg"
        ),
        height = "100%", width = "100%"
      )
    ),
    mainPanel(
      p("Climate change has been a popular and important topic of
      discussion amongst people for several years now. Numerous scientists
      have gathered vast amounts of data to dicover trends in climate change
      over the decades. This project attempts to gather data from the last
      several centuries regarding fossil fuel carbon dioxide emission. This
      is very important, especially in the current day, because it will
      allow people to understand the effect of climate change and start
      taking preventive measures. Our [dataset]
      (https://datahub.io/core/co2-fossil-by-nation) contains data from
      the Carbon Dioxide Information Analysis Center (CDIAC) for numerous
      countries from 1751 to 2014."),
      h3("Questions to Answer"),
      h4(em("Is there a significant increase in CO2 emissions in the
      atmosphere in the last 50 years? What impacts these emissions
      the most?")),
      h5("Analysis of various carbon emission sources over the last 50 years can
               address this question."),
      h4(em("What countries are impacted? Are some countries impacted more
            than others?")),
      h5("To answer this question, we can assess the top countries that
               emit the most fossil fuels in a specific year."),
      h4(em("How much of a change is present between the top fossil fuel
            emitting countries?")),
      h5("In order to address this question, we can plot the top fossil fuel
      emitting countries and analyze the change in their emission total.")
    )
  )
)
