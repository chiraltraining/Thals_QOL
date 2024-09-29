# load packages
library(tidyverse)
library(gtsummary)
library(gt)

# import data 
data <- readRDS("data/Thalassemia_QoL_Processed.rds")

# check data structure 
glimpse(data)

# association between gender, QOL, PHS, MHS 
data |> 
  select(Gender, Physical_Health_Status, Mental_Health_Status, QOL_Status) |> 
  tbl_summary(
    type = c(Physical_Health_Status, Mental_Health_Status, QOL_Status) ~ "categorical", 
    by = Gender
  ) |> 
  add_p() |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/Table5.docx")




