library(shiny)
library(shinydashboard)

Allflights <- readRDS(file = "all_flights.Rdata")

dashboardPage(
  dashboardHeader(title = "Flight Status Predictor"),
  dashboardSidebar(
    sidebarMenuOutput("Menu")
  ),
  dashboardBody()
)









