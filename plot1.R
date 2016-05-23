# Exploratory Data Analysis: Course Project 1

# plot 1

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

# Construct plot1 and save it to a PNG file.
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", xlim=c(0, 6), ylim=c(0, 1200))
dev.off()

