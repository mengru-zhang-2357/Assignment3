# Assignment 3: Collaborative GitHub Project – Text Message Analysis
In this project, team members worked together to analyze text message data collected at two time points (Baseline and Six Months) across two participant groups. This project practices collaborative data analysis using GitHub version control through branching, committing, and pull requests.

## Repository Contents
- `TextMessages.csv` — Sample dataset for analysis  
- `Group7_Assignment3_v1.R` — Code for analysis including visualization and summary statistics
- `README.md` — Documentation and collaboration details  
- `Group7_Assignment3_Final_Report.pdf` — Combined visualizations and summary statistics report

## Description of Data
The dataset `TextMessages.csv` contains the number of text messages sent by each participant at two time points: Baseline and Six_Months. Participants are categorized into Group 1 and Group 2.

## Setup and Required Packages
To reproduce the analysis, install and load the following R packages:

install.packages(c("tidyverse", "paletteer", "pastecs"))
library(tidyverse)   # for data wrangling and ggplot2 visualization
library(paletteer)   # for diverse color palettes
library(pastecs)     # for descriptive statistics via stat.desc()

## Analysis Overview
The analysis was conducted in three main parts:
1. **Visualization #1** – Box plot of text messages by Group and Timepoint.  
2. **Visualization #2** – Bar chart of text messages by Group and Timepoint.  
3. **Summary Statistics** – Mean, median, count, standard deviation, and quartiles of text messages by Group and Timepoint.
   
## Collaboration and Roles
This project was completed collaboratively using GitHub branching and pull requests.
| Team Member | Role | Branch Name | Key Contributions |
|--------------|------|--------------|-------------------|
| **Mengru Zhang** | Visualization #1 (Boxplot), Documentation, Final report assembly | `Vis_1` | Created faceted boxplots, wrote README, merged final report |
| **Chris Xu** | Visualization #2 (Bar chart), Summary Statistics | [TBU] | Created faceted bar charts and descriptive summary tables |

### Collaboration Workflow
- Each member created a separate branch for their assigned task in R
- Members committed changes with descriptive messages using R
- Changes were pushed to GitHub and reviewed via pull requests
- Members reviewed the final code and output together before the reproducible report was generated

## Reproducibility
To reproduce this analysis:
1. Clone the repository:  
   `git clone https://github.com/mengru-zhang-2357/Assignment3/`
2. Open the R Project in RStudio.
3. Run the `Group7_Assignment3_v1.R` script in RStudio to generate the boxplots, bar charts, and summary statistics.
4. Knit or render the final report (`Final_Report.Rmd`) to PDF.
