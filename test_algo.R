# #winning algorithm

library(magrittr)
library(ggplot2)

x <- seq(1,10,.1)
y <- rnorm(length(x))

my_data <- data.frame(x,y)

my_model <- lm(y ~ poly(x,25),data = my_data)
summary(my_model)

my_data$fit <- predict(my_model,my_data)

my_data %>% ggplot() + 
    geom_point(aes(x,y)) + 
    geom_line(aes(x,fit))

# for real though, Andrew mentioned something about checking for overfitting, so something to keep in mind!