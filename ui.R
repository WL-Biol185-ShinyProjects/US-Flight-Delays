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
      textInput("text", "Departure Time:"),
      textInput("text", "Arrival Time:"),
      textInput("text", "Origin (Airport):"),
      textInput("text", "Destination (Airport):"),
      textInput("text", "Airline:"),
      textInput("text", "Flight Date:"),
      textInput("text", "Flight Status:")
      )
)
)
)








