#CSC433 Assignment 6

mycbind<-function(X,Y){
  newRowCount<-sqrt(length(X))
  newColCount<-(2*newRowCount)
  vect<-c(X[,1])
  for(i in 2:newRowCount){
    vect<-c(vect,X[,i])
  }
  for(i in 1:newRowCount){
    vect<-c(vect,Y[,i])
  }
  newMatrix<-matrix(vect,nrow = newRowCount,ncol = newColCount)
  return(newMatrix)
}


points1<-c()
points2<-c()

for(i in c(200,400,600,800,1000,1200,1400,1600,1800)){
  X1<-matrix(runif(i *i), i, i)
  Y1<-matrix(runif(i *i), i, i)
  time1<-system.time(mycbind(X1,Y1),gcFirst = TRUE)
  newpoint<-time1[3]
  points1<-c(points1, newpoint)
  
  time2<-system.time(cbind(X1,Y1),gcFirst = TRUE)
  newpoint2<-time1[3]
  points2<-c(points2,newpoint2)
  
  plot.default(points1, main = "Timing of MyCBind Function",ylab = "Time (s)")
  plot.default(points2, main = "Timing of CBind Function", ylab = "Time(s)")

  
}





