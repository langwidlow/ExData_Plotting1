#Plot 3
#This script assumes that you have set the
#working directory to the folder with the data file.

#Read in raw data using read.table.
#fields with missing values had question marks as the set value.
rawData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

#Subset rawData to only include specified dates.
rawDataSub <- subset(rawData, Date == "1/2/2007" | Date == "2/2/2007")

#Create a new column in the data table that is a combination of the Date and Time columns.
rawDataSub$dtcombo <- strptime(paste(rawDataSub$Date, rawDataSub$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#Save following plots as png.
png(file = "plot3.png", bg = "transparent")

#Set par() parameters.
par(mfrow = c(1,1))

#Make the plot, add remaining sub meters, and set the legend style.
plot(rawDataSub$dtcombo, rawDataSub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(rawDataSub$dtcombo, rawDataSub$Sub_metering_2, type = "l", col = "red")
lines(rawDataSub$dtcombo, rawDataSub$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#End device output.
dev.off()