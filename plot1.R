plot1<-function()
{
  #Reading Data
  tot_data<-read.csv("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
  
  #Converting Date Class
  tot_data$Date<-as.Date(tot_data$Date,format="%d/%m/%Y")
  
  #Subsetting Data
  my_data<-subset(tot_data,subset=(Date=="2007-2-1" | Date=="2007-2-2"))
  
  #Converting Time Class
  datetime<-paste(as.Date(my_data$Date),my_data$Time)
  my_data$DateTime<-as.POSIXct(datetime)
  
  #Removing Total Data
  rm(tot_data)
  
  #Plotting Data
  hist(my_data$Global_active_power, xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red", main="Global Active Power")
  
  #Saving Plot to .png file
  dev.copy(png, file="plot1.png", height=480, width=480)
  dev.off()
}