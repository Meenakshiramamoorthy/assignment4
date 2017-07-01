#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

getMonthly <- function(amount, rate, period) {
  pmtn <- (amount * (rate / (100 * 12)))
  pmtd <- 1 - ((1 + (rate / (100 * 12))) ^ (-1 * period * 12))
  monthly <- pmtn / pmtd
  
  round(monthly, 2)
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$total <- renderText({
    monthly <- getMonthly(as.numeric(input$amount), as.numeric(input$rate), as.numeric(input$period))
    
    round(monthly * 12 * as.numeric(input$period), 2)
    })
  
  output$monthly <- renderText({
    getMonthly(as.numeric(input$amount), as.numeric(input$rate), as.numeric(input$period))
    })
  
})
