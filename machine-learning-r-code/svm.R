library(tidyverse)
library(mlbench)

# data
data("PimaIndiansDiabetes2")
pima.data <- na.omit(PimaIndiansDiabetes2)
sample_n(pima.data, 3)

# train_control <- trainControl(method="repeatedcv", number=10, repeats=3)

svm1 <- train(diabetes ~., data = pima.data, method = "svmLinear")
print(svm1)

# the kappa statistic is a measure of how closely the instances classified by the machine learning classifier matched the data labeled 
svm2 <- train(diabetes ~., data = pima.data, method = "svmLinear", tuneGrid = expand.grid(C = seq(0, 2, length = 20)))
plot(svm2)
svm2$bestTune

# prediction
tail(pima.data)
svm_pred <- predict(svm2, tail(pima.data))
svm_pred

table(svm_pred, tail(pima.data$diabetes))
confusionMatrix(svm_pred, tail(pima.data$diabetes))

