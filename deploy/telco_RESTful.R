library(plumber)
r <- plumb("telco.R")
r$run(port=8000)

