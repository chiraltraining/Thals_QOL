# load packages
library(tidyverse)
library(gtsummary)
library(gt)

# import data 
data <- readRDS("data/Thalassemia_QoL_Processed.rds")

# Table 1. Demographic characteristics of study participants 
data |> 
  select(1:8) |> 
  tbl_summary(
    statistic = list(
      all_continuous() ~ "{mean}±{sd}"
    )
  ) |> 
  as_gt() |> 
  gtsave("tables/Table1.docx")

# Table 2. Clinical characteristics of study participants 
data |> 
  select(9:17) |> 
  tbl_summary(
    statistic = list(
      all_continuous() ~ "{mean}±{sd}"), 
    type = c(Previous_3Months_Transfution, Splenectomy_Status) ~ "categorical"
  ) |> 
  as_gt() |> 
  gtsave("tables/Table2.docx")