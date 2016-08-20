##Set Work Dir
#setwd("D:/Big Data/Assignments")

##Download file
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "hhpowdata.zip", method = "curl")

## Unzip file

#unzip("D:/Big Data/Assignments/hhpowdata.zip", overwrite = T, exdir = "D:/Big Data/Assignments")

##Read file and plot in png file 

mf <- file("household_power_consumption.txt")
mf1 <- read.table(text = grep("^[1,2]/2/2007", readLines(mf), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
png("plot1.png", width = 480, height = 480, units = "px")
hist(mf1$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
dev.off()
