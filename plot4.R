#Syntax for Exploratory data analysis, course project 1
#8/8/15

#Plot 4
setwd("C:/Users/ellen.foster/Documents/Analytic Projects/Writeups and Examples/Exploratory Data Analysis")
project <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Select dates of interest
small <- project[project$Date == "1/2/2007" | project$Date == "2/2/2007", ]

#Format Global Active Power variable
small$Global_active_power <- as.numeric(small$Global_active_power)

#Combine & format date and time variables for plot x-axis
combo <- paste(small$Date, small$Time)
small$Datetime <- strptime(combo, "%d/%m/%Y %H:%M:%S")

#Create plot
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(small$Datetime, small$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(small$Datetime, small$Voltage, type = "l", xlab = "datetime", ylab="Voltage")
plot(small$Datetime, small$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
       lines(small$Datetime, small$Sub_metering_2, col = "red")
       lines(small$Datetime, small$Sub_metering_3, col = "blue")
       legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(small$Datetime, small$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
              