library(shiny)
library(leaflet)
library(tidyverse)
library(lubridate)
library(scales)
flights <- readRDS("flights_clean_abbreviated.RDS")
flights_noyd <- readRDS("flights_clean_noyd.Rdata")
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
             year_day <= (yday(input$date) + 10),
             year_day >= yday((input$date) - 10)) %>%
      group_by(year_day) %>%
      summarise(ave_delay = mean(DepDelayMinutes, na.rm = TRUE)) %>%
      ggplot(aes(year_day, ave_delay)) +
      labs(y = "Departure Delay", x = "Flight Date") +
      xlim(input$date - 10, input$date + 10) +
      geom_boxplot()
      
  })
  
    output$plot2 <- renderPlot( {
      flights %>%
        filter(Airline == input$Airline, 
               Origin == input$origin, 
               Dest == input$destination,
               year_day == yday(input$date)) %>%
        group_by(year_day) %>%
        summarise(ave_delay = mean(DepDelayMinutes, na.rm = TRUE)) %>%
        ggplot(aes(flights$Airline, ave_delay)) +
        labs(y = "Airline", x = "Flight Date") +
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
  
  output$table <- renderDataTable(
    datatable(
      {flights_noyd}, 
      filter = "top", 
      option = list(dom = 'ltipr'),
      caption = ("Flight data from 2018, 2020, and 2022")
    )
  )
 
  }

