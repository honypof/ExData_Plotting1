#setwd("~/exdata-002")
data <- read.table("household_power_consumption.txt", sep =";", header= TRUE, colClasses = "character")
data <- data[data[,1] == "1/2/2007"|data[,1] == "2/2/2007", ]

GAP <- as.numeric(data$Global_active_power)

png(file="plot1.png")
hist(GAP,breaks = 20, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col= "red")
dev.off()
