library(shiny)
library(tidyverse)
library(reticulate)

reticulate::use_condaenv("miniconda3")

if (fs::file_exists("penguins_clk.pkl")) {
  print("Python model already exists, no need to re-run python script.")
} else {
  print("Python model does not exist")
}

rm(list = ls())

reticulate::source_python("./read_pickle.py")

ui <- fluidPage(
  titlePanel("Scikit-learn Breast Cancer Data"),
  
  fluidRow(
    column(3,
       sliderInput("bill_length_mm",
                   "bill_length_mm:",
                   min = 32,
                   max = 50,
                   value = 41),
       sliderInput("bill_depth_mm",
                   "bill_depth_mm:",
                   min = 13,
                   max = 22,
                   value = 17),
       sliderInput("flipper_length_mm",
                   "flipper_length_mm:",
                   min = 170,
                   max = 235,
                   value = 200),
       sliderInput("body_mass_g",
                   "body_mass_g:",
                   min = 2700,
                   max = 6300,
                   value = 4200)
    ),
    column(9,
           tableOutput('penguin_table'),
           verbatimTextOutput("prediction")
           
    )
  )
)

server <- function(input, output) {
  
  ## Dataframe -------------------------------------------------
  penguin_df <- reactive({
    temp_df <- tibble(bill_length = input$bill_length_mm,
                      bill_depth =  input$bill_depth_mm,
                      flipper_length = input$flipper_length_mm,
                      body_mass = input$body_mass_g)
    return(temp_df)
  })
  

  output$penguin_table <- renderTable(penguin_df())
    
  ## Prediction -------------------------------------------------
  predictions <- reactive({
      return(py$python_model$predict(t(test_data[1, ])))
  })
  
  output$prediction <- renderPrint({
    # predictions()
    100
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)