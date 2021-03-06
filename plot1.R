##reading data

data <- read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
#head(data)

##subsetting data
sub_data <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")


##Plotting
hist(sub_data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()