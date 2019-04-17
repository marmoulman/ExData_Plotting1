datafile <- "C:\\Users\\colin.nicotina\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt"
print(datafile)
df <- read.table(datafile, header = TRUE, sep = ';', stringsAsFactors=FALSE, dec=".")
subSetData <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]
globalactivepower <- as.numeric(subSetData$Global_active_power)

v=hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
png("plot1.png", width=480, height=480)
hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()