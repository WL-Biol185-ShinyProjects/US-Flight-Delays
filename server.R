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
    setView(lng=-95.15, lat =40 , zoom=3.5)
  m
  })
  }

