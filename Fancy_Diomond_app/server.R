
library(shiny)
library(ggplot2)
library(dplyr)
library(rsconnect)

# select data
d <- diamonds[,c(1:4,7)]
# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        d    <- filter(diamonds, grepl(input$clar, clarity), grepl(input$cut, cut), grepl(input$col, color))
        # build model
        fit <- lm(price~carat, d)
        # prediction
        p <- predict(fit, newdata=data.frame(carat= input$car,
                                             cut=input$cut,
                                             color=input$col,
                                             clarity=input$clar))

        # draw plot
        plot <- ggplot(data=d, aes(x=carat, y=price)) +
            geom_point(aes(color=cut), alpha=0.5)+
            geom_smooth(method = "lm") +
            geom_vline(xintercept = input$car, color = "green")
        plot

    })
    output$result <- renderText({
        d <- filter(diamonds, grepl(input$cut, cut), grepl(input$col, color), grepl(input$clar, clarity))
        fit <- lm(price~carat, d)
        p <- predict(fit, newdata=data.frame(carat= input$car,
                                             cut=input$cut,
                                             color=input$col,
                                             clarity=input$clar))
        res <- paste(round(p, digits = 1.5),"$")
    })

})
