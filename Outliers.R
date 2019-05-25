# Plot of data with outliers.
par(mfrow=c(1, 2))
plot(cars2$speed, cars2$dist, xlim=c(0, 28), ylim=c(0, 230), main="With Outliers", xlab="speed", ylab="dist", pch="*", col="red", cex=2)
abline(lm(dist ~ speed, data=cars2), col="blue", lwd=3, lty=2)



lh <- quantile(Mail1$Annual.Income..k..,probs=0.25)
uh <- quantile(Mail1$Annual.Income..k..$,probs=0.75)
step<- 1.5 * (uh-lh)
