library(shiny)
library(shinydashboard)
library(leaflet)
library(DT)




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
                textInput("origin", "Origin (Airport):"),
            ##  actionButton('obutton', 'Submit', class = 'btn-outline-primary', type = 'submit'),
                textInput("destination", "Destination (Airport):"),
                dateInput("date", "Flight Date:", format = "mm/dd/yy"),
                selectInput('Airline', 'Airline', c("Commutair Aka Champlain Enterprises, Inc.",
                                                    "GoJet Airlines, LLC d/b/a United Express",
                                                    "Air Wisconsin Airlines Corp", "Mesa Airlines Inc.",
                                                    "Southwest Airlines Co.", 
                                                    "Republic Airlines",
                                                    "Endeavor Air Inc.", 
                                                    "American Airlines Inc.",
                                                    "Capital Cargo International",
                                                    "SkyWest Airlines Inc.",
                                                    "Alaska Airlines Inc.", 
                                                    "JetBlue Airways", 
                                                    "Delta Air Lines Inc.",
                                                    "Frontier Airlines Inc.",
                                                    "Allegiant Air",                            
                                                    "Hawaiian Airlines Inc.",
                                                    "Envoy Air", 
                                                    "Spirit Air Lines",
                                                    "Comair Inc.", 
                                                    "Horizon Air",                              
                                                    "United Air Lines Inc.",
                                                    "ExpressJet Airlines Inc.",
                                                    "Empire Airlines Inc.",
                                                    "Trans States Airlines",
                                                    "Cape Air",                                 
                                                    "Compass Airlines", 
                                                    "Virgin America", 
                                                    "Peninsula Airways Inc."))
                            
                #read text input and create output as variable to be passed along to server function
              )
              
            )
              ),
      

      tabItem(tabName = "data",
              fluidPage(
                h2("Data"),
                box(
                  dataTableOutput("table"))
               
                      )
              ), 
      tabItem(tabName = "map",
              h2("Map of Airports"), 
              fluidPage(
                leafletOutput("mymap")
              )
      ), 
      tabItem(tabName = "about",
              h2("About our Project")
              )
    )
              
            ),
    
)

  
  
  
  
  
  
  










