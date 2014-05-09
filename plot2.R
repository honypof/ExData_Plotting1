#setwd("~/exdata-002")
data <- read.table("household_power_consumption.txt", sep =";", header= TRUE, colClasses = "character")
data <- data[data[,1] == "1/2/2007"|data[,1] == "2/2/2007", ]

GAP <- as.numeric(data$Global_active_power)
combTime <- paste0(data$Date, " ", data$Time)
time <- strptime(combTime, format ="%d/%m/%Y %H:%M:%S")

png(file="plot2.png")
plot(time, GAP, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()
