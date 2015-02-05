# plot1 script

# objective is to plot a histogram of global active power

# code will run after unzipping data file into the working directory

# due to large size of data file, contents were examined using:

# grep("^2/2/2007", data[,1])  to determine which rows needed to be read

###################################################

plot1 <- function(){

    # create filename, read in data, and label the columns
    filename <- "household_power_consumption.txt"
    data <- read.table(filename, sep=";", skip=66637, nrows=2880)
    names(data)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", 
              "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
              "Sub_metering_3")

    # create the histogram with specified parameters
    hist(data$Global_active_power,
        xlab="Global Active Power (kilowatts)",
        main = "Global Active Power",
        col="red")
   
    # copy the image and create a .png file
    dev.copy(png,filename="plot1.png")
    dev.off ()
}