## Packages ----------
library(shiny)
library(tidyverse)
library(reticulate)

## Python Model import -----------------------

reticulate::use_condaenv("miniconda3")

source_python("read_pickle.py")
penguin_clf <- read_pickle_file("penguins_clf.pkl")

## Shiny ----------------

ui <- fluidPage(
  titlePanel("Scikit-learn Palmer Penguins Data"),
  
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
           tags$h2("Penguins Features"),
           tableOutput('penguin_table'),
           tags$h2("Penguins Sex Prediction"),
           verbatimTextOutput("prediction"),
           tags$h2("Penguins Sex Probability"),
           tableOutput('probability_table')
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
    ifelse(penguin_clf$predict(penguin_df()) == 0, "male", "female")
  })

  output$probability_table <- renderTable({
    prob_df <- penguin_clf$predict_proba( penguin_df() )
    prob_df %>% 
      as_tibble() %>% 
      set_names(c("male", "female"))
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)