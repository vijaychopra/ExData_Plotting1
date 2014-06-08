library(data.table)
powerconsume <- fread("./data/household_power_consumption.txt",colClasses="character")
subpower <- subset(powerconsume,Date%in% c('1/2/2007','2/2/2007'))
subpower[, DateTime := as.character(strptime(paste(subpower$Date, subpower$Time), format = "%d/%m/%Y %H:%M:%S"))]
library(datasets)

png(file = "plot4.png", bg = "WHITE", width = 480, height = 480, units = "px")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(subpower,{
  plot(as.POSIXlt(DateTime),as.numeric(Global_active_power),type="l",xlab="",ylab="Global Active Power")
  plot(as.POSIXlt(DateTime),as.numeric(Voltage),type="l",xlab="datetime",ylab="Voltage")
  plot(as.POSIXlt(DateTime),as.numeric(Sub_metering_1),type="l",xlab="",ylab="Energy sub metering")
  lines(as.POSIXlt(DateTime),as.numeric(Sub_metering_2),col="red")
  lines(as.POSIXlt(DateTime),as.numeric(Sub_metering_3),col="blue")
  legend("topright", lty=c(1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  plot(as.POSIXlt(DateTime),as.numeric(Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")  
})

dev.off()