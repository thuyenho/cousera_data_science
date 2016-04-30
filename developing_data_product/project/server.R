library(shiny)
library(caret)

# Define server logic
shinyServer(function(input, output) {
  p <- reactive({})
  n <- reactive({as.numeric(input$n)})
  
  inTrain <- reactive({createDataPartition(y=faithful$waiting, 
                                           p = as.numeric(input$perTrainSet)/100, 
                                           list = FALSE)})
  trainFaith <- reactive({faithful[inTrain(),] })
  testFaith <- reactive({faithful[-inTrain(),]})
  modelFit <- reactive({lm(eruptions ~ waiting, data=trainFaith())})
  
  output$view <- renderTable({
    head(faithful, n = n())
  })
  
  output$plot <- renderPlot({
    # create 1 x 2 panel plot
    par(mfrow=c(1,2))
    # plot train data with the regression line
    plot(trainFaith()$waiting,trainFaith()$eruptions,pch=19,col="blue",xlab="Waiting",
         ylab="Duration", main = "Train")
    lines(trainFaith()$waiting,predict(modelFit()),lwd=3)
    # plot test data with the regression line
    plot(testFaith()$waiting,testFaith()$eruptions,pch=19,col="blue",xlab="Waiting",
         ylab="Duration", main = "Test")
    lines(testFaith()$waiting,predict(modelFit(),newdata=testFaith()),lwd=3)
  })
  
  output$RMSE <- renderPrint({
    # Calculate RMSE on training and test sets
    c(trainRMSE = sqrt(sum((modelFit()$fitted-trainFaith()$eruptions)^2)),
      testRMSE = sqrt(sum((predict(modelFit(),newdata=testFaith())-testFaith()$eruptions)^2)))
  })
  

})