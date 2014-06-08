library(data.table)
powerconsume <- fread("./data/household_power_consumption.txt",colClasses="character")
subpower <- subset(powerconsume,Date%in% c('1/2/2007','2/2/2007'))
subpower[, DateTime := as.character(strptime(paste(subpower$Date, subpower$Time), format = "%d/%m/%Y %H:%M:%S"))]
library(datasets)
png(file = "plot1.png", bg = "WHITE", width = 480, height = 480, units = "px")
hist(as.numeric(subpower$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)",col="RED")
dev.off()

