## Down file from Coursera site
## manually unzip the zip file and extract the txt file and move to desktop
## setwd("Desktop")
library(data.table)
names(fread("household_power_consumption.txt"))
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007' ", sep = ";")
data$Date <- as.Date(data$Date)
png(file = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()