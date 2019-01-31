# Environmental Data Analytics Coding Challenge #1: Data Exploration

## The following code explores the EPA ECOTOX database entries for neonicotinoid mortality.
## The code contains numerous mistakes and errors, which you are tasked with fixing.
## Instructions listed in comments throughout the script.

#### Setup ----
getwd()

library(tidyverse)

ecotox.neonic <- read.csv("./Data/Raw/ECOTOX_Neonicotinoids_Mortality_raw.csv")

#### Basic Data Summaries ----
head(ecotox.neonic)
summary(ecotox.neonic$Chemical.Name)
summary(ecotox.neonic$Pub..Year)

# Fix formatting of column names (spaces originally present were turned to periods upon import)
colnames(ecotox.neonic)[8:12] <- c("Duration", "Conc.Type", "Conc.Mean", "Conc.Units", "Pub.Year")

### Data Summary Plots ----
# Plot histogram of counts of publication years
ggplot(ecotox.neonic, aes(x = Pub.Year)) +
  geom_histogram()

# Plot histogram of counts chemical names
# hint: what is the class of Chemical.Name? There are two options for a solution.
ggplot(ecotox.neonic, aes(x = Chemical.Name)) +
  geom_bar()

# Plot frequency polygon of publication years divided by chemical name
# Define colors as something other than ggplot default
# scale_color_manual is one example of a solution; there are others possible.
ggplot(ecotox.neonic) +
  geom_freqpoly(aes(x = Pub.Year, color = Chemical.Name)) +
  scale_color_manual(values = c("#f7fbff", "#deebf7", "#c6dbef", "#9ecae1", "#6baed6", "#4292c6", "#2171b5", "#08519c", "#08306b")) +
  theme(legend.position = "right")
                