plot3<-function()
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
  

  
with(my_data,{plot(Sub_metering_1~DateTime,type="l",ylab="Energy Sub Metering",xlab="")
     lines(Sub_metering_2~DateTime,type="l",col="red",ylab="")
     lines(Sub_metering_3~DateTime,type="l",col="blue",ylab="")})
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()

}