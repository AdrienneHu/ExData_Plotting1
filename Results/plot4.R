# Setting working directory
setwd("/Users/adrienne716/Desktop")

# Read the data, and transform date and time
data <- read.table("./household_power_consumption.txt", header = T, sep = ";", na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
twodays <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
DateTime <- strptime(paste(twodays$Date, twodays$Time), "%d/%m/%Y %H:%M:%S")

# Reconstructing plot 4 and save it as plot4.png
png(filename = "plot4.png", width = 480, height = 480, units = "px") ## Create a png file to write the graph
par(mfrow = c(2,2))
plot(DateTime, twodays$Global_active_power, xlab="", ylab="Global Active Power", type="l")
plot(DateTime, twodays$Voltage, xlab="datetime", ylab="Voltage", type="l")

cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(DateTime, twodays$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DateTime, twodays$Sub_metering_2, type="l", col="red")
lines(DateTime, twodays$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1,col=c("black","blue","red"), legend=cols)

plot(DateTime, twodays$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()