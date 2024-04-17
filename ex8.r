library(lattice)
library(caret)
library(randomForest)
data(iris)
iris$Species<-ifelse(iris$Species=="setosa","setosa","other")
set.seed(123)
validation_index<-createDataPartition(iris$Species,p=0.80,list=FALSE)
validation<-iris[-validation_index,]
dataset<-iris[validation_index,]
dataset$Species<-as.factor(dataset$Species)
x<-dataset[,1:4]
y<-dataset[,5]
rf_model<-randomForest(Species~.,data=dataset,ntree=500)
predictions_rf<-predict(rf_model,validation[,1:4])
conf_matrix_rf<-table(predictions_rf,validation$Species)
accuracy_rf<-sum(diag(conf_matrix_rf))/sum(conf_matrix_rf)
cat("Random Forest Confusion Matrix:\n",conf_matrix_rf,"\n")
cat("Random forest Accuracy:",accuracy_rf,"\n")
