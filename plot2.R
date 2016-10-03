# Define Data Subset
mydf <- "household_power_consumption.txt"
data <- read.table(mydf, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#dataSubset1 <- data[strptime(data$Date, "%d/%m/%Y")  >= as.Date("2007/2/1") & 
#                            strptime(data$Date, "%d/%m/%Y")  <= as.Date("2007/2/2")  ,]

## Create Plot
datetime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gAP <- as.numeric(dataSubset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, gAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

