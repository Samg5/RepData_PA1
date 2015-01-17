# This is main_file.R for getting data for 
# Exploratory Data Analysis Assessment

# setting up the environmental variables #

setwd ("~/scientist/expdata")
getwd() #check if this is correct#

download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', method= 'curl', 'data.zip') # Getting/ downloading the file from URL

unzip('data.zip') # Unziping the file in local directory

filedata <- "~/scientist/expdata/household_power_consumption.txt"
rawdata <- read.table(filedata, header = TRUE, sep = ";", colClasses = c ("character", "character", rep("numeric",7)), na = "?")

dim(rawdata) 
#[1] 2075259       9
attach(rawdata)
smalset <- Date == "1/2/2007" | Date == "2/2/2007"
filterData <- rawdata [smalset, ]
attach(filterData)
x <- paste(Date, Time)
filterData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(filterData) <- 1:nrow(filterData)
dim(filterData) 
