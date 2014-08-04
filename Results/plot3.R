# Setting working directory
setwd("/Users/adrienne716/Desktop/Summer/Coursera/ExploratoryDataAnalysis/household_power_consumption")

# Read the data, and transform date and time
data <- read.table("./household_power_consumption.txt", header = T, sep = ";", na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
twodays <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
DateTime <- strptime(paste(twodays$Date, twodays$Time), "%d/%m/%Y %H:%M:%S")

# Reconstructing plot 3 and save it as plot3.png
plot(DateTime,twodays$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(DateTime,twodays$Sub_metering_2, col = "red", type = "l")
lines(DateTime,twodays$Sub_metering_3, col = "blue",type = "l")
legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png", width =643, height = 406, units = "px") ## Copy the graph to the graphic device
dev.off() ## Close graphic device

