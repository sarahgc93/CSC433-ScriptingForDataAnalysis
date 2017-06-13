###PART 1###

#Define a Constructer 
ChlorReads<-function(theID,theName,theGender,theLdl,theHdl,theTrigl){
  theObject<-list(id=theID,name=theName,gender=theGender, ldl=theLdl,hd=theHdl,trigl=theTrigl)
  class(theObject)="ClorReads"
  return(theObject)
}
#make an example for testing
p1 <- ChlorReads(9876, "Virgil", "M", 248, 45, 148)



###PART2###

#Make a print function
print.ChlorReads<-function(theObject){
  #Define symbols to use in printing
  if(theObject$ldl >= 240){
    sym1= "*"
  } else if(theObject$ldl >= 200){
    sym1="+"
  } else{
    sym1=" "
  }
  if(theObject$hd >= 60){
    sym2=" "
  } else if(theObject$hd >=40){
    sym2= "+"
  } else{
    sym2= "*"
  }
  if(theObject$trigl >= 200){
    sym3= "*"
  } else if(theObject$trigl >= 150){
    sym3= "+"
  } else{
    sym3= " "
  }
  
  #Create new variables using our original variable and the new symbol
  newLDL<-paste0(theObject$ldl,sym1,collapse = NULL)
  newHd<-paste0(theObject$hd,sym2, collapse = NULL)
  newTri<-paste0(theObject$trigl,sym3)
  
  #return all the things we want
  cat("ID:",theObject$id,"Name:",theObject$name,"Gender:",theObject$gender,"LDL:",newLDL,"HDL:",newHd,"Triglycerides:",newTri,"\n")
}


###PART 3###

plot.ChlorReads<-function(theObject){
  barplot(height=c(theObject$ldl,theObject$hd,theObject    $trigl),names.arg=c("LDL","HDL","Trigl"),main='CHLORESTEROL READING',sub=paste("Id:",theObject$id,"Name:",theObject$name,"Gender:",theObject$gender))
}


###PART 4 ###

#define default methods and errors
getPatientInfo<-function(theObject){
UseMethod("getPatientInfo",theObject)
}
getChloresterol<-function(theObject){
UseMethod("getChloresterol",theObject)
}
getPatientInfo.default<-function(theObject){
warning("Default getPatientInfo method ","called with unrecognized object")
return(theObject)
}


getChloresterol.default<-function(theObject){
warning("Default getChloresterolInfo method ","called with unrecognized object")
return(theObject)
}


getPatientInfo.ChlorReads3<-function(theObject){   
cat("ID  Name  Gender","\n",theObject$id,theObject$name,theObject$gender)}


getChloresterol.ChlorReads3<-function(theObject){
cat("LDL HDL Trigl","\n",theObject$ldl,theObject$hd,theObject$trigl)
}





#####Part 5#####

#Set working directory so I can access my file
setwd("/Users/sarahcummings/Documents/csc433/RData")
chlor <- read.table("chlor-reads.txt")
#initialilize 1st


#create a list
lst <- NULL

for(i in 1:nrow(chlor)) {
lst<- ChlorReads(chlor[i, ]$id, as.character(chlor[i, ]$name),as.character(chlor[i, ]$gender), chlor[i, ]$ldl, chlor[i, ]$hdl, chlor[i, ]$trigl)
}

#print all of the items in the list

for(i in lst){
print.ChlorReads(i)
}

#plot graphs for each item

for(i in lst){
plot.ChlorReads(i)
}
