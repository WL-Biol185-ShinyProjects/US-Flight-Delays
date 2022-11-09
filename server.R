library(shiny)
library(leaflet)
library(tidyverse)
library(lubridate)
flights <- readRDS("all_flights_clean.Rdata")
flights2 <- flights[-c(17:37)]
flights2 <- flights2[-c(11:16)]
flights2 <- flights2[-c(5:8)]
flights2$FlightDate<-as.Date(flights2$FlightDate, format = "%m/%d/%Y")
flights2$year_day <- yday(flights2$FlightDate)

function(input, output) {
  
 ## O <- (output$value <- renderText({ input$origin }))
 ## O <- as.character(O)
 ## D <- (output$value <- renderText({ input$destination }))
 ## D <- as.character(D)
 ## A <- (output$value <- renderText({ input$airline }))
 ## A <- as.character(A)
 ## dates <- yday(output$value <- renderText({ input$date }))
  
  
  output$plot1 <- renderPlot( {
    flights2 %>%
      filter(Airline == input$airline, Origin == input$origin, Dest == input$destination, year_day == yday(input$date)) %>%
      group_by(year_day, Airline, Origin, Dest) %>%
      summarise(ave_delay = mean(DepDelayMinutes, na.rm = TRUE)) %>%
      ggplot(aes(year_day, ave_delay)) +
      geom_point()
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
 
  }

