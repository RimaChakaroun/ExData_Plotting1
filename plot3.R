dataset<- read.table("household_power_consumption.txt", header = TRUE, sep= ";")
testdata<- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(testdata$Date, testdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

testdata$Sub_metering_1<- as.numeric(testdata$Sub_metering_1)
testdata$Sub_metering_2<- as.numeric(testdata$Sub_metering_2)
testdata$Sub_metering_3<- as.numeric(testdata$Sub_metering_3)
png(filename = "submetering_1_2_3_datetime.png")
plot(datetime, testdata$Sub_metering_1, type = "n", xlab= "", ylab = "Energy sub metering")
lines(datetime, testdata$Sub_metering_1, col = "black")
lines(datetime, testdata$Sub_metering_2, col = "red")
lines(datetime, testdata$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()