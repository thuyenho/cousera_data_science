library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Application caculates RMSE of the duration of the eruption for the Old Faithful geyser"),
  
  sidebarPanel(
    sliderInput("perTrainSet", "Choose percentage of training set:",
                min = 50, max = 90, value = 70),
    
    numericInput("n", "Number of observations to view:", 10)
  ),
  
  # Show a summary of the dataset and an HTML table with the requested
  # number of observations
  mainPanel(
    h4("Some of first rows dataset"),
    tableOutput("view"),
    h4("Plot train and test data with the regression line"),
    plotOutput('plot'),
    h4('RMSE on training and test sets'),
    verbatimTextOutput("RMSE")
  )
))