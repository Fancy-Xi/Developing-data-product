library(shiny)
library(miniUI)

pickTrees <- function(){
        ui <- miniPage(
                gadgetTitleBar("select points by dragging your mouse"),
                miniContentPanel(
                        plotOutput("plot", height = "100%", brush = "brush")
                )
        )



server <- function(input,output, session) {
        output$plot <- renderPlot({
                plot(trees$Girth, trees$Volume, main = "trees!",
                     xlab = "Girth", ylab = "Volume")
        })
        observeEvent(input$done, {
                stopApp(brushedPoints(trees, input$brush,
                        xvar = "Girth", yvar = "Volume"))
        })
      }
        runGadget(ui, server)

}