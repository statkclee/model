# telco.R
library(tidyverse)
deploy_glm <- 
  read_rds("deploy_glm.rds")

#* Echo back the input
#* @param msg The message to echo
#* @get /healthcheck
function(msg=""){
  list(msg = paste0("We are alive!!!"))
}

#* Return Churn Probability and Class
#* @param senior Is Senior Citizen?
#* @get /churn_probability
function(senior){
  senior_val <- ifelse(senior == "Yes", 1, 0)
  1/(1+exp(1.17439390137758 - 0.83852208506855 * senior_val))
}

#* Return Churn Probability and Class
#* @param senior Is Senior Citizen?
#* @param charge Monthly Charges?
#* @get /predict_churn
function(senior, charge){
  test_api_df <- tibble(SeniorCitizen = senior,
                        MonthlyCharges = as.numeric(charge))
  
  predict(deploy_glm, newdata = test_api_df, type = "response")
}
