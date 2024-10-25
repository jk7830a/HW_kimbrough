#' Calculate Column Means
#'
#' This function takes a data frame and returns a vector of column means.
#'
#' @param df A data frame containing numeric columns.
#'
#' @return A numeric vector of column means.
#' @examples
#' df <- data.frame(col1 = c(1, 2, 3), col2 = c(4, 5, 6), col3 = c(7, 8, NA))
#' col_means(df)
#' 
#' @export
col_means<- function(df){
  means <- numeric(ncol(df))
  
  for(i in 1:ncol(df)){
    means[i] <- mean(df[, i], na.rm = TRUE)
  }
  return(means)
}


#' Count NA Values
#'
#' This function counts the number of NA values in a given vector.
#'
#' @param vec A numeric vector.
#'
#' @return An integer count of NA values in the vector.
#' @examples
#' vec  <- c(1, NA, 3, NA, 5)
#' count_na(vec)
#'
#' @export
count_na <- function(vec){
  na_count <- 0
  
  for(i in 1:length(vec)){
    if(is.na(vec[i])){
      na_count <- na_count + 1
    }
  }
  return(na_count)
}
