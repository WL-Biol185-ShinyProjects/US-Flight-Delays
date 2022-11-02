library(shiny)
library(shinydashboard)






dashboardPage(
  dashboardHeader(title = "Flight Status Predictor"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Flight Time Predictor", tabName = "predictor"),
      menuItem("Data", tabName = "data"),
      menuItem("Map of Airports", tabName = "map"),
      menuItem("About", tabName = "about")
                )
  ),
    
  dashboardBody(
    tabItems(
      tabItem(tabName = "predictor",
            h2("Flight Time Predictor"),
            fluidRow(
              tabBox(
                title = "Output",
                # The id lets us use input$tabset1 on the server to find the current tab
                id = "tabset1", height = "250px",
                tabPanel("Dates", "Your flight vs. Other Dates", plotOutput("plot1")),
                tabPanel("Airlines", "Your flight vs. Other Airlines", plotOutput('plot2'))
              ),
              
              box(
                "Flight Time Delay Status", br(), "Based on Yearly Data from 2018, 2020, 2022",
                textInput("text", "Departure Time:"),
                textInput("text", "Arrival Time:"),
                textInput("text", "Origin (Airport):"),
                textInput("text", "Destination (Airport):"),
                textInput("text", "Airline:"),
                textInput("text", "Flight Date:"),
              )
            )
              ),
      

      tabItem(tabName = "data",
              h2("Data")
              ), 
      tabItem(tabName = "map",
              h2("Map of Airports"), 
      ), 
      tabItem(tabName = "about",
              h2("About our Project")
              )
    )
              
            ),
    
)











