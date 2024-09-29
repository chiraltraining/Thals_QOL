# load packages 
library(tidyverse)
library(naniar)

# read data 
data <- read.csv("data/Thalassemia_QoL.csv")

# check missing data 
sum(is.na(data))
miss_var_summary(data)
gg_miss_var(data)

# check duplicated rows 
sum(duplicated(data))

# rename variables 
data <- data |> 
  rename(QOL_Score = Total_SF_Score)

# physical health summary grouping 
data <- data |> 
  mutate(Physical_Health_Status = case_when(
    Physical_Health_Summary < 50 ~ 0, # Poor 
    Physical_Health_Summary >= 50 ~ 1 # Good 
  ))


# mental health summary grouping 
data <- data |> 
  mutate(Mental_Health_Status = case_when(
    Mental_Health_Summary < 50 ~ 0, # Poor 
    Mental_Health_Summary >= 50 ~ 1 # Good 
  ))

# QOL summary grouping 
data <- data |> 
  mutate(QOL_Status = case_when(
    QOL_Score < 50 ~ 0, # Poor 
    QOL_Score >= 50 ~ 1 # Good 
  ))

# export pre-processed data 
# as csv 
write.csv(data, "data/Thalassemia_QoL_Processed.csv", row.names = F)

# save as RDS (for large)
write_rds(data, "data/Thalassemia_QoL_Processed.rds")

# import exported data 
data2 <- read.csv("data/Thalassemia_QoL_Processed.csv")

data3 <- readRDS("data/Thalassemia_QoL_Processed.rds")
