plot2<-function()
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
  #my_data$day<-weekdays(as.Date(my_data$Date))
  
  #Removing Total Data
  rm(tot_data)
  
  #plotting data to png file
  png(file="plot2.png")
  plot(my_data$Global_active_power~my_data$DateTime,type="l",ylab="Global Active Power (kilowatts)",xlab="")
  dev.off()
}