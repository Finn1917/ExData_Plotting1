## Code to create Plot #3
##
library(dplyr)
fullTab <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
wkTab <- fullTab
wkTab <- mutate(wkTab, flDate = paste(Date, Time, sep = " "))
wkTab$flDate = strptime(wkTab$flDate, "%d/%m/%Y %H:%M:%S")
wkTab$flDate = as.POSIXct(wkTab$flDate)
wkTab$Date = strptime(wkTab$Date, "%d/%m/%Y")
wkTab$Date = as.Date(wkTab$Date)
finTab <- filter(wkTab, Date == "2007-02-01" | Date == "2007-02-02")
##
##
png("plot3.png")
with(finTab, plot(flDate, Sub_metering_1, type = "l", col = "black", ylim = c(0,39), yaxs = "i", xlab = "", ylab = ""))
par("new" = T)
with(finTab, plot(flDate, Sub_metering_2, type = "l", col = "red", ylim = c(0,39), yaxs = "i", xlab = "", ylab = ""))
par("new" = T)
with(finTab, plot(flDate, Sub_metering_3, type = "l", col = "blue", ylim = c(0,39), yaxs = "i", xlab = "", ylab = "Energy sub metering"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()