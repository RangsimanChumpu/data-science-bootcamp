library(tidyverse)
library(caret)
library(mlbench)
library(MLmetrics)


churn <- read.csv("churn.csv")
view(churn)

glimpse(churn)
mean(complete.cases(churn))

df_starter <- churn %>%
  select(totaldayminutes , totaldaycalls, totalevecalls,totalintlcalls, churn)


## 1. split data

train_test_split <- function(data, size=0.8) {
    set.seed(42)
    
    n <- nrow(data)
    train_id <- sample(1:n,  size*n)
    train_df <- data[train_id, ]
    test_df <- data[-train_id, ]
    
    return(list(train_df, test_df))
}

prep_df <- train_test_split(df_starter, size = 0.8)

## pre_process
tranformer <- preProcess(prep_df[[1]],
                         method = c("center", "scale"))

train_df_z <- predict(tranformer, prep_df[[1]])
test_df_z <- predict(tranformer, prep_df[[2]])



## 2. train model
set.seed(42)

ctrl <- trainControl(method = "repeatedcv",
             number = 3,
             repeats = 5,
             summaryFunction = prSummary,
             classProbs = TRUE)

model <- train(churn ~ .,
      data = train_df_z,
      method = "knn",
      metric = "AUC",
      trControl = ctrl)

## 3. Score model
pred_churn <- predict(model, newdata = test_df_z)

## 4. evaluate model

mean(pred_churn == test_df_z$churn)

##confusion matrix

confusionMatrix(as.factor(pred_churn), as.factor(test_df_z$churn),
                positive= "No",
                mode = "prec_recall")
