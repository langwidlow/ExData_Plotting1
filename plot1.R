#Plot 1
#This script assumes that you have set the
#working directory to the folder with the data file.

#Read in raw data using read.table.
#fields with missing values had question marks as the set value.
rawData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

#Subset rawData to only include specified dates.
rawDataSub <- subset(rawData, Date == "1/2/2007" | Date == "2/2/2007")

#Save following plots as png.
png(file = "plot1.png", bg = "transparent")

#Set par() parameters.
par(mfrow = c(1,1))

#Plot histogram of subset for global active power.
hist(rawDataSub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "frequency")

#End device output.
dev.off()