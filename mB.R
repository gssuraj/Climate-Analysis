part.00000 <- read.delim("/home/cloudera/Desktop/climate/part-00000?op=OPEN&namenoderpcaddress=quickstart.cloudera:8020&offset=0", header=FALSE)
barplot(((part.00000$V2-32)*(5/9)),xlab="Months", ylab="Temperature in centigrade",names.arg=c((part.00000$V1%%100)))

