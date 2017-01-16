data_full <- read.table("household_power_consumption.txt", header = T, sep=";", stringsAsFactors = F)
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
data_2days <- subset(data_full, Date >= "2007-02-01" & Date <= "2007-02-02")
data_2days$Time <- strptime(paste(as.character(data_2days$Date), data_2days$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
### plot 1
png("plot1.png")
hist(as.numeric(data_2days$Global_active_power), col="red", 
     main = "Global Active Power",
     xlab = "Global Active Power (Kilowatts)")
dev.off()
