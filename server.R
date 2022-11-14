library(shiny)
library(leaflet)
library(tidyverse)
library(lubridate)
flights <- readRDS("flights_clean_abbreviated.RDS")
unique(flights$Airline)
airports <- readRDS("airport_information.Rdata")

function(input, output) {
  
 ## O <- (output$value <- renderText({ input$origin }))
 ## O <- as.character(O)
 ## D <- (output$value <- renderText({ input$destination }))
 ## D <- as.character(D)
 ## A <- (output$value <- renderText({ input$airline }))
 ## A <- as.character(A)
 ## dates <- yday(output$value <- renderText({ input$date }))
  
  
  output$plot1 <- renderPlot( {
    flights %>%
      filter(Airline == input$Airline, 
             Origin == input$origin, 
             Dest == input$destination,
             year_day == yday(input$date),
             Origin == input$origin,
             Dest == input$destination) %>%
      group_by(year_day, 
               Airline, 
               Origin, 
               Dest) %>%
      summarise(ave_delay = mean(DepDelayMinutes, na.rm = TRUE)) %>%
      ggplot(aes(Airline, ave_delay)) +
      labs(y = "Airline", x = "Flight Date")
      geom_bar()
  }
  )
  
  output$menu <- renderMenu({
    sidebarMenu(
      menuItem("Menu item", icon = icon("calendar"))
    )
  })
  output$mymap <- renderLeaflet ({
  m <- leaflet () %>%
    addTiles() %>%
    setView(lng=-95.15, lat =40 , zoom=3.5)
  m
  })
  
  output$table <- renderDataTable({flights2})
 
  }

