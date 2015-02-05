# plot3script

# objective is to plot energy sub_metering vs date/time

# due to large size of data file, contents were examined using:

# grep("^2/2/2007", data[,1])  to determine which rows needed to be read

###################################################

plot3 <- function(){
  
  # create filename, read in data, and label the columns
  filename <- "household_power_consumption.txt"
  data <- read.table(filename, sep=";", skip=66637, nrows=2880)
  names(data)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                 "Sub_metering_3")
  
  # put the date and time into a more usuable format
  data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  
  # create a .png file
  png(file="plot3.png")
  
      # create a plot with the specified parameters
      plot(data$Date, data$Sub_metering_1, 
          ylab="Energy sub metering",
          xlab="",
          type="l")

      # add another series to the plot
      lines(data$Date, data$Sub_metering_2, col="red", type="l")
  
      # add another series to the plot
      lines(data$Date, data$Sub_metering_3, col="blue", type="l")
  
      # create a legend with the appropriate parameters
      legend("topright", 
         col= c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=1)
    
  # end the creation of .png file
  dev.off()
}