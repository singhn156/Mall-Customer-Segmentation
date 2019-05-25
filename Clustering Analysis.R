library("stats", lib.loc="C:/Program Files/R/R-3.5.1/library")
#Appling K mean clustering
km<-kmeans(Mail3,3)
str(km)
#ploting of clusters
install.packages("animation")
set.seed(2345)
library(animation)
kmeans.ani(Mail3[3:4], 3)
kmeans.ani(Mail3[3:4], 4)
kmeans.ani(Mail3[3:4], 5)
kmeans.ani(Mail3[2:3], 3)
kmeans.ani(Mail3[2:3], 4)
kmeans.ani(Mail3[c(2,4)], 4)
kmeans.ani(Mail3[c(2,4)], 3)
#elbow method
kmean_withinss <- function(k) {
  cluster <- kmeans(Mail3, k)
  return (cluster$tot.withinss)}
## Try with 2 cluster

# Set maximum cluster 
max_k <-10
# Run algorithm over a range of k 
wss <- sapply(2:max_k, kmean_withinss)
# Create a data frame to plot the graph
elbow <-data.frame(2:max_k, wss)
# Plot the graph with ggplot2

#Loading required package: ggplot2
# Plot the graph with gglop
require(ggplot2)
ggplot(elbow, aes(x = X2.max_k, y = wss)) +
  geom_point() +
  geom_line() +
  scale_x_continuous(breaks = seq(1, 20, by = 1))
#optimal K=3 for kmeans clustering
kmeans.ani(Mail3[c(2,4)], 3)
kmeans.ani(Mail3[c(2,3)], 3)
kmeans.ani(Mail3[c(3,4)], 3)
#adding cluster to Mail3
Mail1$clusters<-km$cluster


