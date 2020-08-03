
library(shiny)


shinyUI(fluidPage(

    # Application title
    titlePanel("Predict Horsepower from MPG"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderMPG",
                        "What is the MPG of the car?",
                        10,35,
                        value = 30),
            checkboxInput("showModel1","show/hide model 1", value= TRUE),
            checkboxInput("showModel2","show/hide model 2", value= TRUE),
            submitButton("Submit")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("Plot1"),
            h3("Predicted Horsepower from Model 1:"),
            textOutput("pred1"),
            h3("Predicted Horsepower from Model 2:"),
            textOutput("pred2")
        )
    )
))
