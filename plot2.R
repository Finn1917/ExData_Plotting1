## Code to create Plot#2
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
## Create PNG Chart
png("plot2.png")
##
with(finTab,plot(flDate, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n"))
with(finTab,lines(flDate, Global_active_power, type = "l"))
dev.off()