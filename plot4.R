#Plot 4
#This script assumes that you have set the
#working directory to the folder with the data file.

#Read in raw data using read.table.
#fields with missing values had question marks.
rawData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

#Subset rawData to only include specified dates.
rawDataSub <- subset(rawData, Date == "1/2/2007" | Date == "2/2/2007")

#Create a new column in the data table that is a combination of the Date and Time columns.
rawDataSub$dtcombo <- strptime(paste(rawDataSub$Date, rawDataSub$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#Save following plots as png.
png(file = "plot4.png", bg = "transparent")

#Set par() parameters.
par(mfcol = c(2,2), mar = c(4,4,1,1))

#Top left plot.
plot(rawDataSub$dtcombo, rawDataSub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#Bottom left plot.
plot(rawDataSub$dtcombo, rawDataSub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(rawDataSub$dtcombo, rawDataSub$Sub_metering_2, type = "l", col = "red")
lines(rawDataSub$dtcombo, rawDataSub$Sub_metering_3, type = "l", col = "blue")
legend("topright", bty = "n", lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Top right plot.
plot(rawDataSub$dtcombo, rawDataSub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Bottom right plot.
plot(rawDataSub$dtcombo, rawDataSub$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#End device output.
dev.off()