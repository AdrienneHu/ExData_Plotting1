# Setting working directory
setwd("/Users/adrienne716/Desktop")

# Read the data, and transform date and time
data <- read.table("./household_power_consumption.txt", header = T, sep = ";", na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
twodays <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
DateTime <- strptime(paste(twodays$Date, twodays$Time), "%d/%m/%Y %H:%M:%S")

# Reconstruct plot 2 and save it as plot2.png
plot(DateTime,twodays$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)" )
dev.copy(png, file = "plot2.png", width =480, height = 480, units = "px") ## Copy the graph to the graphic device
dev.off() ## Close graphic device