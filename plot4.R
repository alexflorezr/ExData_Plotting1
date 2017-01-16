data_full <- read.table("household_power_consumption.txt", header = T, sep=";", stringsAsFactors = F)
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
data_2days <- subset(data_full, Date >= "2007-02-01" & Date <= "2007-02-02")
data_2days$Time <- strptime(paste(as.character(data_2days$Date), data_2days$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
### plot 4
png("plot4.png")
par(mfrow=c(2,2), mar=c(4,5,4,2))
plot(data_2days$Time, data_2days$Global_active_power, type="l", 
     ylab = "Global Active Power (Kilowatts)", 
     xlab=NA)
plot(data_2days$Time, data_2days$Voltage, type="l", 
     ylab = "Voltage", 
     xlab="datetime")
plot(data_2days$Time, data_2days$Sub_metering_1, type="l", 
     ylab = "Energy sub metering", 
     xlab=NA)
lines(data_2days$Time, data_2days$Sub_metering_2, col="red")
lines(data_2days$Time, data_2days$Sub_metering_3, col="blue")
legend("topright", colnames(data_2days)[c(7,8,9)], lty= 1, lwd=2, col=c("black", "red", "blue"),bty = "n")
plot(data_2days$Time, data_2days$Global_reactive_power, type="l", 
     ylab = "Voltage", 
     xlab="datetime")
dev.off()