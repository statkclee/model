#* Perform a prediction by submitting in the body of a POST request
#* @post /predict 

get_prediction <- function(req) {
    example <- req$postBody
    parsed_example <- jsonlite::fromJSON(example)

    penguin_predictvie_model <- readr::read_rds("data/penguin_predictvie_model.rds")
    prediction <- predict(penguin_predictvie_model, new_data = parsed_example)
    probability <- predict(penguin_predictvie_model, new_data = parsed_example, type = "prob")

    return(dplyr::bind_cols(prediction, probability) %>% 
             bind_cols(parsed_example))
}

