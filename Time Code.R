library(tidyverse)
library(lubridate)

loadRDS(file = "airplane date")

make_datetime()
make_date()


ui <- fluidPage(
  
  titlePanel("Airplane Flight Predictor"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Departure Time:",
                  min = 0000,
                  max = 2400,
                  value = 0000
      ),
      numericInput("time", "Departure Time", NA, min = 0, max = 2400)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)
