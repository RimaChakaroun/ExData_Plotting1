dataset<- read.table("household_power_consumption.txt", header = TRUE, sep= ";")
testdata<- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(testdata$Date, testdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot_global_active_power_datetime.png")
plot(datetime, testdata$Global_active_power, ylab = "Global Active Power (kilowatts)", type="l")
dev.off()