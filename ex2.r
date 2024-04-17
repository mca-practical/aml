data(mtcars)
linear_model<-lm(mpg~hp,data=mtcars)
summary(linear_model)
predictions<-predict(linear_model,newdata=data.frame(hp=c(150,200,250)))
print(predictions)
multiple_linear_model<-lm(mpg~hp+wt+qsec,data=mtcars)
summary(multiple_linear_model)
new_data<-data.frame(hp=c(150,200,250),wt=c(2.5,3.0,3.5),qsec=c(15,16,17))
predictions_multiple<-predict(multiple_linear_model,newdata=new_data)
print(predictions_multiple)