quarterpath<-"C:/Users/Josh/Documents/All_Reports_20140930"
folder.variables<-function(quarterpath){
  resetwd<-getwd()
  setwd(quarterpath)
  varnames<-function(n){
    as.matrix(colnames(read.csv(list.files()[n],row.names = NULL)))
  }
  return(sort(unique(unlist(lapply(1:length(list.files()),varnames)))))
  setwd(resetwd)
}