library(shiny)
library(leaflet)
library(tidyverse)
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
    serView(lng=37.0902, lat = 40.730610, zoom=10)
  m
  })
  }

