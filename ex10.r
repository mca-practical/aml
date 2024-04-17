library(caret)
library(naivebayes)
library(e1071)
data(iris)
iris$Species<-ifelse(iris$Species=="setosa","setosa","other")
set.seed(123)
validation_index<-createDataPartition(iris$Species,p=0.80,list=FALSE)
validation<-iris[-validation_index,]
dataset<-iris[validation_index,]
dataset$Species<-as.factor(dataset$Species)
x<-dataset[,1:4]
y<-dataset[,5]
svm_model<-svm(Species~.,data=dataset,kernel="linear")
predictions_svm<-predict(svm_model,validation[,1:4])
conf_matrix_svm<-table(predictions_svm,validation$Species)
accuracy_svm<-sum(diag(conf_matrix_svm))/sum(conf_matrix_svm)
cat("SVM Confusion Matrix:\n",conf_matrix_svm,"\n")
cat("SVM Accuracy:",accuracy_svm,"\n")