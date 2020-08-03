
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Visualize Many Models"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h3("slope"),
            textOutput("slopeOut"),
            h3("Intercept"),
            textOutput("inOut"),
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot1",brush = brushOpts(
                id="brush1"
            ))
        )
    )
))
