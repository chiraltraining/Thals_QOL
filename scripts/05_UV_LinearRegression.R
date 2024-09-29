# load packages
library(tidyverse)
library(easystats)
library(gtsummary)
library(gt)


# import data 
data <- readRDS("data/Thalassemia_QoL_Processed.rds")

# impact of gender on quality of life
# y (QOL) = mx(Gender) + c (Univariate Linear Regression)
# y (QOL) = mx1 (Gender) + mx2 (Age) + mx3 (level of education) + C 

# Building models and interpretation 
lin_model <- lm(QOL_Score ~ Gender, data = data)
summary(lin_model)
report(lin_model)

# tbl_uvregression
data |> 
  select(1:17, QOL_Score) |> 
  tbl_uvregression(
    method = lm, 
    y = QOL_Score
  ) |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/Table6_UV_LinReg.docx")