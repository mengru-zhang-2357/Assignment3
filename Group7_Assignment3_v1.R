# Setting the working directory - Please change to your directory as you see fit
setwd("~/Personal/Brown/BHDS2010/Assignment 3/Assignment3")

# Import libraries used in this analysis
library(tidyverse) # To use ggplot, filter, mutate, etc. tidyverse functions
library(paletteer) # For ggplot color palettes
library(stringr) # To wrap long captions and titles

# Read in the data from the csv
text_msg <- read.csv("TextMessages.csv")

# Visually examine the structure of the data
head(text_msg)
# The Group column shows the two groups of participants. The Baseline and Six_months columns contain the number of text messages measured at two separate time points. Lastly, the participant column contains the subject number.

# Create a factor variable from the Group column to enhance readability
text_msg <- text_msg %>% mutate (Group = factor(Group, levels = c(1,2),
                                                labels = c("Group 1", "Group 2")))

# For visualization, we will create a long version of the text_msg dataset, 
text_msg_long <- text_msg %>% 
  pivot_longer(
    cols = c("Baseline", "Six_months"),
    names_to = "Timepoint",
    values_to = "n_Msg"
  )

# Print out the fist few rows of text_msg_long to verify the pivot is corrected processed
head(text_msg_long)

# Visualization 1: We first create boxplots of text messages stratified by Group and Time
vis_1_caption = "n = 25 for each group. The number of text messages a person typed were captured at two time points: baseline, and six month later."
text_msg_long %>% ggplot (aes(x = Timepoint, y = n_Msg, fill = Timepoint)) + 
  geom_boxplot(width = 0.4, alpha = 0.8) + 
  facet_grid(Group ~ ., switch = "y", scales = "free_y") +
  scale_fill_brewer("Paired") +
  labs(x = "Time Point", y = "Number of Messages",
       title = "Number of Text Messages by Group and Timepoint",
       caption = str_wrap(vis_1_caption, width = 100)) +
  theme_classic() +
  theme(legend.position = "none",
        plot.title = element_text(face = "bold", size = 12, hjust = 0.5),
        plot.caption.position = "plot",
        plot.caption = element_text(hjust = 0))
