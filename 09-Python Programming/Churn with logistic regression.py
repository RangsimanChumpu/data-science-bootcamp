from sklearn.linear_model import LogisticRegression
import pandas as pd
from sklearn.model_selection import train_test_split
import numpy as np

## Read files
df = pd.read_csv("churn.csv")
df.head(5)

## split
y = df["churn"]
x = df[["totaldaycalls","totalintlcalls","totalnightcalls","numbervmailmessages"]]
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=42)

## train model
model = LogisticRegression()
model.fit(x_train, y_train)

## score
train_error = model.score(x_train, y_train)

## evaluate
test_error = model.score(x_test, y_test)
print(train_error, test_error)

def rmse(actual, pred):
    error = actual - pred
    return np.sqrt(np.mean((error**2)))

actual = np.array([1,2,3])
pred = np.array([1,2,1])

rmse(actual, pred)
