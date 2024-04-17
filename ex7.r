library(ggplot2)
library(lattice)
library(caret)
data(iris)
set.seed(123)
validation_index<-createDataPartition(iris$Species,p=0.80,list=FALSE)
validation<-iris[-validation_index,]
dataset<-iris[validation_index,]
dataset$Species<-as.factor(dataset$Species)
x<-dataset[,1:4]
y<-dataset[,5]
library(nnet)
logit_model<-multinom(Species~.,data=dataset)
predictions_logit<-predict(logit_model,validation[,1:4])
conf_matrix_logit<-table(predictions_logit,validation$Species)
accuracy_logit<-sum(diag(conf_matrix_logit))/sum(conf_matrix_logit)
cat("Logistic Regression Confusion Matrix:\n",conf_matrix_logit,"\n")
cat("Logistic Regression Accuracy:",accuracy_logit,"\n")



#correct 

library(caret)
library(nnet)
data(iris)
set.seed(123)
validation_index <- createDataPartition(iris$Species, p = 0.80, list = FALSE)
validation <- iris[-validation_index, ]
dataset <- iris[validation_index, ]
dataset$Species <- as.factor(dataset$Species)
logit_model <- multinom(Species ~ ., data = dataset)
predictions_logit <- predict(logit_model, validation)
conf_matrix_logit <- table(predictions_logit, validation$Species)
accuracy_logit <- sum(diag(conf_matrix_logit)) / sum(conf_matrix_logit)
cat("Logistic Regression Confusion Matrix:\n", conf_matrix_logit, "\n")
cat("Logistic Regression Accuracy:", accuracy_logit, "\n")

