# setting up the environmental variables #

setwd ("~/scientist/expdata")
getwd() #check if this is correct#

# check for the file in current directory and set working directory #

if (!"main_file.R" %in% list.files()) {
setwd("~/scientist/expdata")
}
source("main_file.R")
#

##### - Converting Date function in to Numeric #######

filterData$DateTime <- strptime(paste(filterData$Date, filterData$Time), '%d/%m/%Y %H:%M:%S')
filterData$Sub_metering_1 <- as.numeric(filterData$Sub_metering_1)
filterData$Sub_metering_2 <- as.numeric(filterData$Sub_metering_2)
filterData$Sub_metering_3 <- as.numeric(filterData$Sub_metering_3)
filterData$Global_active_power <- as.numeric(filterData$Global_active_power)
filterData$Global_reactive_power <- as.numeric(filterData$Global_reactive_power)
filterData$Voltage <- as.numeric(filterData$Voltage)

# Opening the PNG device

png(file='plot4.png', width = 480, height = 480) 
par(mfrow = c(2, 2))

# Plotting the first Graph
plot(filterData$DateTime, filterData$Global_active_power, type='l', xlab = '', ylab = 'Global Active Power (kilowatts)') ## Plotting the Graph ##


# Plotting the Second Graph
plot(filterData$DateTime, filterData$Voltage, type='l', xlab = 'datetime', ylab = 'Voltage') ## Plotting the Graph ##


# Plotting the Third Graph
plot(filterData$DateTime, filterData$Sub_metering_1, type='l', xlab = '', ylab = 'Energy sub metering') ## Plotting the Graph ##

lines(filterData$DateTime, filterData$Sub_metering_2, col=c('red'))
lines(filterData$DateTime, filterData$Sub_metering_3, col=c('blue'))
legend("topright", bty="n", lty=c(1,1,1), col = c("black", "red", "blue"),
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# Plotting the Fourth Graph
plot(filterData$DateTime, filterData$Global_reactive_power, type='l', xlab = 'datetime', ylab = 'Global_reactive_power') ## Plotting the Graph ##

dev.off()

