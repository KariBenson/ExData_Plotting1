plot2 <- function () {
  
  
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
  day <- wday(datetime)                       
  
 
  #determine day of week
  Day <- as.POSIXct(datetime)
  
  print(days, length(days))  
  #generate time series with day on x-axis, and Global_active_power on y ()
  plot(energy$Global_active_power~Day, 
       type = "l", 
       ylab = "Global Active Power (kilowatts)", 
       xlab = "")  
  
  #save to PNG file of size 480x480 pixels
  dev.copy(png,file="plot2.png", width = 480, height = 480)
  dev.off()
  
}