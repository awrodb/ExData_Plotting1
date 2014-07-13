a<-read.csv2("household_power_consumption.txt")
a$Date<-as.vector(a$Date)
a$Time<-as.vector(a$Time)
a$Time<-paste(a$Date, a$Time, sep=" ")
a$Date<-as.Date(a$Date, "%d/%m/%Y")
a$Time<-strptime(a$Time, "%d/%m/%Y %H:%M:%S")
sub2<-subset(a, a$Date >= "2007-02-01")
sub2<-subset(sub2, sub2$Date <= "2007-02-02")
d<-(dim(sub2))
for(i in 3:d[2]){
        sub2[,i]<-as.vector(sub2[,i])
        sub2[,i]<-as.numeric(sub2[,i])    
}

#Plot3
png(filename="plot3.png",  bg = "transparent")
plot(sub2$Time,sub2$Sub_metering_1,main="", xlab = " " , ylab = "Energy sub metering", ylim=range(c(sub2$Sub_metering_1, sub2$Sub_metering_2, sub2$Sub_metering_3)),type="l",col=1)
lines(sub2$Time,sub2$Sub_metering_2,type="l",pch=2,col=2)
lines(sub2$Time,sub2$Sub_metering_3,type="l",pch=3,col=4)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c(1,2,4))
dev.off()
