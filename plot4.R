# Exploratory Data Analysis: Course Project 1

# plot 4

# Download the UCI Individual household electric power consumption Data Set in working directory
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destinfile <- "./household_power_consumption.zip"
download.file(url, destinfile, method = "curl")

# Unzip the data set in working directory
unzip(destinfile)

# Load the full data
full_data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Subset the data for the dates 2007-02-01 and 2007-02-02
data <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert Date and Time to Date/Time classes
data$DateTime <- paste(data$Date, data$Time, sep = " ")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

# Construct plot4 and save it to a PNG file.
png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2,2))

# top-left: taken from plot2
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", ylim = c(0, 7.5), yaxt = "n")
axis(side = 2, at = c(0, 2, 4, 6), labels = c("0", "2", "4", "6")) # specifies x-axis ticks

# bottom-left: taken from plot3
plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col = "black")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty="n")

# top-right
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# bottom-right
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
