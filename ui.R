#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a plot of different parameters that can be selected
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Heart disease data"),
  
  # Sidebar with dropdown list to select x and y axis, as well as an additional variable
  sidebarLayout(
    sidebarPanel(
         
         selectInput("xaxis", "Choose x axis:",
                     c("Age" = "age", "Resting blood pressure" = "trestbps", 
                       "Cholesterol" = "chol", "Maximum heart rate" = "thalach"), 
                     selected = "age"),
         selectInput("yaxis", "Choose y axis:",
                     c("Age" = "age", "Resting blood pressure" = "trestbps", 
                       "Cholesterol" = "chol", "Maximum heart rate" = "thalach"), 
                     selected = "trestbps"),
         
         selectInput("qual_var", "Variables:",
                     c("Gender" = "sex",
                       "Fasting Glycemia" = "fbs",
                       "Heart disease" = "target"),
                     selected = "sex"
         )
        
    ),
    
    
    # Add some text documentation to the application
    # Show a plot of the generated distribution and give the correlation value 
    # between selected x axis and y axis
    mainPanel(
       h3("Quick introduction"),
       p("This simple application shows a graph of some variables from the dataset heart disease (UCI) downloaded from Kaggle website"),
       
       h4("Select x and y axis"),
       p("On the left handside, you can select the values for the x and y axis. You can visualize the age of the patient, the resting blood pressure, the cholesterol level and the maximumm heart rate achieved. "),
       
       h4("Select a variable"),
       p("You have also the possibility to display the gender of each patient (male vs female), the fasting blood sugar level (high vs normal) and if they exhibit a heart related disease."),
       
       # Horizontal line ----
       tags$hr(),
       
       h3("Plot"),
       plotOutput("plot"),
       h3("Correlation factor"),
       textOutput("correlation"),
       
       # Horizontal line ----
       tags$hr(),
       h3("More documentation"),
       h4("Plot and correlation factor"),
       p("The plot displays the selected values for the x and y axis (see above), as well as the color code for the selected variable (see above). The data set regression line is also displayed along with the 95% confidence interval. The correlation between the x and y axis is also calculated and the value is displayed. Ultimately, a prediction model can be implemented.")
       
    )
  )
))
