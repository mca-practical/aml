library(caret)
data(iris)
dataset<-iris
filename<-"iris.csv"
dataset<-read.csv(filename,header=FALSE)
colnames(dataset)<-c("Sepal.Width","Petal.Length","Petal.Width","Species")
validation_index<-create DataPartition(dataset$Species,p=0.80,list=FALSE)
validation<-dataset[-validation_index]
dataset<-dataset[validation_index,]
dim(dataset)
sapply(dataset,class)
dataset$Species<-as.factor(dataset$Species)
levels(dataset$Species)
summary(dataset)
x<-dataset[,1:4]
y<-dataset[,5]
par(mfrow=c(1,4))
for(i in 1:4){
    boxplot(x[,i],main=names(iris)[i])
}
plot(y)

#new
data(iris)
str(iris)
head(iris)
summary(iris)
plot(iris$Sepal.Length, iris$Sepal.Width, col = iris$Species, 
     xlab = "Sepal Length", ylab = "Sepal Width", main = "Sepal Length vs. Sepal Width")
boxplot(Petal.Length ~ Species, data = iris, main = "Petal Length by Species", 
        xlab = "Species", ylab = "Petal Length")
pairs(iris[, 1:4], col = iris$Species, pch = 19, main = "Pairplot of Iris Dataset")
hist(iris$Sepal.Length, main = "Histogram of Sepal Length", xlab = "Sepal Length")
hist(iris$Sepal.Width, main = "Histogram of Sepal Width", xlab = "Sepal Width")
hist(iris$Petal.Length, main = "Histogram of Petal Length", xlab = "Petal Length")
hist(iris$Petal.Width, main = "Histogram of Petal Width", xlab = "Petal Width")

