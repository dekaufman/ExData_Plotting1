
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", col.names = c("dt", "tm", "active", "reactive", "vltge", "amps", "sub1Wh", "sub2Wh", "sub3wh"), na.strings = c("?"), nrows = 2100000)

dataTwoday <- subset(data, data$dt == "1/2/2007" | data$dt == "2/2/2007")

png(filename = "plot3.png", width = 480, height = 480)

with(dataTwoday, plot(sub1Wh, type = "n", ylab = "Energy sub metering"))

with(dataTwoday, lines(sub1Wh, pch = "."))
with(dataTwoday, lines(sub2Wh, pch = ".", col = "Red"))
with(dataTwoday, lines(sub3wh, pch = ".", col = "Blue"))

legend("topright", col=c("black", "red", "blue"), pch="-------", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
