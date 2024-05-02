#method = “glm”
#3-5 variables

library(tidyverse)
library(caret)

churn <- read.csv("churn.csv")
view(churn)

## 1. split data

train_test_split <- function(data, size=0.8) {
    set.seed(42)
    
    n <- nrow(data)
    train_id <- sample(1:n,  size*n)
    train_df <- data[train_id, ]
    test_df <- data[-train_id, ]
    
    return(list(train_df, test_df))
}

prep_df <- train_test_split(churn, size = 0.8)

## 2. train model

ctrl <- trainControl(method = "cv",
             number = 10)

model <- train(churn ~ numbercustomerservicecalls + totalnightcalls + totalintlcalls,
      data = prep_df[[1]],
      method = "glm",
      trControl = ctrl)
