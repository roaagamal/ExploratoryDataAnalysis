
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

# Modify Time variable
power0201_0202$Time <- strptime(paste(power0201_0202$Date, power0201_0202$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
power0201_0202$Time<-as.POSIXlt(power0201_0202$Time)

# Plot 3: Sub-metering
# 1. Open a png file
png("plot3.png", width = 480, height = 480)
# 2. Create the plot
plot(power0201_0202$Time, as.numeric(as.character(power0201_0202$Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering")
lines(power0201_0202$Time, as.numeric(as.character(power0201_0202$Sub_metering_2)), type="l", col="red")
lines(power0201_0202$Time, as.numeric(as.character(power0201_0202$Sub_metering_3)), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#3. close the png file
dev.off()
