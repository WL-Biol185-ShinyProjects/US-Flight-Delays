library(shiny)
library(leaflet)
library(tidyverse)
library(lubridate)
library(scales)
flights_noyd <- readRDS("flights_clean_noyd.Rdata")
flights_DT <- readRDS("flights_DT.Rdata")
airports <- readRDS("usairports.Rdata")

function(input, output) {

  loaded_flights <- reactive({
    
    table_to_load <- input$year 
    readRDS(table_to_load)
    
  })
  
  output$plot1 <- renderPlot( {
    loaded_flights() %>%
      
  selected_info <- filter( 
             loaded_flights()$flights$Airline == input$Airline, 
             loaded_flights()$Origin == input$origin, 
             loaded_flights()$Dest == input$destination,
             between(loaded_flights()$FlightDate,
                     left = input$date - 5, 
                     right = input$date + 5) ) %>%
      group_by(year_day) %>%
      summarise(ave_delay = mean(DepDelayMinutes, na.rm = TRUE))
  
      ggplot(selected_info,
             aes(selected_info$FlightDate, 
          selected_info$ave_delay) +
      labs(y = "Departure Delay", 
           x = "Flight Date") +
      geom_point()
      )
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
  m <- leaflet () %>%
    addTiles() %>%
    setView(lng=-95.15, lat =40 , zoom=3.5)
  m
  })
  
  output$table <- renderDataTable(
    datatable(
      loaded_flights(), 
      filter = "top", 
      option = list(dom = 'ltipr'),
      caption = ("Flight data from")
    )
  )
 
  }

