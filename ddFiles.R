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
