#load the filtered data (only for 01/02 and 02/02/2007)
data <- read.table(file="./household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses=c(rep("character",2),rep("numeric",7)))

#open png device
png(filename="plot2.png")

#extract datetime
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#plot graph of Global Active Power against datetime
plot(datetime, data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="",main="")

#close device
dev.off()
