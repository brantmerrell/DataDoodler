ddFiles<-list.files("./DataDoodler",
                    full.names=TRUE,
                    recursive=TRUE) # Large character (5046 elements, 773.4 kb)
ddFiles<-ddFiles[0<file.info(ddFiles)$size] # Large character (5020 elements, 769.2 kb)
LINE<-readLines(ddFiles[1])
DF<-data.frame(file=ddFiles[1], lineID=1:length(LINE), line=LINE)
for(n in 2:length(ddFiles)){
  LINE<-readLines(ddFiles[n])
  DF<-rbind(DF,
            data.frame(file=ddFiles[n], 
                       lineID=1:length(LINE),
                       line=LINE))
}
nrow(DF)
length(levels(DF$file))
length(unique(DF$lineID))
max(DF$lineID)
length(levels(DF$line))
sum(DF$line=="") # [1] 68018
sum(DF$line==" ") # [1] 613
hist(nchar(levels(DF$line)))
sum(3e+05<nchar(levels(DF$line)))
quantile(nchar(as.character(DF$line)), seq(0,1,.05))
DF<-DF[DF$line!="",] # 595307 obs. of 3 variables
quantile(nchar(as.character(DF$line)), seq(0,1,.05))
ddFiles<-ddFiles[!grepl("node|bower",ddFiles)]
colnames(DF)
DF<-DF[DF[,"file"] %in% ddFiles,] # 5774 obs. of 3 variables
write.csv(DF,"./DataDoodler/ddDocsCompiled.csv",row.names=FALSE)
length(levels(DF[,"file"])) # [1] 5029
length(unique(as.character(DF[,"file"]))) # [1] 69
View(DF[grepl("\\.js$",DF[,1]),])
sum(grepl("\\.js$",DF[,"file"])) # [1] 651
sum(grepl("\\.css$",DF[,"file"])) # [1] 293
sum(grepl("\\.html$",DF[,"file"])) # [1] 202
sum(!grepl("(\\.html$)|(\\.css$)|(\\.js$)",DF[,"file"])) # [1] 4628
otherPattern<-"(\\.html$)|(\\.css$)|(\\.js$)"
otherType<-which(!grepl(otherPattern,DF[,"file"])) # int [1:4628]
DF[otherType[seq(1,4628,length.out=20)],"file"]
sum(grepl("ddDocsCompiled.csv",DF[,"file"])) # 2870
otherPattern<-paste(otherPattern,"|(\\.csv$)",sep="")
otherType<-which(!grepl(otherPattern,DF[,"file"])) # int [1:1758]
DF[otherType[seq(1,1758,length.out=20)],"file"]
otherPattern<-paste(otherPattern,"|(\\.R$)",sep="")
otherType<-which(!grepl(otherPattern,DF[,"file"])) # int [1:1562]
DF[otherType[seq(1,1562,length.out=20)],"file"]
otherPattern<-paste(otherPattern,"|(\\.sublime-workspace$)",sep="")
otherType<-which(!grepl(otherPattern,DF[,"file"])) # int [1:425]
DF[otherType[seq(1,425,length.out=20)],"file"]
otherPattern<-paste(otherPattern,"|(\\.pdf$)",sep="")
otherType<-which(!grepl(otherPattern,DF[,"file"])) # int [1:294]
DF[otherType[seq(1,294,length.out=20)],"file"]
otherPattern<-paste(otherPattern,"|(\\.json$)|(\\.svg$)|(\\.ejs$)",sep="")
otherType<-which(!grepl(otherPattern,DF[,"file"])) # int [1:45]
DF[otherType[seq(1,45,length.out=20)],"file"]
otherPattern<-paste(otherPattern,"|(\\.md$)|(\\.png$)|(\\.sublime-project$)",sep="")
otherType<-which(!grepl(otherPattern,DF[,"file"])) # int [1:7]
DF[otherType,"file"] # [7] /DataDoodler/bin/www
# induced function:
Files<-as.vector(DF[,"file"])
fileTypeCount<-function(Files){
  if(class(Files)=="factor"){
    Files<-as.vector(Files)
  }
  Files<-Files[grepl("\\.",Files)]
  fileTypes<-strsplit(Files,"\\.")
  for(n in 1:length(fileTypes)){
    fileTypes[[n]]<-fileTypes[[n]][length(fileTypes[[n]])]
  }
  fileTypes<-unlist(fileTypes)
  df<-data.frame(matrix(nrow=1,ncol=length(unique(fileTypes))))
  names(df)<-unique(fileTypes)
  for(fileType in unique(fileTypes)){
    df[1,fileType]<-sum(grepl(paste("\\.",fileType,"$",sep=""),Files))
  }
  df
}
fileTypeCount(DF[,"file"])
