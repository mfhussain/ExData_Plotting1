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

## Generating Plot 2 within png file 480/480
png("plot2.png", width = 480, height = 480, units = "px")
plot(Subdata$Global_active_power ~ Subdata$Datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()