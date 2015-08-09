#Syntax for Exploratory data analysis, course project 1
#8/8/15

#Plot 1
setwd("C:/Users/ellen.foster/Documents/Analytic Projects/Writeups and Examples/Exploratory Data Analysis")
project <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Select dates of interest
small <- project[project$Date == "1/2/2007" | project$Date == "2/2/2007", ]

#Format Global Active Power variable
small$Global_active_power <- as.numeric(small$Global_active_power)

#Create plot
png(filename = "plot1.png", width = 480, height = 480)
hist(small$Global_active_power, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

