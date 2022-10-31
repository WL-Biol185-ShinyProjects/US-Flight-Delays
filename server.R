library(shiny)
flights <- readRDS("all_flights_clean.Rdata")

function(input, output) {
  output$menu <- renderMenu({
    sidebarMenu(
      menuItem("Menu item", icon = icon("calendar"))
    )
  })
}