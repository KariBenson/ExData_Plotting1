plot3 <- function () {
  
  #adjust for default in RStudio
  options("max.print" = 9999999)
  
  #library
  library(lubridate)
  
  #load data set into R
  energydata <- read.csv("~/R/datasciencecoursera/exploratory/household_power_consumption.txt", header = TRUE, sep = ";")
  
  #change data format to Y-m-d
  energydatadate <- as.Date(energydata$Date,"%d/%m/%Y")
  energydata$Date <- energydatadate
  
  #remove data from unnecessary dates
  energyone <- energydata[energydata$Date == "2007-02-01", ]
  energytwo <- energydata[energydata$Date == "2007-02-02", ]
  energy <- rbind(energyone,energytwo)
  
  #datetime
  
  datetime <- strptime(paste(energy$Date,energy$Time),"%Y-%m-%d %H:%M:%S")
  
  
  #determine day of week
  Day <- as.POSIXct(datetime)
  
  print(days, length(days))  
  #generate time series with day on x-axis, and Global_active_power on y ()
  plot(energy$Sub_metering_1 ~Day, 
       type = "l", 
       ylab = "Energy sub metering", 
       xlab = "")  
  lines(Day,energy$Sub_metering_2, type = "l", col = "red")
  lines(Day,energy$Sub_metering_3, type = "l",col = "blue")
  legend("topright", legend = c("Sub_metering_1",
                                "Sub_metering_2",
                                "Sub_metering_3"),
          lty = 1, lwd = 2, cex = 0.5, bty = "n",
         col = c("black", "red", "blue"))
  #save to PNG file of size 480x480 pixels
  dev.copy(png,file="plot3.png", width = 480, height = 480)
  dev.off()
}