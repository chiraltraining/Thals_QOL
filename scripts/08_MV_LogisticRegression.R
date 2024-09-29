# load packages
library(tidyverse)
library(easystats)
library(gtsummary)
library(gt)


# import data 
data <- readRDS("data/Thalassemia_QoL_Processed.rds") 

# Build the multivariate logistic regression model
mv_model <- glm(QOL_Status ~ Age_of_Participants + Gender + Marital_Status + Type_of_Family + 
                  Level_of_Education + Occupational_Status + Area_of_Residence + Economic_Class + 
                  Diagnosis + Severity + Transfusion_Status + Frequency_of_Blood_Transfusion + 
                  Previous_3Months_Transfution + Splenectomy_Status + Comorbidities_Status + 
                  Ironchelating_Therapy_Status + Medical_Expense, 
                family = binomial(link = "logit"), data = data)


summary(mv_model)
report(mv_model)

# tbl_regression 
mv_model |> 
  tbl_regression(exponentiate = T) |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("tables/Table9_MV_LogReg.docx")

