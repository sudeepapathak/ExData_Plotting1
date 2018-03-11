#Creating Histogram after reading power data
Power<-read.table("C:\\Users\\sudee\\Desktop\\coursera\\household_power_consumption.txt",skip=1,sep=";")
names(Power)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
febpower <- subset(Power,Power$Date=="1/2/2007" | Power$Date =="2/2/2007")
#create histogram
hist(as.numeric(as.character(febpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
#add title
title(main="Global Active Power")
