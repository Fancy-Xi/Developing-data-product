
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Predicted Price for Diamonds"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            helpText("This app helps you to predict the price of a diamond based on its features."),
            h3(helpText("Select:")),
            numericInput("car", label = h4("Carats"), step = 0.01, value = 1.5),
            selectInput("clar", label = h4("Clarity"),
                        choices = list("Unknown" = "*", "I1"="I1", "SI2"="SI2","SI1"="SI1",
                                       "VS1"="VS1","VS2"="VS2","VVS1"="VVS1","VVS2"="VVS2",
                                       "IF"="IF")),
            selectInput("cut", label = h4("Cut"),
                        choices = list("Unknown" = "*", "Fair" = "Fair",
                                       "Good"="^Good", "Very Good" = "Very Good",
                                       "Premium" = "Premium", "Ideal" = "Ideal")),
            selectInput("col", label = h4("Color"),
                        choices = list("Unknown" = "*", "D"="D","E"="E",
                                       "F"="F", "G"="G", "H"="H","I"="I", "J"="J"))
        ),

        # Show a plot diamonds and regression line
        mainPanel(
            plotOutput("distPlot"),
            h4("The predicted price for the diamond is:"),
            h3(textOutput("result"))
        )
    )
))
