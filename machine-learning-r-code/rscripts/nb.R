library("klaR")
library(e1071)

# data
data("iris")
x = iris[,-5]
y = iris$Species

# fit 
model = train(x,y,'nb')

# predict 
predict(model$finalModel,x)
predict(model$finalModel,x)$class
table(predict(model$finalModel,x)$class,y)

# accuracy 

confusionMatrix(predict(model$finalModel,x)$class,y)
