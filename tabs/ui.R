
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Tabs"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("box1", "enter tab1 text:", value = "tab 1"),
            textInput("box2", "enter tab2 text:", value = "tab 2"),
            textInput("box3", "enter tab3 text:", value = "tab 3"),
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Tab 1", br(), textOutput("out1")),
                        tabPanel("Tab 1", br(), textOutput("out1")),
                        tabPanel("Tab 1", br(), textOutput("out1"))
                        )
        )
    )
))
