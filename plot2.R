#Syntax for Exploratory data analysis, course project 1
#8/8/15

#Plot 2
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
png(filename = "plot2.png", width = 480, height = 480)
plot(small$Datetime, small$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()