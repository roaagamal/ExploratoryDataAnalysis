
# download package

library(dplyr)

# Set working directory
setwd("~/Data Science/John Hopkins/4. Data Exploratory/Project 1")

# Download the dataset
filename<-"household_power_consumption.zip"

unzip(filename)

power<-read.table("~/Data Science/John Hopkins/4. Data Exploratory/Project 1/household_power_consumption.txt", skip =1, sep = ";")

# Assign descriptive names to each data variable
names(power)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Extract the data of 2007-02-01 and 2007-02-02
power0201_0202<-subset(power, power$Date=="1/2/2007"|power$Date=="2/2/2007")

# Plot 1: Histogram of Global Active Power
# 1. Open a png file
png("plot1.png", width = 480, height = 480)
# 2. Create the Plot
hist(as.numeric(as.character(power0201_0202$Global_active_power)),xlab="Global Active Power (kilowatts)", col="red", main = "Global Active Power")
#3. close the png file
dev.off()
