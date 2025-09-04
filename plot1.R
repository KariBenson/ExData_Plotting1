plot1 <- function () {
  
  
  #adjust for default in RStudio
  options("max.print" = 9999999)
  
  #load data set into R
  energydata <- read.csv("~/R/datasciencecoursera/exploratory/household_power_consumption.txt", header = TRUE, sep = ";")
  
  #change data format to Y-m-d
  energydatadate <- as.Date(energydata$Date,"%d/%m/%Y")
  energydata$Date <- energydatadate
  
  #remove data from unnecessary dates
  energyone <- energydata[energydata$Date == "2007-02-01", ]
  energytwo <- energydata[energydata$Date == "2007-02-02", ]
  energy <- rbind(energyone,energytwo)
  
  #generate plot
  with(energy,hist(as.numeric(Global_active_power), col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))  
  
  #save to PNG file of size 480x480 pixels
  dev.copy(png,file="plot1.png", width = 480, height = 480)
  dev.off()
  
}