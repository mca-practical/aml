data <-c(10,15,20,25,30)
mean_value<-mean(data)
print(mean_value)
median_value<-median(data)
print(mean_value)
calculate_mode<-function(x){
    uniq_x<-unique(x)
    freq<-table(x)
    mode_values<-uniq_x[which(freq==max(freq))]
    return(mode_values)
}
data<-c(10,15,20,25,30,15,20,25,20)
mode_values<-calculate_mode(data)
print(mode_values)
summary(data)