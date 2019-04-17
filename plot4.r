datafile <- "C:\\Users\\colin.nicotina\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt"
print(datafile)
df <- read.table(datafile, header = TRUE, sep = ';', stringsAsFactors=FALSE, dec=".")



subSetData <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]
fulldatetime <- paste(subSetData$Date, subSetData$Time, sep = " ")
datetime <- strptime(fulldatetime, "%d/%m/%Y %H:%M:%S")

sub1 <- as.numeric(subSetData$Sub_metering_1)
sub2 <- as.numeric(subSetData$Sub_metering_2)
sub3 <- as.numeric(subSetData$Sub_metering_3)
globalactivepower <- as.numeric(subSetData$Global_active_power)
globalreactivepower <-  as.numeric(subSetData$Global_reactive_power)
voltage <-  as.numeric(subSetData$Voltage)
dates <- weekdays(as.Date(subSetData$Date, '%d/%m/%Y'))
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime, globalactivepower, type="l", xlab = "", ylab = "Global Active Power")
plot(datetime, voltage, type="l", xlab = "datetime", ylab = "Voltage")
plot(datetime, sub1, col="black", type="l", main="", xlab="", ylab="Energy sub metering")
lines(datetime, sub2, col="orange")
lines(datetime, sub3, col="blue")
legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'orange', 'blue'), lty=1, cex=0.8)
plot(datetime, globalreactivepower, type="l", xlab = "datetime", ylab="global_reactive_power")
#png("plot4.png", width=480, height=480)
#plot(datetime, globalactivepower, col="black", type='l', main ="", xlab="", ylab="Global Active Power (kilowatts)")
#hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()