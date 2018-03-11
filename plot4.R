#four power data graphs
Power<-read.table("C:\\Users\\sudee\\Desktop\\coursera\\household_power_consumption.txt",skip=1,sep=";")
names(Power)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
febpower <- subset(Power,Power$Date=="1/2/2007" | Power$Date =="2/2/2007")
#Transform Date and Time
febpower$Date <- as.Date(febpower$Date, format="%d/%m/%Y")
febpower$Time <- strptime(febpower$Time, format="%H:%M:%S")
febpower[1:1440,"Time"] <- format(febpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
febpower[1441:2880,"Time"] <- format(febpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
#plotting graph 
#creating a 2 by 2 matrix of graphs
par(mfrow=c(2,2))
#constructing four graphs
plot(febpower$Time,as.numeric(as.character(febpower$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
plot(febpower$Time,as.numeric(as.character(febpower$Voltage)), type="l",xlab="datetime",ylab="Voltage")
plot(febpower$Time,febpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(febpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(febpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="green"))
with(febpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="red"))
legend("topright", lty=1, col=c("black","green","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
plot(febpower$Time,as.numeric(as.character(febpower$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
