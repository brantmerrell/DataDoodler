ddFiles<-list.files("./DataDoodler",
                    full.names=TRUE,
                    recursive=TRUE) # Large character (5045 elements, 773.4 kb)
hist(nchar(ddFiles))
ddFiles<-ddFiles[0<file.info(ddFiles)$size] # Large character (5045 elements, 773.4 kb)
LINE<-readLines(ddFiles[1])
DF<-data.frame(file=ddFiles[1], lineID=1:length(LINE), line=LINE)
for(n in 2:length(ddFiles)){
  LINE<-readLines(ddFiles[n])
  DF<-rbind(DF,
            data.frame(file=ddFiles[n], 
                       lineID=1:length(LINE),
                       line=LINE))
}
## Error @ n=1920L:
# "./DataDoodler/node_modules/gulp-jscs/node_modules/jscs/node_modules/prompt/node_modules/
# utile/node_modules/ncp/test/fixtures/src/c"
file.info(ddFiles[1920])$size
readLines(ddFiles[1920])
readLines(ddFiles[1921])
readLines(ddFiles[1922])
readLines(ddFiles[1923])
readLines(ddFiles[1924])
for(n in 1924:length(ddFiles)){
  LINE<-readLines(ddFiles[n])
  DF<-rbind(DF,
            data.frame(file=ddFiles[n], 
                       lineID=1:length(LINE),
                       line=LINE))
}
## Error @ n=1925L:
# "./DataDoodler/node_modules/gulp-jscs/node_modules/jscs/node_modules/
# prompt/node_modules/utile/node_modules/ncp/test/fixtures/src/sub/b"
for(n in 1926:length(ddFiles)){
  LINE<-readLines(ddFiles[n])
  DF<-rbind(DF,
            data.frame(file=ddFiles[n], 
                       lineID=1:length(LINE),
                       line=LINE))
}
## Error @ n=3577L:
# "./DataDoodler/node_modules/gulp-jshint/node_modules/rcloader/node_modules
# /rcfinder/test/fixtures/foo/foo/foo/foo/root"
readLines(ddFiles[3577])
readLines(ddFiles[3578])
for(n in 3578:length(ddFiles)){
  LINE<-readLines(ddFiles[n])
  DF<-rbind(DF,
            data.frame(file=ddFiles[n], 
                       lineID=1:length(LINE),
                       line=LINE))
}
## Error @ n=3582L:
readLines(ddFiles[3582])
readLines(ddFiles[3583])

for(n in 3583:length(ddFiles)){
  LINE<-readLines(ddFiles[n])
  DF<-rbind(DF,
            data.frame(file=ddFiles[n], 
                       lineID=1:length(LINE),
                       line=LINE))
}
## Error @ n=4122L:
readLines(ddFiles[4122])
readLines(ddFiles[4123])
readLines(ddFiles[4124])
for(n in 4124:length(ddFiles)){
  LINE<-readLines(ddFiles[n])
  DF<-rbind(DF,
            data.frame(file=ddFiles[n], 
                       lineID=1:length(LINE),
                       line=LINE))
}
## Error @ n=4125L:
readLines(ddFiles[4125])
readLines(ddFiles[4126])
for(n in 4126:length(ddFiles)){
  LINE<-readLines(ddFiles[n])
  DF<-rbind(DF,
            data.frame(file=ddFiles[n], 
                       lineID=1:length(LINE),
                       line=LINE))
}
?quantile
quantile(file.info(ddFiles[1:5045])$size,probs=c(.01))

hist(nchar(DF$line))
length(levels(DF$line))
hist(nchar(levels(DF$line)))
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
