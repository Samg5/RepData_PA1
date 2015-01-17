# setting up the environmental variables #

setwd ("~/scientist/expdata")
getwd() #check if this is correct#

# check for the file in current directory and set working directory #

if (!"main_file.R" %in% list.files()) {
setwd("~/scientist/expdata")
}
source("main_file.R")

# Converting Date Function in to numeric

filterData$DateTime <- strptime(paste(filterData$Date, filterData$Time), '%d/%m/%Y %H:%M:%S')
filterData$Global_active_power <- as.numeric(filterData$Global_active_power)

#Opening the Device
png(file='plot2.png', width = 480, height = 480)

# Creating Plot2.png file in set directory

plot(filterData$DateTime, filterData$Global_active_power, type='l', xlab = '', ylab = 'Global Active Power (kilowatts)')

#Turning the Device off

dev.off()
