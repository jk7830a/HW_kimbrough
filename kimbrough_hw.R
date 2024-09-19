#Generate normal random numbers
random_numbers <- rnorm(100, mean = 25, sd=1)

#Compute the average
mean_value <- mean(random_numbers)

#Compute the Standard Deviation
sd_value <- sd(random_numbers)

#Print the Mean and Standard Deviation
print(paste("The Mean is", mean_value, "and the Standard Deviation is", sd_value))