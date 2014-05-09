#setwd("~/exdata-002")
data <- read.table("household_power_consumption.txt", sep =";", header= TRUE, colClasses = "character")
data <- data[data[,1] == "1/2/2007"|data[,1] == "2/2/2007", ]

combTime <- paste0(data$Date, " ", data$Time)
time <- strptime(combTime, format ="%d/%m/%Y %H:%M:%S")

GAP <- as.numeric(data$Global_active_power)
Vol <- as.numeric(data$Voltage)
SM1 <- as.numeric(data$Sub_metering_1)
SM2 <- as.numeric(data$Sub_metering_2)
SM3 <- as.numeric(data$Sub_metering_3)
GRP <- as.numeric(data$Global_reactive_power)

png(file="plot4.png")
par(mfrow =c(2,2))
plot(time, GAP, type = "l", xlab="", ylab = "Global Active Power")
plot(time, Vol, type = "l", xlab = "datetime", ylab = "Voltage")
plot(time, SM1, type = "l", xlab="", ylab = "Energy sub metering")
lines(time, SM2, type = "l", col="red")
lines(time, SM3, type = "l", col="blue")
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), bty="n", lty =c(1,1,1), col=c('black','red','blue'))
plot(time, GRP, type ="l", xlab="datetime", ylab = "Global_reactive_power")
dev.off()
