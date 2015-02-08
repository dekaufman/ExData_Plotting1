> ?strptime()
> ?as.Date
> dataTwoday[1,2]
[1] 00:00:00
1440 Levels: 00:00:00 00:01:00 00:02:00 00:03:00 00:04:00 00:05:00 00:06:00 00:07:00 ... 23:59:00
> x <- c("1jan1960", "2jan1960", "31mar1960", "30jul1960")
> z <- as.Date(x, "%d%b%Y")
> z
[1] "1960-01-01" "1960-01-02" "1960-03-31" "1960-07-30"
> dataTwoday[1,1]
[1] 1/2/2007
1442 Levels: 1/1/2007 1/1/2008 1/1/2009 1/1/2010 1/10/2007 1/10/2008 1/10/2009 1/10/2010 ... 9/9/2010
> with(dataTwoday, plot(active))
> with(dataTwoday, plot(active), type = "p")
> with(dataTwoday, plot(active), type = "l")

> with(dataTwoday, plot(active, type = "n"))
> with(dataTwoday, lines(active, pch = "."))

setwd("~/Admin/Training/Coursera/Exploratory Data Analysis/Course Project 1")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", col.names = c("dt", "tm", "active", "reactive", "vltge", "amps", "sub1Wh", "sub2Wh", "sub3wh"), na.strings = c("?"), nrows = 2100000)

dataTwoday <- subset(data, data$dt == "1/2/2007" | data$dt == "2/2/2007")

png(filename = "plot1.png", width = 480, height = 480)
with(dataTwoday, plot(active, type = "n", ylab = "Global Active Power (kilowatts)"))
with(dataTwoday, lines(active, pch = "."))
dev.off()
