plot3 <- function(){
    ## the plot3 function plot a graph of Energy sub metering vs time.
    ## 1 the funtion required "ExData_Plotting1_Init.R" function 
    ##   to download/read the household_power_consumption.txt dataset file 
    ## 2 the plot function will take dataset from the dates 2007-02-01 and 2007-02-02
    ## 3 generate a plot3.png file contains Energy sub metering vs time 
    
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
    
    ## plot globalactivepower vs date&time
    png("plot3.png", width=480, height=480)
    with(subpwrdata, plot(dateTime, Sub_metering_1, type="l", xlab=NA, ylab="Energy sub metering"))
    lines(subpwrdata$dateTime, subpwrdata$Sub_metering_2,type="l", col= "red")
    lines(subpwrdata$dateTime, subpwrdata$Sub_metering_3,type="l", col= "blue")
    legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
    dev.off()
}