data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", col.names = c("dt", "tm", "active", "reactive", "vltge", "amps", "sub1Wh", "sub2Wh", "sub3wh"), na.strings = c("?"), nrows = 2100000)

dataTwoday <- subset(data, data$dt == "1/2/2007" | data$dt == "2/2/2007")

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

with(dataTwoday, {
plot(active, type = "n", ylab = "Global Active Power", pch = ".", xlab="")
lines(active, pch = ".")

plot(vltge, type = "n", ylab = "Voltage", pch = ".", sub="datetime", xlab="")
lines(vltge, pch = ".")

plot(sub1Wh, type = "n", ylab = "Energy sub metering", xlab="")
lines(sub1Wh, pch = ".")
lines(sub2Wh, pch = ".", col = "Red")
lines(sub3wh, pch = ".", col = "Blue")
legend("topright", col=c("black", "red", "blue"), pch="-------", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(reactive, type = "n", ylab = "Global_reactive_power", pch = ".", sub="datetime", xlab="")
lines(reactive, pch = ".")
})

dev.off()

