DF<-read.csv(list.files("Z:/documents/fdic_2",pattern="\\.csv$",full.names=T)[1])
DF[seq(1,nrow(DF),length.out=5),seq(1,ncol(DF),length.out=5)]
## row.number, VarName_cert=,repdte,Value,VarName,cert 

convertVar<-function(Col){
  if(class(Col) %in% c("numeric","integer")){VarName<-colnames(DF)[Col]}
  data.frame(VarName_cert=paste(VarName,as.vector(DF[,"cert"]),sep="_"),
             repdte=strptime(DF[,"repdte"],format="%m/%d/%Y"),
             Value=as.vector(DF[,Col]),
             VarName=VarName,
             cert=as.vector(DF[,"cert"]))
}
convertDF<-function(DF){
  AA<-convertVar(1)
  for(m in 2:ncol(DF)){
    AA<-rbind(AA,convertVar(m))
  }
  AA<-cbind(row.names=seq(1,nrow(AA)),AA)
  AA
}

length(list.files("Z:/documents/fdic_2",pattern="\\.csv$",full.names=T))
for(File in list.files("Z:/documents/fdic_2",pattern="\\.csv$",full.names=T)){
  print(c(File,paste(Sys.time())))
  if(exists("DF")){rm(DF)}
  if(exists("DF2")){rm(DF2)}
  DF<-read.csv(File)
  DF2<-convertDF(DF)
  write.csv(DF2,gsub("fdic_2","fdic_3",File))
  print(c(gsub("fdic_2","fdic_3",File),paste(Sys.time())))
}
DF<-read.csv("Z:/documents/fdic_2/All_Reports_19921231_- Past Due and Nonaccrual Loans Wholly or Partially US Gvmt Guaranteed.csv")
View(DF)
