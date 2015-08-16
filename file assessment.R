

pattern<-19940331
plot3<-function(pattern=""){
  files3<-sort(list.files("z:/documents/fdic_3",full.names=T))
  files2<-list.files("z:/documents/fdic_2",full.names=T)
  files2<-sort(files2[gsub("fdic_2","fdic_3",files2) %in% files3])
  if(!identical(gsub("fdic_2","fdic_3",files2),files3)){stop("filesets do not match")}
  stg3<-file.info(files3)
  stg2<-file.info(files2)
  dfftm<-function(n){
    ifelse(1<n,
           AA<-(difftime(file.info(files3)$mtime[n],file.info(files3)$mtime[n-1],units="secs")),
           AA<-(NA))
  }
  plotFrame<-data.frame(files=gsub("z:/documents/fdic_./","",files3),bytes=file.info(files3)$size,seconds=sapply(1:length(files3),dfftm))
  plotFrame<-plotFrame[grep(pattern,plotFrame[,"files"]),]
  write.csv(plotFrame,paste("Z:/Documents/convert/",pattern,'plotFrame.csv',sep=""))
  jpeg(paste("Z:/Documents/convert/",pattern,'plotFrame.jpg',sep=""))
  plot(plotFrame[,c("bytes","seconds")],main="converting files",sub=paste(pattern,pattern))
  dev.off()
  return(plotFrame)
}
plotFrame<-plot3("")
plotFrame[seq(1,nrow(plotFrame),length.out=10),]
plotFrame<-plot3("19921231")
plotFrame[seq(1,nrow(plotFrame),length.out=10),]
plotFrame<-plot3("19930331")
plotFrame[seq(1,nrow(plotFrame),length.out=10),]
plotFrame<-plot3("19930630")
plotFrame[seq(1,nrow(plotFrame),length.out=10),]
plotFrame<-plot3("19930930")
plotFrame[seq(1,nrow(plotFrame),length.out=10),]
plotFrame<-plot3("19931231")
plotFrame[seq(1,nrow(plotFrame),length.out=10),]
plotFrame<-plot3("19940331")
plotFrame[seq(1,nrow(plotFrame),length.out=10),]
plotFrame<-plot3("19940630")
plotFrame[seq(1,nrow(plotFrame),length.out=10),]
dfftm<-function(n){
  ifelse(1<n,
         AA<-(difftime(stg3$mtime[n],stg3$mtime[n-1],units="secs")),
         AA<-(NA))
}

sapply(1:nrow(stg3),dfftm)
stg3$size
plotFrame<-data.frame(bytes=stg3$size,seconds=sapply(1:nrow(stg3),dfftm))
plot(plotFrame)



files2<-list.files("z:/documents/fdic_2",full.names=T)
stg2<-file.info(files2)
mean(stg2$size)
DFtest<-read.csv(list.files("z:/documents/fdic_3",full.names=T)[1])
DFtest[seq(1,nrow(DFtest),length.out.10,]

plotQuarter<-function(datestamp){
  files3<-list.files("z:/documents/fdic_3",pattern=datestamp,full.names=T)
  files2<-list.files("z:/documents/fdic_2",full.names=T)
  files2<-files2[gsub("fdic_2","fdic_3",files2) %in% files3]
  stg3<-file.info(files3)
  stg2<-file.info(files2)
  
}
