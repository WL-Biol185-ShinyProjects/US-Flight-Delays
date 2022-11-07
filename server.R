library(shiny)
library(leaflet)
library(tidyverse)
library(lubridate)
flights <- readRDS("all_flights_clean.Rdata")

function(input, output) {
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
  O <- (output$value <- renderText({ input$origin }))
  D <- (output$value <- renderText({ input$destination }))
  A <- (output$value <- renderText({ input$airline }))
  dates <- yday(output$value <- renderText({ input$date }))
<<<<<<< HEAD

=======
  flights$year_day <- yday(flights$FlightDate)  
  flights %>%
    group_by(year_day, Airline, Origin, Dest) %>%
    select(c(O, D, A, dates))
  summarise(ave_delay = mean(DepDelayMinutes, na.rm = TRUE)) %>%
    ggplot(aes(input$date, ave_delay)) +
    geom_point()
>>>>>>> 4fcdc1cd81d78f0d4cf92140502df4f36c2467bf
  }

