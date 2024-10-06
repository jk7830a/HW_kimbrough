#J.Kimbrough_DATA-413_HW2_CODE

#Problem 1:

library(tidyverse)
tribble( ~x,     ~y,   ~w,    ~z, 
         210,    300,  220,   180, 
         102,    100,  119,   187, 
         176,    175,  188,   173, 
         87,     95,   91,    94, 
         202,    210,  234,   218, 
         110,    122,  131,   128,
) -> dt
dt

## 1a 
### Use and show a map function 
### to find the "mean" of each column of the dt data table. 
column_means <- dt %>% 
  map_dbl(mean)
column_means


## 1b 
### Use and show a map function that will 
### calculate the "standard deviation" of each value 
### of each column of the data table dt. 
column_sds <- dt %>% 
  map_dbl(sd)
column_sds


## 1c
### Use and show a map function that will 
### calculate the "square root" of each value 
### of each column of the data table dt.
column_sqrts <- dt %>% 
  map_df(sqrt)
column_sqrts


## 1d
### Use R code to find the "mean", "max", 
### "1st Quartile", "3rd Quartile", "Median", and "Min" 
### for each column of the dt data table. 
### (Hint: You do not have to use a map function).
column_summaries <- dt %>% 
  summary()
column_summaries

#_____________________________________________________

#Problem 2: 

## Write a function that uses a for loop for each iteration, 
## randomly draws 5 observations from an exponential distribution 
## with "rate" parameter 1 (use rexp()) and calculates its "mean". 
## It should do this 10,000 times. 
## Choose an appropriate plot to plot the distribution of "means". 

set.seed(123)

draw_means_for <- function(iterations = 10000, sample_size = 5, rate = 1){
  means <- numeric(iterations)
  
  for(i in 1:iterations){
    sample <- rexp(sample_size, rate)
    means[i] <- mean(sample)
  }
  return (means)
}

means_for <- draw_means_for()

means_df <- data.frame(means = means_for)
ggplot(means_df, aes(x = means)) +
  geom_histogram(fill = "blue", color = "black") +
  xlab("Mean") + 
  ggtitle("Distribution of Means (For Loop)")

## 2a
### Repeat part 1 by using a map_* () function. 
set.seed(123)

means_map <- map_dbl(1:10000, ~ mean(rexp(5, rate = 1)))

means_map_df <- data.frame(means = means_map)
ggplot(means_df, aes(x = means)) +
  geom_histogram(fill = "blue", color = "black") +
  xlab("Mean") + 
  ggtitle("Distribution of Means (For Loop)")

## 2b
### Repeat part 1 by using the replicate () function.
set.seed(123)

means_replicate <- replicate(10000, mean(rexp(5, rate = 1)))

means_replicate_df <- data.frame(means = means_replicate)

ggplot(means_replicate_df, aes(x = means)) +
  geom_histogram(fill = "blue", color = "black") +
  xlab("Mean") + 
  ggtitle("Distribution of Means (replicate)")


## 2c
### Use another for loop that will print out plots 
### for sample size of 5, 10, and 20 observations
## (instead of just 5).
sample_sizes <- c(5, 10, 20)

set.seed(123)

for(n in sample_sizes){
  means <- numeric(10000)
  
  for(i in 1:10000){
    sample <- rexp(n, rate = 1)
    means[i] <- mean(sample)
  }
  
  hist(means, main = paste("Distribution of Means (Sample Size:", n, ")"),
       xlab = "Mean", breaks = 30)
}

#_____________________________________________________

