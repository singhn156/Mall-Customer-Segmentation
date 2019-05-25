setwd("F:/Analysis work1/customer-segmentation-tutorial-in-python/New Folder")
Mail<-read.csv("Mall_Customers.csv",header = T,sep = ",")

View(Mail)
str(Mail)

summary(Mail)
#Visualisation
require(ggplot2)
ggplot(Mail)+geom_histogram(aes(x=Age),bins = 20)
ggplot(Mail)+geom_histogram(aes(x=Mail$Annual.Income..k..),bins = 10)
ggplot(Mail)+geom_histogram(aes(x=Mail$Spending.Score..1.100.),bins = 10)
ggplot(Mail,aes(y=Age,x=1))+geom_boxplot()
ggplot(Mail,aes(y=Mail$Annual.Income..k..,x=1))+geom_boxplot()
ggplot(Mail,aes(y=Mail$Spending.Score..1.100.))+geom_boxplot()
library("corrplot", lib.loc="~/R/win-library/3.5")
Mail1<-Mail[,c(3:5)]
M<-cor(Mail1)
corrplot(M,method="pie")
#outlier detection
library("outliers", lib.loc="~/R/win-library/3.5")
outlier(Mail1$Annual.Income..k..)
#after getting outliers
Mail1<-Mail1[1:198,]

#Multivariate plotting
symbols(Mail1$Annual.Income..k..,Mail1$Spending.Score..1.100., circles=Mail1$Age, inch=.2, fg=NULL, bg=rainbow(length(Mail1$Age)),main="Age against Income and Spending")
Mail2<-Mail[1:198,2:5]
Mail2$Gender<-ifelse(Mail2$Gender=="Male",2,1)
#normalize
normalize <- function(x) {
  +     return ((x - min(x)) / (max(x) - min(x)))
  }
Mail3 <- as.data.frame(lapply(Mail2, normalize))
