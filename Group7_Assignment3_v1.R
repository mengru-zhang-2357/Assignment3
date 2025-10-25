# Setting the working directory - Please change to your directory as you see fit
setwd("~/Personal/Brown/BHDS2010/Assignment 3/Assignment3")

# Import libraries used in this analysis
library(tidyverse) # To use ggplot, filter, mutate, etc. tidyverse functions

# Read in the data from the csv
text_msg <- read.csv("TextMessages.csv")

# Visually examine the structure of the data
head(text_msg)
# The Group column shows the two groups of participants. The Baseline and Six_months columns contain the number of text messages measured at two separate time points. Lastly, the participant column contains the subject number.

# For visualization, we will create a long version of the text_msg dataset, 
text_msg_long <- text_msg %>% 
  pivot_longer(
    cols = c("Baseline", "Six_months"),
    names_to = "Timepoint",
    values_to = "n_Msg"
  )

# Print out the fist few rows of text_msg_long to verify the pivot is corrected processed
head(text_msg_long)
