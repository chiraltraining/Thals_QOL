# load packages
library(tidyverse)
library(easystats)
library(gtsummary)
library(gt)


# import data 
data <- readRDS("data/Thalassemia_QoL_Processed.rds") 



# Building models and interpretation 
# Build the multivariate linear regression model
mv_model <- lm(QOL_Score ~ Age_of_Participants + Gender + Marital_Status + Type_of_Family + 
              Level_of_Education + Occupational_Status + Area_of_Residence + Economic_Class + 
              Diagnosis + Severity + Transfusion_Status + Frequency_of_Blood_Transfusion + 
              Previous_3Months_Transfution + Splenectomy_Status + Comorbidities_Status + 
              Ironchelating_Therapy_Status + Medical_Expense, data = data)

summary(mv_model)
report(mv_model)

# tbl_regression 
mv_model |> 
  tbl_regression() |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/Table7_MV_LinReg.docx")

