library(ISLR)

# data

head(Smarket)
indxTrain <- createDataPartition(y = Smarket$Direction, p = 0.75,list = FALSE)
head(indxTrain)

# split
training <- Smarket[indxTrain,]
testing <- Smarket[-indxTrain,]

prop.table(table(training$Direction)) * 100
prop.table(table(testing$Direction)) * 100
prop.table(table(Smarket$Direction)) * 100

# fit 

knnFit <- train(Direction ~ ., data = training, method = "knn")
knnFit

plot(knnFit)

# predict 

knnPredict <- predict(knnFit,newdata = testing )

# accuracy

confusionMatrix(knnPredict, testing$Direction )

