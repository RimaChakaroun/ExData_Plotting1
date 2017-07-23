dataset<- read.table("household_power_consumption.txt", header = TRUE, sep= ";")
testdata<- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]
str(testdata)

testdata$Global_active_power<- as.numeric(testdata$Global_active_power)

png("plot_global_active_power.png")
hist(testdata$Global_active_power, col ="red", xlab= "global active power (Kilowatts)", main="Global Active Power")
dev.off()