add<-function(a,b){
    return(a+b)
}
subtract<-function(a,b){
    return(a-b)
}
multiply<-function(a,b){
    return(a*b)
}
divide<-function(a,b){
    if(b!=0){
        return(a/b)
    }else{
        return("cannot divide by zero !")
    }
}
calculator<-function(){
    cat("Simple Calculator in R\n")
    num1<-as.numeric(readline("Enter the first number:"))
    num2<-as.numeric(readline("Enter the second number:"))
    cat("1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\n")
    choice<-as.numeric(readline("Enter your choice(1-4):"))
    result<-switch(choice,
    "1"=add(num1,num2),
    "2"=subtract(num1,num2),
    "3"=multiply(num1,num2),
    "4"=divide(num1,num2),
    "invalid choice!"
    )
    cat("Result:",result,"\n")
}
calculator()