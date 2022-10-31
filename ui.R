library(shiny)
library(shinydashboard)


dashboardPage(
  dashboardHeader(title = "Flight Status Predictor"),
  dashboardSidebar(
    sidebarMenuOutput("Menu")
  ),
  dashboardBody(  
    fluidRow(
    box(plotOutput("plot1")),
    
    box(
      "Flight Time Delay Status", br(), "Based on Yearly Data from 2018, 2020, 2022",
      sliderInput("slider", "Departure Time:", 1, 2400, 1200),
      textInput("text", "Flight Status:")
      )
)
)
)








