library(shiny)

WHT<-function(Waist_Circumference,Hip_Circumference) {
  Waist_Circumference / Hip_Circumference
}

diagnostic<-function(Waist_Circumference,Hip_Circumference){
  WHT_score<- Waist_Circumference / Hip_Circumference
  ifelse(WHT_score<.8,"normal weight",ifelse(WHT_score<.85,"over weight","obesity"))
}

shinyServer(
  function(input, output) {
    
    output$inputwaistvalue <- renderPrint({input$Waist_Circumference})
    output$inputhipvalue <- renderPrint({input$Hip_Circumference})
    output$estimation <- renderPrint({WHT(input$Waist_Circumference,input$Hip_Circumference)})
    output$diagnostic <- renderPrint({diagnostic(input$Waist_Circumference,input$Hip_Circumference)})
  } 
)

