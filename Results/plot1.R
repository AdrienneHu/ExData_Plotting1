# Setting working directory
setwd("/Users/adrienne716/Desktop/Summer/Coursera/ExploratoryDataAnalysis/household_power_consumption")

# Read the data, and transform date and time
data <- read.table("./household_power_consumption.txt", header = T, sep = ";", na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
twodays <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
DateTime <- strptime(paste(twodays$Date, twodays$Time), "%d/%m/%Y %H:%M:%S")


# Reconstruct plot 1 and save it as plot1.png
hist(twodays$Global_active_power, ylim = c(0,1200), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png", width =480, height = 480, units = "px") ## Copy the graph to the graphic device
dev.off() ## Close graphic device