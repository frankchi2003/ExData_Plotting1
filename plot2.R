plot2 <- function(){
    ## the plot2 function plot a graph of Global Active Power(kilowatts).
    ## 1 the funtion required "ExData_Plotting1_Init.R" function 
    ##   to download/read the household_power_consumption.txt dataset file 
    ## 2 the plot1 function will take dataset from the dates 2007-02-01 and 2007-02-02
    ## 3 generate a plot2.png file contains Global Active Power vs. weekdays graphic
    
    source("ExData_Plotting1_Init.R")
    
    ## download/read the household_power_consumption.txt dataset file 
    pwrdata <- ExData_Plotting1_Init()

    ## Create column in table with date and time merged together
    dateTime <- strptime(paste(pwrdata$Date, pwrdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
    pwrdata <- cbind(pwrdata, dateTime)
    
    ## change class of all columns to correct class
    pwrdata$Date <- as.Date(pwrdata$Date, format="%d/%m/%Y")
    pwrdata$Time <- format(pwrdata$Time, format="%H:%M:%S")
    pwrdata$Global_active_power <- as.numeric(pwrdata$Global_active_power)
    pwrdata$Global_reactive_power <- as.numeric(pwrdata$Global_reactive_power)
    pwrdata$Voltage <- as.numeric(pwrdata$Voltage)
    pwrdata$Global_intensity <- as.numeric(pwrdata$Global_intensity)
    pwrdata$Sub_metering_1 <- as.numeric(pwrdata$Sub_metering_1)
    pwrdata$Sub_metering_2 <- as.numeric(pwrdata$Sub_metering_2)
    pwrdata$Sub_metering_3 <- as.numeric(pwrdata$Sub_metering_3)
    
    ## subset data from 2007-02-01 and 2007-02-02
    subpwrdata <- subset(pwrdata, Date == "2007-02-01" | Date =="2007-02-02")
    
    ## plot Global Active Power vs date&time
    png("plot2.png", width=480, height=480)
    with(subpwrdata, plot(dateTime, Global_active_power, type="l", xlab=NA, ylab="Global Active Power (kilowatts)"))
    dev.off()
}