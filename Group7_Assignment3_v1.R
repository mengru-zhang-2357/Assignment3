# The purpose of this code is for group assignment 3 Visualization #2: Creates
# stratified bar charts of text messages Group and Time
# by: Chris Xu


# read csv file
data <- read.csv("TextMessages.csv", header = TRUE)

library(ggplot2)
library(tidyverse)

# Reshape the data to long format
data_long <- data %>%
  pivot_longer(cols = c(Baseline, Six_months),
               names_to = "Time",
               values_to = "TextMessages")

# Compute summary statistics (mean and standard error)
summary_stats <- data_long %>%
  group_by(Group, Time) %>%
  summarise(
    n = n(),
    mean = mean(TextMessages, na.rm = TRUE),
    sd = sd(TextMessages, na.rm = TRUE),
    se = sd / sqrt(n),
    min = min(TextMessages, na.rm = TRUE),
    max = max(TextMessages, na.rm = TRUE)
  )

print(summary_stats)

# Create faceted bar chart
ggplot(summary_stats, aes(x = Time, y = mean, fill = Time)) +
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
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5),
    legend.position = "right"
  )

#Result: Group 1: Showed a significant decrease in the average number of text
#messages sent, dropping from approximately 66 at Baseline to about 53 at the
#six-month mark. The error bars (which represent standard error) do not overlap,
#suggesting this change is statistically significant.Group 2: Showed only a
#slight decrease in average text messages, from approximately 67 at Baseline to
#62 at six months. The error bars for these two time points overlap, suggesting
#this small drop is likely not statistically significant.In summary, while both
#groups started with a similar average, Group 1 experienced a much larger and
#more statistically significant reduction in text messages after six months
#compared to Group 2.

























