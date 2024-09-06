# Mustafa Anjrini on 06.09.2024

rm(list = ls())

n_s<- function(x,knots){
  
  # creating the whole knots in a vector
  kn<-c(min(x),knots,max(x))
  k<- length(kn)
  
  # creating a matrix to calculate the value of (x-epsilon)
  # which is equal x-epsilon if x> epsilon and 0 otherwise
  m<- matrix(rep(0,length(x)*(k-1)),ncol = k-1)
  
  for (i in 1:(k-1)) {
    m[x>kn[i],i]<-x[x>kn[i]]-kn[i]
  }
  
  #for the calculation of the N(x) basis functions we first
  #calculate the d{K-1}(x) (the one before last knot)
  d_e<- m[,k-1]^3/(kn[k]-kn[k-1])
  
  #then calulating the basis functions of a natural spline
  # from N3(x) till N{k+2}(x)
  d<-matrix(rep(0,(k-2)*length(x)),ncol = k-2)
  for (i in 1:(k-2)) {
    d[,i]<-(m[,i]^3)/(kn[k]-kn[i])-d_e
  }
  # return the matrix including the N2(x)
  return(cbind(x,d))
}



library(ISLR2)
library(splines)

df<-Wage
df<- df[order(df$age),]
x<-df$age

knots<- c(30,40,50,60)

lm_1<- lm(df$wage~n_s(x,knots))
lm_2<- lm(wage~ns(x = x,knots = knots),data = df)
lm_1$fitted.values[70:75]
lm_2$fitted.values[70:75]

plot(lm_1$fitted.values,type = "l")
lines(lm_2$fitted.values,col="red")
