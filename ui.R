#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

periods <- c('10', '15', '20', '25', '30', '40')

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  # Application title
  titlePanel("Mortgage Calculator"),
  
  # Description
  fluidRow(
    column(12, "
           This is a simple mortgage calculator.
           Enter your borrowing amount, interest rate and lending period, 
           the app will calcualte your monthly payment and the total amount you need to replay.")
  ),
  
  # Input fields
  fluidRow(
    column(4, textInput('amount', 'Mortgage amount:', '100000')),
    column(4, textInput('rate', 'Interest rate (%):', '3.92')),
    column(4, selectInput('period', 'Mortgage period (years):', periods, '30'))
  ),
  
  # Output fields
  fluidRow(
    column(8, 'Total cost of mortgage:'),
    column(4, textOutput('total'))
  ),
  fluidRow(
    column(8, 'Monthly payments:'),
    column(4, textOutput('monthly'))
  )
))
