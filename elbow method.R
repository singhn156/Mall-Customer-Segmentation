kmean_withinss <- function(k) {
  cluster <- kmeans(Mail3, k)
  return (cluster$tot.withinss)
}

## Try with 2 cluster
kmean_withinss(2)

# Set maximum cluster 
max_k <-10
# Run algorithm over a range of k 
wss <- sapply(2:max_k, kmean_withinss)


# Create a data frame to plot the graph
elbow <-data.frame(2:max_k, wss)

# Plot the graph with gglop
require(ggplot2)
ggplot(elbow, aes(x = X2.max_k, y = wss)) +
  geom_point() +
  geom_line() +
  scale_x_continuous(breaks = seq(1, 20, by = 1))

#silhouette method
library(factoextra)

library(NbClust)
fviz_nbclust(Mail3, FUNcluster, method = c("silhouette", "wss", "gap_stat"))

fviz_nbclust(Mail3, kmeans, method = "silhouette")+
  labs(subtitle = "Silhouette method")

res.nbclust <- NbClust(Mail3, distance = "euclidean",
                       min.nc = 2, max.nc = 10, 
                       method = "kmeans", index ="all") 
factoextra::fviz_nbclust(res.nbclust) + theme_minimal()
