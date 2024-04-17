set.seed(123)
time_points<-1:20
population<-cumsum(rnorm(length(time_points),mean=5,sd=2))
plot(time_points,population,type="l",col="green",
xlab="Time(days)",ylab="Population Size",
main="Population Growth Over Time")
average_growth_rate<-mean(diff(population)/diff(time_points))
cat("Average growth Rate:",round(average_growth_rate,2),"organisms/day\n")
peaks<-time_points[which(diff(sign(diff(population)))==-2)+1]
cat("Peaks observed at time points:",peaks,"\n")
subpopulation_threshold<-15
subpopulation<-population[population>subpopulation_threshold]
cat("Number of organisms with size>15:",length(subpopulation),"\n")
if(average_growth_rate>0){
    cat("The population is growing.\n")
}else if(average_growth_rate<0){
    cat("The population is decreasing.\n")
}else{
    cat("The population size remains constant.\n")
}