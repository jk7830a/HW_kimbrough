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

