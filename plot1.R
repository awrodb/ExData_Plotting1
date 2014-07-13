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
#Plot1
png(filename="plot1.png", bg = "transparent")
hist(sub2$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
