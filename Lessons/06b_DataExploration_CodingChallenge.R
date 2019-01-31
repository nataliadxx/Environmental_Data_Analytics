# Environmental Data Analytics Coding Challenge #1: Data Exploration

## The following code explores the EPA ECOTOX database entries for neonicotinoid mortality.
## The code contains numerous mistakes and errors, which you are tasked with fixing.
## Instructions listed in comments throughout the script.

#### Setup ----
setwd("/Users/katerisalk/Documents/Duke/Courses/Environmental_Data_Analytics")

library("tidyverse")

ecotox.neonic <- read.csv("/Data/Raw/ECOTOX_Neonicotinoids_Mortality_raw.csv")

#### Basic Data Summaries ----
head(ecotox.neonic,)
summary(ecotox.neonic%Chemical.Name)
summary(ecotox.neonic%Pub..Year)

# Fix formatting of column names (spaces originally present were turned to periods upon import)
colnames(ecotox.neonic)[8:12] <- c(Duration, Conc.Type, Conc.Mean, Conc.Units, Pub.Year)

# Plot histogram of counts of publication years
ggplot(ecotox.neonic, aes(x = Pub.Year)) 
  geom_histogram()

# Plot histogram of counts chemical names
# hint: what is the class of Chemical.Name? There are two options for a solution.
ggplot(ecotox.neonic, x = Chemical.Name) +
  geom_histogram()

# Plot frequency polygon of publication years divided by chemical name
# Define colors as something other than ggplot default 
ggplot(ecotox.neonic) +
  geom_freqpoly(aes(x = Pub.Year, color = Chemical.Name) +
  theme(legend.position = "right")
