#load the filtered data (only for 01/02 and 02/02/2007)
data <- read.table(file="./household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses=c(rep("character",2),rep("numeric",7)))

#open png device
png(filename="plot3.png")

#extract datetime
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#plot graph of 3 sub-meterings against datetime 
with(data, {
  plot(datetime, Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",main="", col="black")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
})

#add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"), lwd=c(1,1,1), xjust=1)

#close device
dev.off()
