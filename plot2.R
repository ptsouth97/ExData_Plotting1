# plot2 script

# objective is to plot global active power vs date/time

# due to large size of data file, contents were examined using:

# grep("^2/2/2007", data[,1])  to determine which rows needed to be read

###################################################

plot2 <- function(){
  
    # create filename, read in data, and label the columns
    filename <- "household_power_consumption.txt"
    data <- read.table(filename, sep=";", skip=66637, nrows=2880)
    names(data)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", 
              "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
              "Sub_metering_3")

    # put the date and time into a more usuable format
    data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
    
    # create a plot with the specified parameters
    plot(data$Date, data$Global_active_power,
         ylab="Global Active Power (kilowatts)",
         xlab="",
         type="l")
             
    # copy the image and create a .png file
    dev.copy(png,filename="plot2.png")
    dev.off ()
}