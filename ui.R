library(shiny) 
shinyUI(
  pageWithSidebar(
    
    # Application title
    headerPanel("Waist-to-hip Index Calculator for Female"),
    
    sidebarPanel(
      numericInput('Waist_Circumference', 'Insert your waist cricumference in cm', 78) ,
      numericInput('Hip_Circumference', 'Insert your hip circumference in cm', 95, min = 1, max = 200, step = .01)
    ), 
    mainPanel(
      p('The waist-to-hip ratio is not only an excellent way of calculating how much excess weight you are carrying, '),
      p('it can also be used to indicate susceptibility to a number of health issues, including high blood pressure, '),
      p('heart disease and diabetes.'),
      tags$div(
        tags$ul(
          tags$li('Waist-to-hip Index <0.8 : Normal weight'),
          tags$li('Waist-to-hip Index [0.8-0.85]   : Overweight'),
          tags$li('Waist-to-hip Index >0.85       : Obesity')
        )
      ),
      
      h4('Taking into account the values entered by you:',style="color:green;"), 
      p('Waist Circumference in cm:',style="color:blue;"), verbatimTextOutput("inputwaistvalue"),
      p('Hip Circumference in cm:',style="color:blue;"), verbatimTextOutput("inputhipvalue"),
      h4('Your calulated Waist-to-hip Ratio is:',style="color:green;"),
      verbatimTextOutput("estimation"),
      p('It means that you are:',style="color:red;"),strong(verbatimTextOutput("diagnostic"))
    )
    
  )   
)