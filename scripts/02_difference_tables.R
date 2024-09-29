# load packages
library(tidyverse)
library(gtsummary)
library(gt)

# import data 
data <- readRDS("data/Thalassemia_QoL_Processed.rds")

# Is there any difference in (numeric variable) between (group 1) and (group 2)
# Is there any difference in QOL_Score between male and female = gender? 
data |> 
  select(18:28, Gender) |> 
  tbl_summary(by = Gender, 
              statistic = list(
                all_continuous() ~ "{mean}±{sd}"
              ), 
              type = c(Role_Physical, Role_Emotional) ~ "continuous")


# Is there any significant difference? 
# if p < 0.05 (5%), the result is significant (95% Confidence Interval)
data |> 
  select(18:28, Gender) |> 
  tbl_summary(by = Gender, 
              statistic = list(
                all_continuous() ~ "{mean}±{sd}"
              ), 
              type = c(Role_Physical, Role_Emotional) ~ "continuous") |> 
  add_p() |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/Table3.docx")

# Is there any difference in (numeric variable) between (group 1), (group 3) and (group 2)
data |> 
  select(18:28, Economic_Class) |> 
  tbl_summary(by = Economic_Class, 
              statistic = list(
                all_continuous() ~ "{mean}±{sd}"
              ), 
              type = c(Role_Physical, Role_Emotional) ~ "continuous") |> 
  add_p() |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/Table4.docx")
