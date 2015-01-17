#This is Plot1.R file for plotting Exp Data Graph. 

# setting up the environmental variables #

setwd ("~/scientist/expdata")
getwd() #check if this is correct#

# check for the file in current directory and set working directory #

if (!"main_file.R" %in% list.files()) {
setwd("~/scientist/expdata")
}
source("main_file.R")
#opening the device

png(filename = '~/scientist/expdata/plot1.png', width = 480, height = 480, units = "px", bg = 'transparent')
hist(Global_active_power, col = 'red',
main = 'Global Active Power',
xlab = 'Global Active Power (kilowatts)',
breaks = 12, ylim = c(0, 1200))

#closing the device
dev.off()
