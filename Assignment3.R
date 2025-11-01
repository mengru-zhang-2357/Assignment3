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

# Compute summary statistics (mean and standard error)
summary_stats <- text_msg_long %>%
  group_by(Group, Timepoint) %>%
  summarise(
    n = n(),
    mean = mean(n_Msg, na.rm = TRUE),
    sd = sd(n_Msg, na.rm = TRUE),
    se = sd / sqrt(n),
    min = min(n_Msg, na.rm = TRUE),
    max = max(n_Msg, na.rm = TRUE)
  )

print(summary_stats)

# Visualization 1: We first create boxplots of text messages stratified by Group and Time
vis_1_caption = "n = 25 for each group. The number of text messages a person typed were captured at two time points: baseline, and six month later."
text_msg_long %>% ggplot (aes(x = Timepoint, y = n_Msg, fill = Timepoint)) + 
  geom_boxplot(width = 0.4, alpha = 0.8) + 
  facet_grid(Group ~ ., switch = "y") +
  scale_fill_brewer("Paired") +
  labs(x = "Time Point", y = "Number of Messages",
       title = "Number of Text Messages by Group and Timepoint",
       caption = str_wrap(vis_1_caption, width = 100)) +
  theme_classic() +
  theme(legend.position = "none",
        plot.title = element_text(face = "bold", size = 12, hjust = 0.5),
        plot.caption.position = "plot",
        plot.caption = element_text(hjust = 0))

# The box plot shows that the number of text messages sent decreased from the Baseline observation to that six months later. The decrease appears more significant in Group 1 than Group 2, which we will show later in the summary statistics section.
# The number of text messages six months later for Group 1 contains a fair amount of outliers on the downside, with the minimum being 9 messages.

# Create faceted bar chart
ggplot(summary_stats, aes(x = Timepoint, y = mean, fill = Timepoint)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_errorbar(aes(ymin = mean - se, ymax = mean + se),
                width = 0.2, position = position_dodge(width = 0.9)) +
  facet_wrap(~ Group) +
  labs(
    title = "Comparison of Text Messages by Time within Each Group",
    x = "Time",
    y = "Average Text Messages (± SE)",
    fill = "Time Period"
  ) +
  theme_classic() +
  theme(
    plot.title = element_text(hjust = 0.5),
    legend.position = "right"
  )

# Result: Group 1: Showed a significant decrease in the average number of text messages sent, dropping from approximately 66 at Baseline to about 53 at the six-month mark. The error bars (which represent standard error) do not overlap, suggesting this change is statistically significant.
# Group 2: Showed only a slight decrease in average text messages, from approximately 67 at Baseline to 62 at six months. The error bars for these two time points overlap, suggesting this small drop is likely not statistically significant.In summary, while both groups started with a similar average, Group 1 experienced a much larger and more statistically significant reduction in text messages after six months compared to Group 2.