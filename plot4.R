dataset<- read.table("household_power_consumption.txt", header = TRUE, sep= ";")
testdata<- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]
str(testdata)

testdata$Global_active_power<- as.numeric(testdata$Global_active_power)

testdata$Sub_metering_1<- as.numeric(testdata$Sub_metering_1)
testdata$Sub_metering_2<- as.numeric(testdata$Sub_metering_2)
testdata$Sub_metering_3<- as.numeric(testdata$Sub_metering_3)
testdata$Voltage<- as.numeric(testdata$Voltage)
testdata$Global_reactive_power<-as.numeric(testdata$Global_reactive_power)

png(filename = "household_testdata_4.png")
par(mfrow=c(2,2))
plot(datetime, testdata$Global_active_power, ylab = "Global Active Power (kilowatts)", type="l")
plot(datetime, testdata$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(datetime, testdata$Sub_metering_1, type = "n", xlab= "", ylab = "Energy sub metering")
lines(datetime, testdata$Sub_metering_1, col = "black")
lines(datetime, testdata$Sub_metering_2, col = "red")
lines(datetime, testdata$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), cex = 0.5)
plot(datetime, testdata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type="l")
dev.off()