
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", col.names = c("dt", "tm", "active", "reactive", "vltge", "amps", "sub1Wh", "sub2Wh", "sub3wh"), na.strings = c("?"), nrows = 2100000)

dataTwoday <- subset(data, data$dt == "1/2/2007" | data$dt == "2/2/2007")

png(filename = "plot2.png", width = 480, height = 480)
with(dataTwoday, plot(active, type = "n", ylab = "Global Active Power (kilowatts)"))
with(dataTwoday, lines(active, pch = "."))
dev.off()
