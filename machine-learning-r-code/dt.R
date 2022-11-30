# data
data("iris")
names(iris) = tolower(names(iris))
table(iris$species)

# split
index = createDataPartition(y=iris$species, p=0.7, list=FALSE)

train.set = iris[index,]
test.set = iris[-index,]

dim(train.set)
dim(test.set)

with(iris, qplot(petal.width, sepal.width, colour=species, cex=2))

# fit the model
iris.tree = train(species ~ ., 
                  data=train.set, 
                  method="rpart")

iris.tree

# summaries 

summary(iris.tree$finalModel)

plot(iris.tree$finalModel, uniform=TRUE,
     main="Classification Tree")
text(iris.tree$finalModel, use.n.=TRUE, all=TRUE, cex=.8)

library(rattle)
fancyRpartPlot(iris.tree$finalModel)

# predict

iris.pred = predict(iris.tree, newdata = test.set)

table(iris.pred, test.set$species)

# error.rate = round(mean(iris.pred != test.set$species),2)
# error.rate

confusionMatrix(iris.pred, test.set$species)
