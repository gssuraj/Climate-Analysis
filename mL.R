temp <- read.delim("/home/cloudera/Desktop/climate/part-00000?op=OPEN&namenoderpcaddress=quickstart.cloudera:8020&offset=0", header=FALSE)
plot(((temp$V2-32)*(5/9)),xlab="Months", ylab="Temperature in centigrade",type="o", col="black")

