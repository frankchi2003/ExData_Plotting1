plot1<- function(){
    ## the plot1 function plot a histogram of Global Active Power(kilowatts).
    ## 1 the funtion required "ExData_Plotting1_Init.R" function 
    ##   to download/read the household_power_consumption.txt dataset file 
    ## 2 the plot1 function will take dataset from the dates 2007-02-01 and 2007-02-02
    ## 3 generate a plot1.png file contains histogram of Global Active Power(kilowatts) 
    source("ExData_Plotting1_Init.R")
    
    ## download/read the household_power_consumption.txt dataset file 
    pwrdata <- ExData_Plotting1_Init()
    
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
    
    ## plot histogram of global active power for those 2 days
    png("plot1.png", width=480, height=480)
    hist(subpwrdata$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
    dev.off()
}
