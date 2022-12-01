# HIERARCHICAL 

m <- matrix(1:15,5,3)
dim(m)
dist(m) # computes the distance between rows of m (since there are 3 columns, it is the euclidian distance between tri-dimensional points)

dist(m, method="manhattan")

set.seed(101)

sampleiris <- iris[sample(1:150, 40),] # get samples from iris dataset

# each observation has 4 variables, ie, they are interpreted as 4-D points
distance   <- dist(sampleiris[,-5], method="euclidean") 
hclustfit    <- hclust(distance, method="average")

# choosing clusters
plot(hclustfit, hang=-1, label=sampleiris$Species)
clusters <- cutree(hclustfit, 3)
table(clusters, sampleiris$Species)

cluster_center = aggregate(sampleiris[,-5],list(cluster=clusters),mean)
print(cluster_center)
centers <- rowMeans(cluster_center[, 2:5])

# ggplot(sampleiris, aes(Petal.Length, Petal.Width, color = Species)) + 
#   geom_point(alpha = 0.4, size = 3.5) + geom_point(col = clusterCut) + 
#   scale_color_manual(values = c('black', 'red', 'green'))

plot(sampleiris$Petal.Length, sampleiris$Petal.Width, col = sampleiris$Species)
points(centers, col= 1:3, pch=8, cex=2)

# plot(as.dendrogram(cluster), edgePar=list(col="darkgreen", lwd=2), horiz=T) 
# str(as.dendrogram(cluster))
# cluster$labels[cluster$order]
