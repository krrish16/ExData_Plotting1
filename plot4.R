##reading
data <- read.table("household_power_consumption.txt", header = T,sep = ";", na.strings = "?")
                   
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#subsetting
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

data$date_time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

data$date_time <- as.POSIXct(data$date_time)

#plotting
par(mfrow = c(2, 2))
plot(Global_active_power ~ date_time, type = "l", ylab = "Global Active Power",xlab = "")
plot(Voltage ~ date_time, type = "l")
plot(Sub_metering_1 ~ date_time, type = "l", ylab = "Energy sub metering",xlab = "")
lines(Sub_metering_2 ~ date_time, col = "Red")
lines(Sub_metering_3 ~ date_time, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(Global_reactive_power ~ date_time, type = "l")
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
