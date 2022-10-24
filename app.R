library(shiny)


ui <- fluidPage(

    titlePanel("Airplane Flight Predictor"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Departure Time:",
                        min = 0000,
                        max = 2400,
                        value = 0000
                         ),
            numericInput("time", "Departure Time", NA, min = 0, max = 2400)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)




# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}


shinyApp(ui = ui, server = server)
