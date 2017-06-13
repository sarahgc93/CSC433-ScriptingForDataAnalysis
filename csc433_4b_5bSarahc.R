#CSC 4334b
#set my working directory to where i have the baylor text file
setwd('\\Users\\sarahcummings\\Documents\\csc433\\RData')

#read in all of the file as fixed-width with dummy variables 
baylor3<-read.fwf('baylor-religion-survey-data-2007.txt', widths=c(17,2,308,1,31,1,83),col.names =c('d1','RELIGION','d2','HAPPYLOVE','d3','GENDER','d4')


#get rid of all of the observations with religions we don't want

keep <- c(16,12,45,46)

baylorSubset<-subset(baylor3, RELIGION %in% keep)

#get rid of all the observations with n/a 
baylorSubset2<- na.omit(baylorSubset)

#get ride of the columns we don't end up using for the graph
baylorSubset3<- subset(baylorSubset2, select= c('RELIGION','HAPPYLOVE'))

#create a frequency table by factors
all.counts=table(baylorSubset3)

#create the barplot for the happiness levels by religion
barplot(all.counts, names.arg = c("1","2","3"), main="Stacked Bar Charts of Happiness levels", xlab="Happiness Level", ylab="Count", beside = TRUE, col=rainbow(4))

setwd("/Users/sarahcummings/Documents/csc433/RData/")

                                                                                                    readStatesData3 <- function(v){
                                                                                                    state<-readLines(con=v,n=1) 
                                                                                                    table<-read.table(v, skip=1, sep=',') 
                  list1<-list(state,table)
                  return(list1)
                                                                                                    }

#create an empty list to add our state lists to
list <- list()

#begin the for loop that will create our list of lists
#ignore and keep running if errors

for(i in 1:50){
  tryCatch({
    file<-(paste("state",i,".txt",sep=""))  
    list<-c(list, readStatesData3(file))
  }, error=function(e){})
}

#return the final list
list


#my final list was successfully created with 102 items









