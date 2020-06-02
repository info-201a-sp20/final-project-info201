page5 <- tabPanel(
  "Conclusion",
  headerPanel(strong("Conclusion")),
  sidebarLayout(
  sidebarPanel(
    p("Concluding Statements")
  ), 
  mainPanel(
    p("As seen through the various charts in the proceeding tabs, fossil fuel carbon emissions have been 
      a rising and stagnant issue for years. Starting from the effects of the industrial revolution, 
      the effects of fossil fuel emissions have worsened and increased throughout the years. One notable
      insight that we gained through this project was regarding the top ten countries in terms of the amount
      of fossil fuels that they emit since 1751. The following table lists these countries in order along with
      their total emission amounts:"),
    
    tableOutput(
      outputId = "table"
    ),
    
  
    p("This table was included to display the total number of fossil fuel carbon dioxide emissions for
    the top 10 countries that emitted the most between 1751 and 2014. This reveals the countries that
    have contributed the most to climate change through their emission of fossil fuel CO2 over the last
    several centuries. It also shows the exact number of emissions for each of these countries. This summary
    table proves exactly which countries need to reduce their fossil fuel carbon dioxide emissions comparative
    to one another. This allows us to also visualize these numbers in a smaller sample size. The countries that
    fit this top 10 list are world leaders in terms of their economies, businesses, etc. Therefore, it makes
    more sense to compare them to one another rather than every other world country, which this table satisfies.
    According to the table, the United States of America emit the most amount of fossil fuel CO2 in the world,
    which we can now use to make improvements."),
    
    p("Another notable insight that we gained through this project was the drastic increase in fossil
      fuel carbon dioxide emissions in the last 5 years specifically. The overall emissions increased
      by 604,809, a number only projected to continue to increase in the following years. The following
      bar chart shows this increase:"),

    plotOutput(
      outputId = "year_plot"
    ),

    p("This chart demonstrates how climate change has steadily increased even in as little time as the
      last 5 years. This information can be used to predict how these numbers will continue to increase
      in the future years. The last 5 years is also the most current data, which is a good predictor of the 
      current climate in the world. This can serve as an indicator for the amount of work that needs to be done
      to mitigate the effects of climate change. This also serves as a warning for the world to start making 
      efforts to reduce their fossil fuel emissions as a way of avoiding climate change as much as possible."),
    
    p("The final notable insight that we gained through this project was regarding the top 10 countries
      in terms of the amount of fossil fuel carbon dioxide they emitted in the year 2014 alone. The following
      chart looks at a breakdown of each carbon emitting source in relation to the total for the top 10 carbon
      emitting countries in the most recent year available, which happens to be 2014 for this dataset:"),
    
    plotOutput(
      outputId = "country_plot"
    ),
    
    p("Through our analysis it has been apparent that the biggest contributing fuel to carbon emissions
       in the top ten emitting countries in 2014 has been solid fuel. This being the most up to date information
       about the fuel that contributes the most to carbon emissions confirms that to change these patterns this
       is the fuel that needs to be targeted as it is seen through the most recent data. Of these top ten countries,
       China, the United States, and India tend to be the highest at using solid fuels to emit carbon into the
       atmosphere. This could be due to the fact that both India, China, and US are highly populated countries
       that need a large supply of fuel to meet the need, therefore they have resided to the most easy to access
       and least expensive source of fossil fuel. Of these top ten countries emitting the most carbon, the top
       five countries that have the highest rate of total change in fossil fuel use continue to be China and
       the United States. This essentially indicates that these two countries emit the highest carbon without
       changing for years, whereas India has changed throughout the years. This information ultiamtely shows
       which types of fuel are having the greatest impact on climate change in each of the top 10 countries.
       This serves as an indication for what types of fuel emissions specifically need to be reduced by which
       exact countries in order to best avoid climate change."),
 )
)
)




  
