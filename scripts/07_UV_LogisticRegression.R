# load packages
library(tidyverse)
library(easystats)
library(gtsummary)
library(gt)


# import data 
data <- readRDS("data/Thalassemia_QoL_Processed.rds")

# convert outcome into factor 
data$QOL_Status <- as.factor(data$QOL_Status)

# tbl_uvregression
data |> 
  select(1:17, QOL_Status) |> 
  tbl_uvregression(
    method = glm, 
    y = QOL_Status, 
    method.args = list(family = binomial),
    exponentiate = T
  ) |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/Table8_UV_LogReg.docx")
