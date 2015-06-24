ddFiles<-list.files("./DataDoodler",
                    full.names=TRUE,
                    recursive=TRUE) # Large character (5045 elements, 773.4 kb)
ddFiles<-ddFiles[0<file.info(ddFiles)$size] # Large character (5019 elements, 769.2 kb)
LINE<-readLines(ddFiles[1])
DF<-data.frame(file=ddFiles[1], lineID=1:length(LINE), line=LINE)
for(n in 2:length(ddFiles)){
  LINE<-readLines(ddFiles[n])
  DF<-rbind(DF,
            data.frame(file=ddFiles[n], 
                       lineID=1:length(LINE),
                       line=LINE))
}
nchar(DF)
nrow(DF)
length(levels(DF$file))
length(unique(DF$lineID))
max(DF$lineID)
length(levels(DF$line))
sum(DF$line=="") # [1] 68018
sum(DF$line==" ") # [1] 613
hist(nchar(levels(DF$line)))
sum(3e+05<nchar(levels(DF$line)))
large<-which(3e+05<nchar(as.character(DF$line)))
normal<-which(nchar(as.character(DF$line))<=3e+05)
DF[large,"file"]
hist(nchar(as.character(DF[normal,"line"])))
large<-which(50000<nchar(as.character(DF$line)))
normal<-which(nchar(as.character(DF$line))<=50000)
hist(nchar(as.character(DF[normal,"line"])))
rm(large,normal)
quantile(nchar(as.character(DF$line)), seq(0,1,.01))
DF<-DF[nchar(as.character(DF$line))!=0,]
quantile(nchar(as.character(DF$line)), seq(0,1,.01))
small<-which(nchar(as.character(DF$line))<=20)
huge<-which(500<nchar(as.character(DF$line)))
hist(nchar(as.character(DF[-c(small,huge),"line"])))
rm(LINE,huge,lineID,n,small)
ddFiles<-ddFiles[!grepl("node|bower",ddFiles)]
LINE<-readLines(ddFiles[1])
DF<-data.frame(file=ddFiles[1], lineID=1:length(LINE), line=LINE)
for(n in 2:length(ddFiles)){
  LINE<-readLines(ddFiles[n])
  DF<-rbind(DF,
            data.frame(file=ddFiles[n], 
                       lineID=1:length(LINE),
                       line=LINE))
}
DF<-DF[as.character(DF$line)!="",]
View(DF)
write.csv(DF,"./DataDoodler/ddDocsCompiled.csv",row.names=FALSE)
View(DF[grepl("\\.js$",DF[,1]),])
length(DF[grepl("\\.js$",DF[,1]),3])
as.character((DF[grepl("\\.js$",DF[,1]),3])[seq(1,651,length.out=20)+1])
