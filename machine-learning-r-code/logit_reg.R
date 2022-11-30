# dataset

df_obj <- read.csv(file.choose())
names(df_obj)

# split

library(caTools)
head(df_obj)
split <- sample.split(df_obj$Status, SplitRatio = 0.80)
trainingSet <- subset(df_obj, split == TRUE)
testSet <- subset(df_obj, split == FALSE)
118936/148670

# fitting

library(caret)
caretLogitModel <- train(trainingSet[, c(3, 8, 23, 24)], trainingSet[, 33], method = 'glm')
summary(caretLogitModel)
plot(logitModelPred)

# predict

logitModelPred <- predict(caretLogitModel, testSet[, -33])

# accuracy

classify50 <- ordered(classify50, levels = c("Yes", "No"))
actual_status <- ifelse(testSet$Status == 1, 'Yes', 'No')
# cm <- table(Predicted = classify50, Actual = actual_status) # for information
levels(classify50)
levels(actual_status) # not a factor
confusionMatrix(classify50, as.factor(actual_status))