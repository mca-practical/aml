library(caret)
library(rpart)
data(iris)
set.seed(123)
validation_index<-createDataPartition(iris$Species,p=0.80,list=FALSE)
validation<-iris[-validation_index,]
dataset<-iris[validation_index,]
dataset$Species<-as.factor(dataset$Species)
x<-dataset[,1:4]
y<-dataset[,5]
tree_model<-rpart($Species~.,data=dataset)
predictions_tree<-predict(tree_model,validation[,1:4],type="class")
conf_matrix_tree<-table(predictions_tree,validation$Species)
accuracy_tree<-sum(diag(conf_matrix_tree))/sum(conf_matrix_tree)
cat("Decision Tree Confusion Matrix:\n",conf_matrix_tree,"\n")
cat("Decision Tree Accuracy:",accuracy_tree,"\n")