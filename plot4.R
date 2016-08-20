##Set Work Dir
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


## Generate Plot 4 within png file 480/480
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(Subdata, {
  
  plot(Global_active_power ~ Datetime, type = "l", 
       ylab = "Global Active Power", xlab = "")
 
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 
   plot(Global_reactive_power ~ Datetime, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
   })
dev.off()
