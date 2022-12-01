# https://rpubs.com/PauCazali/506282

library(readr)
library(caret)
library(tidyverse)

data(iris)
iris.new <- iris[,3:4]

dim(iris.new)

set.seed(61)

cluster_col <- c("red","Blue", "Black")

km.iris <- kmeans(iris.new, centers = 3, nstart=25,iter.max = 20)
# km.iris <- kmeans(iris.new, centers = 3) will not work for scree plot

plot(iris.new$Petal.Length,iris.new$Petal.Width,
     xlab = "Petal Length",
     ylab = "Petal Width",
     col = km.iris$cluster)

points(km.iris$centers, col= 1:3, pch=8, cex=2)

wss <- 0

for (i in 1:15) { # 1:15 number of iterations any number is okay after 5th iteration
  km.iris <- kmeans(iris.new, centers = i, nstart=25, iter.max = 50)
  # km.iris <- kmeans(iris.new, centers = 3)
  wss[i] <- km.iris$tot.withinss
}

plot(1:15, wss, type = "b", 
     xlab = "Numero de Clusters", 
     ylab = "Suma de cuadrados entre grupos")

