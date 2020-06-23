#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # load the dataset and clean a bit the dataset by giving more explicit values to some factors.
  data <- read.table("data_heart_disease_uci.txt", header = TRUE)
  data$sex <- ifelse(data$sex == 1, "Male", "Female")
  data$fbs <- ifelse(data$fbs == 1, "high", "Normal")
  data$target <- ifelse(data$target == 1, "Yes", "No")
  
  # Create a data frame with the selected variables
  df <- reactive({
    xInput <- data[, input$xaxis]
    yInput <- data[, input$yaxis]
    zInput <- data[, input$qual_var]
    data.frame(x = xInput, y = yInput, variable = zInput)
  })
  
  # Calculate the correlation factor between x and y
  model_cor <- reactive({
    df <- df()
    cor(df$x,df$y)
  })
  
  # Generate a plot according to the values of x, y and variable
  output$plot <- renderPlot({
    xInput <- input$xaxis
    yInputv<- input$yaxis
    zInput <- input$qual_var
    df <- df()
    ggplot(df, aes(x, y)) + geom_point(aes(color = variable)) + geom_smooth(method = "lm") + theme_bw()
  })
  
  # Display the correlation factor between x and y
  output$correlation <- renderText({
    model_cor()
    
  })
  
})
