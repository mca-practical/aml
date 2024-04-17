install.packages("caret")
library(ggplot2)
library(lattice)
library(caret)
library(class)
data(iris)
set.seed(123)
validation_index<-createDataPartition(iris$Species,p=0.80,list=FALSE)
validation<-iris[-validation_index,]
dataset<-iris[validation_index,]
dataset$Species<-as.factor(dataset$Species)
x<-dataset[,1:4]
y<-dataset[,5]
knn_model<-knn(train=x,test=validation[,1:4],cl=y,k=3)
conf_matrix_knn<-table(knn_model,validation$Species)
accuracy_knn<-sum(diag(conf_matrix_knn))/sum(conf_matrix_knn)
cat("k-NN Confusion Matrix:\n",conf_matrix_knn,"\n")
cat("k-NN Accuracy:",accuracy_knn,"\n")