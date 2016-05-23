# Exploratory Data Analysis: Course Project 1

# plot 2

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

# Construct plot2 and save it to a PNG file.
png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", ylim = c(0, 7.5), yaxt = "n")
axis(side = 2, at = c(0, 2, 4, 6), labels = c("0", "2", "4", "6")) # specifies x-axis ticks
dev.off()
