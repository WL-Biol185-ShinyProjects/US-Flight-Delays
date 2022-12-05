library(shiny)
library(leaflet)
library(tidyverse)
library(lubridate)
library(scales)
library(ggplot2)
flights_noyd <- readRDS("flights_clean_noyd.Rdata")
flights_DT <- readRDS("flights_DT.Rdata")
airports <- readRDS("usairportspopups.Rdata")

function(input, output) {

  loaded_flights <- reactive({
    
    table_to_load <- input$year 
    readRDS(table_to_load)
    
  })
  
  output$plot1 <- renderPlot( {
    
loaded_flights() %>%
        filter(loaded_flights()$Airline == input$Airline, 
               loaded_flights()$Origin == input$origin, 
               loaded_flights()$Dest == input$destination,
               year_day >= yday(input$date)) %>%
      group_by(year_day) %>%
      summarise(ave_delay = mean(DepDelayMinutes, na.rm = TRUE)) %>%
      ggplot(aes(
        x = parse_date_time(x= year_day, order = "j"),
        y = ave_delay)) +
      labs(y = "Departure Delay", 
           x = "Flight Date") +
      geom_bar(stat = 'identity')
      
  })
  
 ##   output$plot2 <- renderPlot( {
 ##     loaded_flights() %>%
  ##      filter(Airline == input$Airline, 
   ##            Origin == input$origin, 
  ##             Dest == input$destination,
  ##             year_day == yday(input$date)) %>%
  ##      group_by(year_day) %>%
  ##      summarise(ave_delay = mean(DepDelayMinutes, na.rm = TRUE)) %>%
  ##      ggplot(aes(flights$Airline, ave_delay)) +
  ##      labs(y = "Airline", x = "Flight Date") +
  ##    geom_bar()
      
      

 ## }
##  )
  
  output$menu <- renderMenu({
    sidebarMenu(
      menuItem("Menu item", icon = icon("calendar"))
    )
  })
  output$mymap <- renderLeaflet ({
    leaflet(data = airports[1:17],) %>%
      setView(lng =-95.15, lat = 40, zoom = 3.5) %>%
      addTiles() %>%
      addMarkers(lng = ~Longitude, lat= ~Latitude, popup = airports$popups)
  })
  
  output$table <- renderDataTable(
    datatable(
      loaded_flights(), 
      filter = "top", 
      option = list(dom = 'ltipr'),
      caption = ("Flight data from")
    )
  )
  
  output$download <- downloadHandler(
    filename = function() {
      paste(input$year, '.csv', sep='')
    },
    content = function(file) {
      write.csv(loaded_flights(),file)
    },
    contentType = "text/csv"
  )
 
  }

