#Plot 2
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
png(file = "plot2", bg = "transparent")

#Set par() parameters.
par(mfrow = c(1,1))

#Plot the two relevant columns.
plot(rawDataSub$dtcombo, rawDataSub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#End device output.
dev.off()