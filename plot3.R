library(data.table)
powerconsume <- fread("./data/household_power_consumption.txt",colClasses="character")
subpower <- subset(powerconsume,Date%in% c('1/2/2007','2/2/2007'))
subpower[, DateTime := as.character(strptime(paste(subpower$Date, subpower$Time), format = "%d/%m/%Y %H:%M:%S"))]
library(datasets)
png(file = "plot2.png", bg = "WHITE", width = 480, height = 480, units = "px")
plot(as.POSIXlt(subpower$DateTime),as.numeric(subpower$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering")
lines(as.POSIXlt(subpower$DateTime),as.numeric(subpower$Sub_metering_2),col="red")
lines(as.POSIXlt(subpower$DateTime),as.numeric(subpower$Sub_metering_3),col="blue")
legend("topright", lty=c(1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()


