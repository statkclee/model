# plumber.R
library(tidyverse)

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}

#* Plot a histogram with ggplot2
#* @png
#* @get /ggplot
function() {
  p <- data.frame(x = rnorm(100)) %>% 
    ggplot(aes(x)) + 
      geom_density(fill = "tomato", alpha = 0.5)
  print(p)
}


#* Plot a histogram with Base plot
#* @png
#* @get /plot
function(){
  rand <- rnorm(100)
  hist(rand)
}

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /sum
function(a=1, b=2){
  as.numeric(a) + as.numeric(b)
}

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @get /sum_two
function(a, b){
  as.numeric(a) + as.numeric(b)
}
