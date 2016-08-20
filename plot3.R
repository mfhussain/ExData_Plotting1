##Set Work Directory
#setwd("D:/Big Data/Assignments")

##Download file
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "hhpowdata.zip", method = "curl")

## Unzip file

#unzip("D:/Big Data/Assignments/hhpowdata.zip", overwrite = T, exdir = "D:/Big Data/Assignments")


## Getting full dataset
HH_PowCon <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
HH_PowCon$Date <- as.Date(HH_PowCon$Date, format = "%d/%m/%Y")

## Subset data for 01/Feb/2007 - 02/Feb/2007
Subdata <- subset(HH_PowCon, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(HH_PowCon)

## Convert dates
datetime <- paste(as.Date(Subdata$Date), Subdata$Time)
Subdata$Datetime <- as.POSIXct(datetime)


## Generating Plot 3 in png file 480/480
with(Subdata, {
  png("plot3.png", width = 480, height = 480, units = "px")
    plot(Sub_metering_1 ~ Datetime, type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()