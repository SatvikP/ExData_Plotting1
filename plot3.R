power<- read.table("/Users/satvikputi/Desktop/datasciencecoursera/household_power_consumption.txt", skip = 1, sep = ";")
names(power)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
spower<- subset(power, power$Date == "1/2/2007"| power$Date == "2/2/2007")

spower$Date <- as.Date(spower$Date, format="%d/%m/%Y")
spower$Time <- strptime(spower$Time, format="%H:%M:%S")
spower[1:1440,"Time"] <- format(spower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
spower[1441:2880,"Time"] <- format(spower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot3.png",width = 480, height = 480)
plot(spower$Time,spower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(spower,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(spower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(spower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main = "Energy Submetering")

dev.off()
