# setting up the environmental variables #

setwd ("~/scientist/expdata")
getwd() #check if this is correct#

# check for the file in current directory and set working directory #

if (!"main_file.R" %in% list.files()) {
setwd("~/scientist/expdata")
}
source("main_file.R")

filterData$DateTime <- strptime(paste(filterData$Date, filterData$Time), '%d/%m/%Y %H:%M:%S')
filterData$Sub_metering_1 <- as.numeric(filterData$Sub_metering_1)
filterData$Sub_metering_2 <- as.numeric(filterData$Sub_metering_2)
filterData$Sub_metering_3 <- as.numeric(filterData$Sub_metering_3)
# Draw the plot to a png file
png(file='plot3.png', width = 480, height = 480)
plot(filterData$DateTime, filterData$Sub_metering_1, type='l',
xlab = '', ylab = 'Energy sub metering')
lines(filterData$DateTime, filterData$Sub_metering_2, col=c('red'))
lines(filterData$DateTime, filterData$Sub_metering_3, col=c('blue'))
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"),
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
