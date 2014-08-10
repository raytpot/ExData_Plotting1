#load the filtered data (only for 01/02 and 02/02/2007)
data <- read.table(file="./household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses=c(rep("character",2),rep("numeric",7)))

#open png device
png(filename="plot1.png")

#draw the histogram of Global Active Power
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#close device
dev.off()
