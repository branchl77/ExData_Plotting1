# Define Main Data Subset
mydf <- "household_power_consumption.txt"
data <- read.table(mydf, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#dataSubset1 <- data[strptime(data$Date, "%d/%m/%Y")  >= as.Date("2007/2/1") & 
#                            strptime(data$Date, "%d/%m/%Y")  <= as.Date("2007/2/2")  ,]

# Create Plot Subsets
datetime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gAP <- as.numeric(dataSubset$Global_active_power)
gRP <- as.numeric(dataSubset$Global_reactive_power)
voltage <- as.numeric(dataSubset$Voltage)
subMetering1 <- as.numeric(dataSubset$Sub_metering_1)
subMetering2 <- as.numeric(dataSubset$Sub_metering_2)
subMetering3 <- as.numeric(dataSubset$Sub_metering_3)

# Create multi-Plots
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, gAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   col=c("black", "red", "blue"), lty=, lwd=2, bty="n")

plot(datetime, gRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()