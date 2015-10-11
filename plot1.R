## Code to create Plot #1
##
##
library(dplyr)
fullTab <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
wkTab <- fullTab
wkTab$Date = strptime(wkTab$Date, "%d/%m/%Y")
wkTab$Date = as.Date(wkTab$Date)
finTab <- filter(wkTab, Date == "2007-02-01" | Date == "2007-02-02")
## Create PNG Chart
png("plot1.png")
hist(finTab$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
