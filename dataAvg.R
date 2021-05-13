dataAvg <- function(df){
  ## task5: From the data set in step 4, creates a second, independent tidy data
  ##  set with the average of each variable for each activity and each subject.
  
  mergedDataAvg <- df %>% 
    group_by(subject,activity) %>% 
    summarise_all(mean)
  
  ## return the average of each variable for each activity and each subject.
  mergedDataAvg
}