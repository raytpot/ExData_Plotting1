#load the filtered data (only for 01/02 and 02/02/2007)
data <- read.table(file="./household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses=c(rep("character",2),rep("numeric",7)))

#open png device
png(filename="plot4.png")

#extract datetime
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#set mfcol to 2,2
par(mfcol = c(2,2))

#plot1 - Global Active Power against datetime
plot(datetime, data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="",main="")

#plot2 - 2 sub-meterings against datetime
with(data, {
  plot(datetime, Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",main="", col="black")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"), lwd=c(1,1,1), xjust=1, bty="n")

#plot3 - Voltage against datetime
plot(datetime, data$Voltage,type="l",ylab="Voltage",xlab="datetime",main="")

#plot4 - Global Reactive Power against datetime
plot(datetime, data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime",main="")

#close device
dev.off()
