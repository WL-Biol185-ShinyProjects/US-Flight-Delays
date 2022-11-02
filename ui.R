library(shiny)
library(shinydashboard)






dashboardPage(
  dashboardHeader(title = "Flight Status Predictor"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Flight Time Predictor", tabName = "predictor"),
      menuItem("Data", tabName = "data")
                )
  ),
    
  dashboardBody(
    tabItems(
      tabItem(tabName = "predictor",
            h2("Flight Time Predictor")
              ),

      tabItem(tabName = "data",
              h2("Data")
              )
            ),
    fluidRow(
    box(plotOutput("plot1")), #plot of predicted delays 
    
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








