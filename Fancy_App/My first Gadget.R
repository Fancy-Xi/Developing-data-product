library(shiny)
library(miniUI) 

mygadget <- function(number1, number2) {
        ui <- miniPage(
                gadgetTitleBar("Add two numbers"),
                miniContentPanel(
                        selectInput("num1", "first number", choices = number1),
                        selectInput("num2", "second number", choices = number2)
                )
        )
        server <- function(input, output, session) {
                
                observeEvent(input$done, {
                        num1 <- as.numeric(input$num1)
                        num2 <- as.numeric(input$num2)
                        
                        stopApp(num1 + num2)
                })
        }
        runGadget(ui, server)
}