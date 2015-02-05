# plot4 script

# objective is to create 4 graphs in one plot

# code will run after unzipping data file into the working directory

# due to large size of data file, contents were examined using:

# grep("^2/2/2007", data[,1])  to determine which rows needed to be read

###################################################

plot4 <- function(){
  
  # create filename, read in data, and label the columns
  filename <- "household_power_consumption.txt"
  data <- read.table(filename, sep=";", skip=66637, nrows=2880)
  names(data)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                 "Sub_metering_3")
  
  # put the date and time into a more usuable format
  data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  
  # create a .png file
  png(file="plot4.png")
  
    # setup multiple plots 2 by 2 format  
    par(mfrow = c(2,2))
  
      # add all plots
      with(data, {
    
          plot(Date, Global_active_power,
              ylab="Global Active Power",
              xlab="",
              type="l")
      
          plot(Date, Voltage,
              xlab="datetime",
              ylab="Voltage",
              type="l")
      
          plot(Date, Sub_metering_1, 
              ylab="Energy sub metering",
              xlab="",
              type="l")
  
          lines(Date, Sub_metering_2, col="red", type="l")
  
          lines(Date, Sub_metering_3, col="blue", type="l")
  
          legend("topright", col= c("black", "red", "blue"), 
              legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
              lty=1,
              bty="n",
              cex=0.95)
  
          plot(Date, Global_reactive_power,
              xlab="datetime",
              ylab="Global_reactive_power",
              type="l")
      })
  
  # end the creation of .png file
  dev.off ()
}