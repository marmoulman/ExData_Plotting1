datafile <- "C:\\Users\\colin.nicotina\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt"
print(datafile)
df <- read.table(datafile, header = TRUE, sep = ';', stringsAsFactors=FALSE, dec=".")



subSetData <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]
fulldatetime <- paste(subSetData$Date, subSetData$Time, sep = " ")
datetime <- strptime(fulldatetime, "%d/%m/%Y %H:%M:%S")


globalactivepower <- as.numeric(subSetData$Global_active_power)
dates <- weekdays(as.Date(subSetData$Date, '%d/%m/%Y'))
v=plot(datetime, globalactivepower, col="black", type="l", main="Global Active Power", xlab="", ylab="Global Active Power (kilowatts)")
png("plot2.png", width=480, height=480)
plot(datetime, globalactivepower, col="black", type='l', main ="", xlab="", ylab="Global Active Power (kilowatts)")
#hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()